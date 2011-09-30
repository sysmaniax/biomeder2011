unit UnitFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TBMViewerMain = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    EditFindString: TEdit;
    btnFind: TButton;
    cbTables: TComboBox;
    btnChangeTable: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure EditFindStringKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnChangeTableClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Form1Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BMViewerMain: TBMViewerMain;
  strSQLQueryProducts: string;
  strSQLQueryProductsOrderBy: string;
  strSQLQueryCustomers: string;
  strSQLQueryCustomersOrderBy: string;
  strSQLQueryInvoices: string;
  strSQLQueryInvoicesOrderBy: string;

implementation

uses UnitFormDetails, UnitMiscShared, UnitFormCustomers;

{$R *.dfm}

procedure TBMViewerMain.FormCreate(Sender: TObject);
begin
  iQueryType := QUERY_TYPE_PRODUCTS_TABLE;

  // Form1.WindowState := wsMaximized;
  BMViewerMain.Position := poScreenCenter;
  EditFindString.Text := '';
  strSQLQueryProducts:='Select ArtNo, Nome, PrezzoNetto, Prezzo, avail, IVA FROM ' + TABLE_NAME_PRODUCTS + ' WHERE Nome Like ''%';
  strSQLQueryProductsOrderBy := '%'' ORDER BY ArtNo ASC;';

  strSQLQueryCustomers:='Select CodiceCliente, Qualifica, Nome, Via, Paese, CAP, Citta, Prov, Telefono, Fax, Cellulare, Email, PIVA_CF FROM ' + TABLE_NAME_CUSTOMERS + ' WHERE Nome Like ''%';
  strSQLQueryCustomersOrderBy := '%'' ORDER BY CodiceCliente ASC;';

  strSQLQueryInvoices:='Select NumeroFattura, CodiceCliente, Nome,  DataFattura, TotaleFattura FROM ' + TABLE_NAME_INVOICES + ' WHERE Nome Like ''%';
  strSQLQueryInvoicesOrderBy := '%'' ORDER BY NumeroFattura ASC;';

  cbTables.Items.Add (TABLE_NAME_PRODUCTS);
  cbTables.Items.Add (TABLE_NAME_CUSTOMERS);
  cbTables.Items.Add (TABLE_NAME_INVOICES);
  cbTables.ItemIndex := 0;

  btnFind.Caption := '&Trova...';
  btnChangeTable.Caption := '&Cambia tabella';

end;

procedure TBMViewerMain.btnFindClick(Sender: TObject);
begin
  btnChangeTableClick(Sender);
  // ADOQuery1.SQL.Clear;
  // ADOQuery1.SQL.Add('Select ArtNo, Nome, PrezzoNetto, Prezzo, IVA FROM Prodotti WHERE Nome Like ''%' + Edit1.Text + '%'' ORDER BY ArtNo ASC;');
  // ADOQuery1.SQL.Add(strSQLQueryProdotti + Edit1.Text + strSQLQueryOrderByProdotti);
  // ADOQuery1.Open;
end;

procedure TBMViewerMain.EditFindStringKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then btnFind.Click;
end;

procedure TBMViewerMain.btnChangeTableClick(Sender: TObject);
begin
  ADOTable1.Close;
//  ADOTable1.ClearFields;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  case cbTables.ItemIndex of
  QUERY_TYPE_PRODUCTS_TABLE: begin ADOTable1.TableName := TABLE_NAME_PRODUCTS; ADOQuery1.SQL.Add(strSQLQueryProducts + EditFindString.Text + strSQLQueryProductsOrderBy); end;
  QUERY_TYPE_CUSTOMERS_TABLE: begin ADOTable1.TableName := TABLE_NAME_CUSTOMERS; ADOQuery1.SQL.Add(strSQLQueryCustomers + EditFindString.Text + strSQLQueryCustomersOrderBy); end;
  QUERY_TYPE_INVOICES_TABLE: begin ADOTable1.TableName := TABLE_NAME_INVOICES; ADOQuery1.SQL.Add(strSQLQueryInvoices + EditFindString.Text + strSQLQueryInvoicesOrderBy); end;
  end;
  iQueryType := cbTables.ItemIndex;
  ADOTable1.Open;
  ADOQuery1.Open;
  EditFindString.SetFocus;
  ADOTable1.First;
end;

procedure TBMViewerMain.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then self.DBGrid1DblClick(Sender);
end;

procedure TBMViewerMain.DBGrid1DblClick(Sender: TObject);
var strSQLQuerySelectedRow: string;
begin
    {$IFDEF Debug}
    Application.MessageBox(PAnsiChar(IntToStr(DBGrid1.Fields[0].Value)), 'Sel');
    // SelectedField  Fields[DBGrid1.SelectedIndex].Value)), 'Selected'); //ADOTable1.Properties.Count)) ,'Selected')
    {$ENDIF}
  case iQueryType of
    QUERY_TYPE_PRODUCTS_TABLE: BMViewerDetails.ShowModal;
    QUERY_TYPE_CUSTOMERS_TABLE: BMViewerCustomers.ShowModal;
  else
    Application.MessageBox('Not implemented yet','Debug');
  end;
end;


procedure TBMViewerMain.Form1Show(Sender: TObject);
begin
  EditFindString.SetFocus;
end;

end.
