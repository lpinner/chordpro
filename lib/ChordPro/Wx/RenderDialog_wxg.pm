# generated by wxGlade 1.1.0pre on Sat Sep  2 20:49:34 2023
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package ChordPro::Wx::RenderDialog_wxg;

use Wx qw[:everything];
use base qw(Wx::Dialog);
use strict;

use Wx::Locale gettext => '_T';
sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: ChordPro::Wx::RenderDialog_wxg::new
    $style = wxDEFAULT_DIALOG_STYLE|wxMAXIMIZE_BOX|wxRESIZE_BORDER
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->SetTitle(_T("Preview Tasks"));
    
    $self->{sz_prefs_outer} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sz_prefs_inner} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_prefs_outer}->Add($self->{sz_prefs_inner}, 1, wxEXPAND|wxLEFT|wxRIGHT|wxTOP, 0);
    
    $self->{sizer_2} = Wx::GridBagSizer->new(5, 5);
    $self->{sz_prefs_inner}->Add($self->{sizer_2}, 1, wxEXPAND, 5);
    
    my $label_1 = Wx::StaticText->new($self, wxID_ANY, _T("Tasks"));
    $self->{sizer_2}->Add($label_1, Wx::GBPosition->new(0, 0), Wx::GBSpan->new(1, 1), wxLEFT|wxTOP, 5);
    
    $self->{sizer_1} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_2}->Add($self->{sizer_1}, Wx::GBPosition->new(0, 1), Wx::GBSpan->new(1, 1), wxEXPAND|wxTOP, 5);
    
    $self->{cb_task_no_diagrams} = Wx::CheckBox->new($self, wxID_ANY, _T("Suppress chord diagrams"));
    $self->{sizer_1}->Add($self->{cb_task_no_diagrams}, 0, 0, 0);
    
    $self->{cb_task_lyrics_only} = Wx::CheckBox->new($self, wxID_ANY, _T("Only lyrics (no chords, ABC, LilyPond, ...)"));
    $self->{sizer_1}->Add($self->{cb_task_lyrics_only}, 0, 0, 0);
    
    $self->{cb_task_decapo} = Wx::CheckBox->new($self, wxID_ANY, _T("Eliminate capo settings"));
    $self->{sizer_1}->Add($self->{cb_task_decapo}, 0, 0, 0);
    
    $self->{l_customtasks} = Wx::StaticText->new($self, wxID_ANY, _T("Custom"));
    $self->{l_customtasks}->Show(0);
    $self->{sizer_2}->Add($self->{l_customtasks}, Wx::GBPosition->new(1, 0), Wx::GBSpan->new(1, 1), wxLEFT, 5);
    
    $self->{sz_customtasks} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_2}->Add($self->{sz_customtasks}, Wx::GBPosition->new(1, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 0);
    
    $self->{sz_customtasks}->Add(0, 0, 0, 0, 0);
    
    my $static_line_5 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_5, Wx::GBPosition->new(2, 0), Wx::GBSpan->new(1, 2), wxEXPAND, 0);
    
    $self->{l_xpose} = Wx::StaticText->new($self, wxID_ANY, _T("Transpose"));
    $self->{sizer_2}->Add($self->{l_xpose}, Wx::GBPosition->new(3, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sz_xpose} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sz_xpose}, Wx::GBPosition->new(3, 1), Wx::GBSpan->new(1, 1), wxEXPAND|wxRIGHT, 5);
    
    $self->{l_xpose_from} = Wx::StaticText->new($self, wxID_ANY, _T("From"));
    $self->{sz_xpose}->Add($self->{l_xpose_from}, 0, wxALIGN_CENTER_VERTICAL|wxRIGHT, 5);
    
    $self->{ch_xpose_from} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("C"), _T("C#"), _T("Db"), _T("D"), _T("D#"), _T("Eb"), _T("E"), _T("F"), _T("F#"), _T("Gb"), _T("G"), _T("G#"), _T("Ab"), _T("A"), _T("A#"), _T("Bb"), _T("B")], );
    $self->{ch_xpose_from}->SetToolTipString(_T("Starting note for transposition"));
    $self->{ch_xpose_from}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_xpose_from}, 0, 0, 0);
    
    $self->{l_xpose_to} = Wx::StaticText->new($self, wxID_ANY, _T("To"));
    $self->{sz_xpose}->Add($self->{l_xpose_to}, 0, wxALIGN_CENTER_VERTICAL|wxFIXED_MINSIZE|wxLEFT|wxRIGHT, 5);
    
    $self->{ch_xpose_to} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("C"), _T("C#"), _T("Db"), _T("D"), _T("D#"), _T("Eb"), _T("E"), _T("F"), _T("F#"), _T("Gb"), _T("G"), _T("G#"), _T("Ab"), _T("A"), _T("A#"), _T("Bb"), _T("B")], );
    $self->{ch_xpose_to}->SetToolTipString(_T("Destination note for transposition"));
    $self->{ch_xpose_to}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_xpose_to}, 0, 0, 0);
    
    $self->{sz_xpose}->Add(2, 2, 1, wxEXPAND, 0);
    
    my $l_acc = Wx::StaticText->new($self, wxID_ANY, _T("Acc."));
    $self->{sz_xpose}->Add($l_acc, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 15);
    
    $self->{ch_acc} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Default"), _T("Sharps"), _T("Flats")], );
    $self->{ch_acc}->SetToolTipString(_T("How to treat chords that need accidentals after transposition.\nDefault is to use sharps when transposing up, and flats when transposing down."));
    $self->{ch_acc}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_acc}, 0, wxEXPAND|wxRIGHT, 0);
    
    $self->{sz_prefs_outer}->Add(1, 1, 0, wxEXPAND, 0);
    
    my $static_line_1 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sz_prefs_outer}->Add($static_line_1, 0, wxEXPAND|wxTOP, 5);
    
    $self->{sz_tasks_buttons} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_prefs_outer}->Add($self->{sz_tasks_buttons}, 0, wxALL|wxEXPAND, 5);
    
    $self->{sz_tasks_buttons}->Add(5, 1, 1, wxEXPAND, 0);
    
    $self->{b_cancel} = Wx::Button->new($self, wxID_CANCEL, "");
    $self->{sz_tasks_buttons}->Add($self->{b_cancel}, 0, 0, 0);
    
    $self->{b_ok} = Wx::Button->new($self, wxID_OK, "");
    $self->{b_ok}->SetDefault();
    $self->{sz_tasks_buttons}->Add($self->{b_ok}, 0, wxLEFT, 5);
    
    $self->{sizer_2}->AddGrowableRow(1);
    $self->{sizer_2}->AddGrowableCol(1);
    
    $self->SetSizer($self->{sz_prefs_outer});
    $self->{sz_prefs_outer}->Fit($self);
    
    $self->Layout();
    Wx::Event::EVT_CHOICE($self, $self->{ch_xpose_from}->GetId, $self->can('OnXposeFrom'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_xpose_to}->GetId, $self->can('OnXposeTo'));
    Wx::Event::EVT_BUTTON($self, $self->{b_cancel}->GetId, $self->can('OnCancel'));
    Wx::Event::EVT_BUTTON($self, $self->{b_ok}->GetId, $self->can('OnAccept'));

    # end wxGlade
    return $self;

}


sub OnXposeFrom {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::RenderDialog_wxg::OnXposeFrom <event_handler>
    warn "Event handler (OnXposeFrom) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnXposeTo {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::RenderDialog_wxg::OnXposeTo <event_handler>
    warn "Event handler (OnXposeTo) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCancel {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::RenderDialog_wxg::OnCancel <event_handler>
    warn "Event handler (OnCancel) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnAccept {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::RenderDialog_wxg::OnAccept <event_handler>
    warn "Event handler (OnAccept) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class ChordPro::Wx::RenderDialog_wxg

1;
