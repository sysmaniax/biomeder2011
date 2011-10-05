unit UnitFormPrinting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TForm1 = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UnitDataModuleMain;

{$R *.dfm}

end.
