{$DEFINE DEBUG}
unit UnitDataModuleMain;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModuleMain = class(TDataModule)
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADODataSet1: TADODataSet;
    procedure CreateModule(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleMain: TDataModuleMain;

implementation

uses UnitMiscShared;

{$R *.dfm}

procedure TDataModuleMain.CreateModule(Sender: TObject);
begin
  //DataModuleMain.ADOConnection1.Close();
  {$IFDEF DEBUG}
    ADOConnection1.ConnectionString :=
    '"Provider=MSDASQL.1;Persist Security Info=False;Data Source=biomedtest;Extended Properties="DSN=biomed;DBQ=J:\database\biomedtest.mdb;DriverId=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;"';
  {ELSE}
    // DataModuleMain.ADOConnection1.ConnectionString :=
    // '"Provider=MSDASQL.1;Persist Security Info=False;Data Source=biomed;Extended Properties="DSN=biomed;DBQ=J:\database\biomed.mdb;DriverId=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;"';
  {$ENDIF}

  strSQLQueryProducts:='Select ArtNo, Nome, PrezzoNetto, Prezzo, avail, IVA FROM ' + TABLE_NAME_PRODUCTS + ' WHERE Nome Like ''%';
  strSQLQueryProductsOrderBy := '%'' ORDER BY ArtNo ASC;';

  strSQLQueryCustomers:='Select CodiceCliente, Qualifica, Nome, Via, Paese, CAP, Citta, Prov, Telefono, Fax, Cellulare, Email, PIVA_CF FROM ' + TABLE_NAME_CUSTOMERS + ' WHERE Nome Like ''%';
  strSQLQueryCustomersOrderBy := '%'' ORDER BY CodiceCliente ASC;';

  strSQLQueryInvoices:='Select NumeroFattura, CodiceCliente, Nome,  DataFattura, TotaleFattura FROM ' + TABLE_NAME_INVOICES + ' WHERE Nome Like ''%';
  strSQLQueryInvoicesOrderBy := '%'' ORDER BY NumeroFattura ASC;';

  //DataModuleMain.ADOConnection1.Open();

end;

end.
