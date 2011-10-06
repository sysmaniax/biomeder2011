program bmviewer;

uses
  Forms,
  UnitFormMain in 'UnitFormMain.pas' {BMViewerMain},
  UnitFormDetails in 'UnitFormDetails.pas' {BMViewerDetails},
  UnitMiscShared in 'UnitMiscShared.pas',
  UnitFormCustomers in 'UnitFormCustomers.pas' {BMViewerCustomers},
  UnitFormPrinting in 'UnitFormPrinting.pas' {Form1},
  UnitDataModuleMain in 'UnitDataModuleMain.pas' {DataModuleMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBMViewerMain, BMViewerMain);
  Application.CreateForm(TBMViewerDetails, BMViewerDetails);
  Application.CreateForm(TBMViewerCustomers, BMViewerCustomers);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.Run;
end.
