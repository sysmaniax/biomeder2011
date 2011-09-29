unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
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
  Form1: TForm1;
  strSQLQueryProducts: string;
  strSQLQueryProductsOrderBy: string;
  strSQLQueryCustomers: string;
  strSQLQueryCustomersOrderBy: string;
  strSQLQueryInvoices: string;
  strSQLQueryInvoicesOrderBy: string;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  iQueryType := QUERY_TYPE_PRODUCTS_TABLE;

  // Form1.WindowState := wsMaximized;
  Form1.Position := poScreenCenter;
  Edit1.Text := '';
  strSQLQueryProducts:='Select ArtNo, Nome, PrezzoNetto, Prezzo, IVA FROM ' + TABLE_NAME_PRODUCTS + ' WHERE Nome Like ''%';
  strSQLQueryProductsOrderBy := '%'' ORDER BY ArtNo ASC;';

  strSQLQueryCustomers:='Select CodiceCliente, Qualifica, Nome, Via, Paese, CAP, Citta, Prov, Telefono, Fax, Cellulare, Email, PIVA_CF FROM ' + TABLE_NAME_CUSTOMERS + ' WHERE Nome Like ''%';
  strSQLQueryCustomersOrderBy := '%'' ORDER BY CodiceCliente ASC;';

  strSQLQueryInvoices:='Select NumeroFattura, CodiceCliente, Nome,  DataFattura, TotaleFattura FROM ' + TABLE_NAME_INVOICES + ' WHERE Nome Like ''%';
  strSQLQueryInvoicesOrderBy := '%'' ORDER BY NumeroFattura ASC;';

  ComboBox1.Items.Add (TABLE_NAME_PRODUCTS);
  ComboBox1.Items.Add (TABLE_NAME_CUSTOMERS);
  ComboBox1.Items.Add (TABLE_NAME_INVOICES);
  ComboBox1.ItemIndex := 0;

  Button1.Caption := '&Trova...';
  Button2.Caption := '&Cambia tabella';

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button2Click(Sender);
  // ADOQuery1.SQL.Clear;
  // ADOQuery1.SQL.Add('Select ArtNo, Nome, PrezzoNetto, Prezzo, IVA FROM Prodotti WHERE Nome Like ''%' + Edit1.Text + '%'' ORDER BY ArtNo ASC;');
  // ADOQuery1.SQL.Add(strSQLQueryProdotti + Edit1.Text + strSQLQueryOrderByProdotti);
  // ADOQuery1.Open;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then Button1.Click;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOTable1.Close;
//  ADOTable1.ClearFields;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  case ComboBox1.ItemIndex of
  QUERY_TYPE_PRODUCTS_TABLE: begin ADOTable1.TableName := TABLE_NAME_PRODUCTS; ADOQuery1.SQL.Add(strSQLQueryProducts + Edit1.Text + strSQLQueryProductsOrderBy); end;
  QUERY_TYPE_CUSTOMERS_TABLE: begin ADOTable1.TableName := TABLE_NAME_CUSTOMERS; ADOQuery1.SQL.Add(strSQLQueryCustomers + Edit1.Text + strSQLQueryCustomersOrderBy); end;
  QUERY_TYPE_INVOICES_TABLE: begin ADOTable1.TableName := TABLE_NAME_INVOICES; ADOQuery1.SQL.Add(strSQLQueryInvoices + Edit1.Text + strSQLQueryInvoicesOrderBy); end;
  end;
  iQueryType := ComboBox1.ItemIndex;
  ADOTable1.Open;
  ADOQuery1.Open;
  Edit1.SetFocus;
  ADOTable1.First;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then Form1.DBGrid1DblClick(Sender);
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var strSQLQuerySelectedRow: string;
begin
    {$IFDEF Debug}
    Application.MessageBox(PAnsiChar(IntToStr(DBGrid1.Fields[0].Value)), 'Sel');
    // SelectedField  Fields[DBGrid1.SelectedIndex].Value)), 'Selected'); //ADOTable1.Properties.Count)) ,'Selected')
    {$ENDIF}
  Form2.ShowModal;
end;


procedure TForm1.Form1Show(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
