unit UnitFormCustomers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TBMViewerCustomers = class(TForm)
    GroupBox1: TGroupBox;
    DBEditCustomerCode: TDBEdit;
    DBEditTAXCode: TDBEdit;
    GroupBox2: TGroupBox;
    DBEditTitle: TDBEdit;
    DBEditName: TDBEdit;
    DBEditStreet: TDBEdit;
    DBEditCountry: TDBEdit;
    DBEditZIPCode: TDBEdit;
    DBEditCity: TDBEdit;
    DBEditState: TDBEdit;
    DBEditPostalCode: TDBEdit;
    DBEditPhone: TDBEdit;
    DBEditFax: TDBEdit;
    DBEditMobilePhone: TDBEdit;
    DBEditEmail: TDBEdit;
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
