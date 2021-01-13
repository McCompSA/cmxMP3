unit fmID3;
{
--------------------------------------------------------------------------------
    ID3 v1.1 record editor form
--------------------------------------------------------------------------------
    yyyy.mm.dd  ini description
    2003.08.23  cdt initial creation
--------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, cmxMP3;

type
  TfrmID3 = class(TForm)
    btnOK: TButton;
    bntCancel: TButton;
    edtTitle: TEdit;
    edtArtist: TEdit;
    edtAlbum: TEdit;
    edtComment: TEdit;
    lblTitle: TLabel;
    lblArtist: TLabel;
    lblAlbum: TLabel;
    lblComment: TLabel;
    speTrack: TSpinEdit;
    lblTrack: TLabel;
    speYear: TSpinEdit;
    lblYear: TLabel;
    cboGenre: TComboBox;
    lblGenre: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bntCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    fMP3: TcmxMP3;
  public
    property MP3 : TcmxMP3
        read fMP3 write fMP3;
  end; // TfrmID3

  // accessor function
function ShowID3(aMP3 : TcmxMP3) : TModalResult;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
function ShowID3(aMP3 : TcmxMP3) : TModalResult;
var
    frmID3 : TfrmID3;
begin
    // create form
    frmID3 := TfrmID3.Create( nil );
    try
        // pass MP3 object to work with
        frmID3.MP3 := aMP3;
        // show the form and return modeal result
        Result := frmID3.ShowModal;
    finally
        // release (free) the form
        frmID3.Release;
    end; // try finally
end; // ShowID3

//------------------------------------------------------------------------------
procedure TfrmID3.FormShow(Sender: TObject);
var
    i, intMax : integer;
begin
    // fill dialog fields
    edtTitle.Text := MP3.Title;
    edtArtist.Text := MP3.Artist;
    edtAlbum.Text := MP3.Album;
    edtComment.Text := MP3.Comment;
    speYear.Value := StrToIntDef( MP3.Year,0 );
    speTrack.Value := MP3.Track;

    // fill genre combo
    cboGenre.Clear;
    intMax := MP3.MaxGenreID;
    for i := 0 to intMax do
        begin
        cboGenre.Items.Add( MP3.GenreText[ i ] );
        end; // for
    // set index value
    cboGenre.ItemIndex := MP3.GenreNdx;
end; // FormShow

//------------------------------------------------------------------------------
procedure TfrmID3.bntCancelClick(Sender: TObject);
begin
    // return Cancel from ShowModal
    ModalResult := mrCancel;
end; // bntCancelClick

//------------------------------------------------------------------------------
procedure TfrmID3.btnOKClick(Sender: TObject);
begin
    // call method to modify the ID3 record
    MP3.ChgID3( edtTitle.Text,edtArtist.Text,edtAlbum.Text,edtComment.Text
        ,speYear.Value,speTrack.Value,cboGenre.ItemIndex );
    // return OK from ShowModal
    ModalResult := mrOK;
end; // btnOKClick

//------------------------------------------------------------------------------
end.
