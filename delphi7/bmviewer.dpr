program bmviewer;

uses
  Forms,
  UnitDataModuleMain in 'UnitDataModuleMain.pas' {DataModuleMain: TDataModule},
  UnitFormMain in 'UnitFormMain.pas' {BMViewerMain},
  UnitFormDetails in 'UnitFormDetails.pas' {BMViewerDetails},
  UnitMiscShared in 'UnitMiscShared.pas',
  UnitFormCustomers in 'UnitFormCustomers.pas' {BMViewerCustomers},
  UnitFormPrinting in 'UnitFormPrinting.pas' {Form1};


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.CreateForm(TBMViewerMain, BMViewerMain);
  Application.CreateForm(TBMViewerDetails, BMViewerDetails);
  Application.CreateForm(TBMViewerCustomers, BMViewerCustomers);
  Application.CreateForm(TForm1, Form1);

  Application.Run;
end.
