program bmviewer;

uses
  Forms,
  UnitFormMain in 'UnitFormMain.pas' {Form1},
  UnitFormDetails in 'UnitFormDetails.pas' {Form2},
  UnitMiscShared in 'UnitMiscShared.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
