program SmplMP3;

uses
  Forms,
  fmMP3 in 'fmMP3.pas' {frmMP3},
  cmxMP3 in 'cmxMP3.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMP3, frmMP3);
  Application.Run;
end.
