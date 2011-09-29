program bmviewer;

uses
  Forms,
  UnitFormMain in 'UnitFormMain.pas' {BMViewerMain},
  UnitFormDetails in 'UnitFormDetails.pas' {BMViewerDetails},
  UnitMiscShared in 'UnitMiscShared.pas',
  UnitFormCustomers in 'UnitFormCustomers.pas' {BMViewerCustomers};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBMViewerMain, BMViewerMain);
  Application.CreateForm(TBMViewerDetails, BMViewerDetails);
  Application.CreateForm(TBMViewerCustomers, BMViewerCustomers);
  Application.Run;
end.
