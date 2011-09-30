unit UnitFormCustomers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TBMViewerCustomers = class(TForm)
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BMViewerCustomers: TBMViewerCustomers;

implementation

uses UnitMiscShared, UnitFormMain;

{$R *.dfm}

end.
