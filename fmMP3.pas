unit fmMP3;
{
--------------------------------------------------------------------------------
    sample .mp3 file player
--------------------------------------------------------------------------------
    yyyy.mm.dd  ini description
    2003.08.23  cdt initial creation
--------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cmxMP3, ComCtrls, Buttons, ExtCtrls;

type
  eMciDeviceError = class( Exception );

  TfrmMP3 = class(TForm)
    lbxMP3: TListBox;
    pnlBottom: TPanel;
    btnID3: TButton;
    pbMP3: TProgressBar;
    spbPlay: TSpeedButton;
    spbPause: TSpeedButton;
    spbStop: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure spbPlayClick(Sender: TObject);
    procedure spbPauseClick(Sender: TObject);
    procedure spbStopClick(Sender: TObject);
    procedure btnID3Click(Sender: TObject);
  private
    fMP3 : TcmxMP3;
    // private methods
    procedure LoadListBox(const aPath : string);
    procedure OnProgress(Sender : TObject; aSecs : integer);
    procedure OnCompletion(Sender : TObject);
  public
    { Public declarations }
  end; // TfrmMP3

var
  frmMP3: TfrmMP3;

implementation

{$R *.dfm}

uses
  fmID3;

//------------------------------------------------------------------------------
procedure TfrmMP3.FormCreate(Sender: TObject);
begin
    {
        for this sample, .mp3 files are assumed to reside in the directory
        where this program is
    }
    LoadListBox( ExtractFilePath( Application.ExeName ) );
    lbxMP3.ItemIndex := 0;
end; // FormCreate

//------------------------------------------------------------------------------
procedure TfrmMP3.LoadListBox(const aPath: string);
var
    lSR : TSearchRec;
    strPath : string;
begin
    // clear the list box
    lbxMP3.Clear;

    {
        set path to directory where .mp3 files are
        note: ifdef is for Delphi 5 support
    }
{$IFDEF VER130 }
    strPath := IncludeTrailingBackSlash( aPath ) + '*.mp3';
{$ELSE}
    strPath := IncludeTrailingPathDelimiter( aPath ) + '*.mp3';
{$ENDIF}

    // initialize find find
    if( FindFirst( strPath,faAnyFile,lSR ) <> 0 )then Exit;
    // loop thru files and add to list box
    repeat
        lbxMP3.Items.Add( ChangeFileExt( lSR.Name,'' ) );
    until FindNext( lSR ) <> 0;
    // release file find resources
    FindClose( lSR );
end; // LoadListBox

//------------------------------------------------------------------------------
procedure TfrmMP3.spbPlayClick(Sender: TObject);
begin
    // exit if no .mp3 files were loaded
    if( lbxMP3.ItemIndex = -1 )then Exit;

    // if object exists
    if( fMP3 <> nil )then
        begin
        // stop play
        fMP3.Stop;
        {
            if object represents .mp3 other than the one selected
            free the object so that one will be created below for the
            selected .mp3
        }
        if( fMP3.FileName <> lbxMP3.Items[ lbxMP3.ItemIndex ] )then
            begin
            FreeAndNil( fMP3 );
            end; // if
        end; // if

    // if no object is present; create one
    if( fMP3 = nil )then
        begin
        fMP3 := TcmxMP3.Create( ExtractFilePath( Application.ExeName )
            + lbxMP3.Items[ lbxMP3.ItemIndex ] + '.mp3' );
        end; // if

    // setup progress bar
    pbMP3.Min := 0;
    pbMP3.Max := fMP3.LengthInSeconds;
    fMP3.OnPlayProgress := OnProgress;
    fMP3.OnPlayComplete := OnCompletion;

    // play .mp3 file
    fMP3.Play;
end; // spbPlayClick

//------------------------------------------------------------------------------
procedure TfrmMP3.OnProgress(Sender: TObject; aSecs: integer);
begin
    pbMP3.Position := aSecs;
end; // OnProgress

//------------------------------------------------------------------------------
procedure TfrmMP3.OnCompletion(Sender: TObject);
begin
    pbMP3.Position := 0;
end; // OnCompletion

//------------------------------------------------------------------------------
procedure TfrmMP3.spbPauseClick(Sender: TObject);
var
    lState : TMPMode;
begin
    // exit if object doesn't exist
    if( fMP3 = nil )then Exit;

    // get player state
    lState := fMP3.State;
    // either resume or pause depending on current state
    if( lState = mpPaused )then
        begin
        fMP3.Resume;
        end // if
    else if( lState = mpPlaying )then
        begin
        fMP3.Pause;
        end; // else if
end; // spbPauseClick

//------------------------------------------------------------------------------
procedure TfrmMP3.spbStopClick(Sender: TObject);
begin
    // exit if object doesn't exist
    if( fMP3 = nil )then Exit;

    // stop the player
    fMP3.Stop;
    // re-position progress bar to the start
    pbMP3.Position := 0;
    // kill the object
    FreeAndNil( fMP3 );
end; // spbStopClick

//------------------------------------------------------------------------------
procedure TfrmMP3.btnID3Click(Sender: TObject);
var
    lMP3 : TcmxMP3;
begin
    // exit if no .mp3 files were loaded
    if( lbxMP3.ItemIndex = -1 )then Exit;

    // build an mp3 object for the selected file
    lMP3 := TcmxMP3.Create( ExtractFilePath( Application.ExeName )
        + lbxMP3.Items[ lbxMP3.ItemIndex ] + '.mp3' );
    try
        // show the ID3 record for this .mp3 file
        ShowID3( lMP3 );
    finally
        lMP3.Free;
    end; // try finally
end; // btnID3Click

//------------------------------------------------------------------------------
end.
