#!/usr/bin/perl

package main;

our $config;
our $options;

package ChordPro::Delegate::Lilypond;

use strict;
use warnings;
use utf8;
use File::Spec;
use File::Temp ();
use File::LoadLines;
use feature 'state';

use ChordPro::Utils;
use Text::ParseWords qw(shellwords);

sub DEBUG() { $config->{debug}->{ly} }

sub ly2svg {
    my ( $s, $pw, $elt ) = @_;

    state $imgcnt = 0;
    state $td = File::Temp::tempdir( CLEANUP => !$config->{debug}->{ly} );

    $imgcnt++;
    my $src  = File::Spec->catfile( $td, "tmp${imgcnt}.ly" );
    my $svg  = File::Spec->catfile( $td, "tmp${imgcnt}.svg" );

    my $fd;
    unless ( open( $fd, '>:utf8', $src ) ) {
	warn("Error in Lilypond embedding: $src: $!\n");
	return;
    }

    my $need_version = 1;
    my @pre;
    for ( keys(%{$elt->{opts}}) ) {

	if ( $_ eq "version" ) {
	    push( @pre, "\\version \"", $elt->{opts}->{$_}, "\"" );
	    warn ( "\\version \"", $elt->{opts}->{$_}, "\"\n" ) if DEBUG;
	    $need_version = 0;
	}
	else {
	    push( @pre, '%%'.$_." ".$elt->{opts}->{$_} );
	    warn('%%'.$_." ".$elt->{opts}->{$_}."\n") if DEBUG;
	}
    }

    for ( @{ $config->{delegates}->{ly}->{preamble} } ) {
	push( @pre, $_ );
	warn( "$_\n") if DEBUG;
	$need_version = 0 if /^\\version\s+/;
    }

    if ( $need_version ) {
	my $v = "2.21.0";
	unshift( @pre, "\\version \"$v\"" );
	warn("ly: no \\version seen, assuming \"$v\"\n");
    }
    printf $fd "$_\n" for @pre,
      "#(ly:set-option 'crop #t)",
      "\\header { tagline = ##f }";

    @pre = ();
    my @data = @{$elt->{data}};
    while ( @data ) {
	$_ = shift(@data);
	unshift( @data, $_ ), last if /^[%\\]/; # LP data
	push( @pre, $_ );
    }
    if ( @pre && !@data ) {	# no LP found
	@data = @pre;
	@pre = ();
    }

    my $kv = { %$elt };
    $kv = parse_kv( @pre ) if @pre;
    # Copy. We assume the user knows how to write LilyPond.
    for ( @data ) {
	print $fd $_, "\n";
	warn($_, "\n") if DEBUG;
    }

    unless ( close($fd) ) {
	warn("Error in Lilypond embedding: $src: $!\n");
	return;
    }

    if ( $kv->{width} ) {
	$pw = $kv->{width};
    }

    state $lilypond = findexe( "lilypond", "silent" );
    unless ( $lilypond ) {
	warn("Error in Lilypond embedding: missing 'lilypond' tool.\n");
	return;
    }

    my @cmd = ( $lilypond, qw( -dno-point-and-click --svg ) );
    push( @cmd, "--silent" ) unless DEBUG;
    ( my $im1 = $svg ) =~ s/\.\w+$//;
    push( @cmd, "-o", $im1, $src );
    my $ret = sys( @cmd );

    if ( $ret ) {
	warn( sprintf( "Error in Lilypond embedding (ret = 0x%x)\n", $ret ) );
	return;
    }
    if ( ! -s "$im1.cropped.svg" ) {
	warn("Error in Lilypond embedding (no output?)\n");
	return;
    }

    warn("SVG: ", -s $svg, " bytes\n") if $config->{debug}->{ly};
    return
	  { type => "svg",
	    uri  => "$im1.cropped.svg",
	    opts => { center => $kv->{center},
		      scale  => $kv->{scale},
		      split  => $kv->{split},
		    } };
}

sub ly2image {
    croak("Lilypond: Please adjust your delegate config to use handler \"ly2svg\" instead of \"ly2image\"");
}

# Pre-scan.
sub options( $data ) {

    my @pre;
    while ( @$data ) {
	$_ = shift(@$data);
	unshift( @$data, $_ ), last if /^[%\\]/; # LP data
	push( @pre, $_ );
    }
    if ( @pre && !@$data ) {	# no LP found
	return;
    }

    my $kv = parse_kv( @pre ) if @pre;
    $kv;
}

1;
