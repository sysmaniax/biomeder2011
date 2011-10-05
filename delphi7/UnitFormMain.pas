unit UnitFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TBMViewerMain = class(TForm)
    DBGrid1: TDBGrid;
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

implementation

uses UnitFormDetails, UnitMiscShared, UnitFormCustomers,
  UnitDataModuleMain;

{$R *.dfm}

procedure TBMViewerMain.FormCreate(Sender: TObject);
begin
  iQueryType := QUERY_TYPE_PRODUCTS_TABLE;
  {$IFDEF DEBUG}
    self.Caption := self.Caption + ' [DEBUG]';
  {$ENDIF}
  
  // Form1.WindowState := wsMaximized;
  BMViewerMain.Position := poScreenCenter;
  EditFindString.Text := '';
  
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
  DataModuleMain.ADOTable1.Close;
//  ADOTable1.ClearFields;

  DataModuleMain.ADOQuery1.Close;
  DataModuleMain.ADOQuery1.SQL.Clear;
  case cbTables.ItemIndex of
  QUERY_TYPE_PRODUCTS_TABLE: begin DataModuleMain.ADOTable1.TableName := TABLE_NAME_PRODUCTS; DataModuleMain.ADOQuery1.SQL.Add(strSQLQueryProducts + EditFindString.Text + strSQLQueryProductsOrderBy); end;
  QUERY_TYPE_CUSTOMERS_TABLE: begin DataModuleMain.ADOTable1.TableName := TABLE_NAME_CUSTOMERS; DataModuleMain.ADOQuery1.SQL.Add(strSQLQueryCustomers + EditFindString.Text + strSQLQueryCustomersOrderBy); end;
  QUERY_TYPE_INVOICES_TABLE: begin DataModuleMain.ADOTable1.TableName := TABLE_NAME_INVOICES; DataModuleMain.ADOQuery1.SQL.Add(strSQLQueryInvoices + EditFindString.Text + strSQLQueryInvoicesOrderBy); end;
  end;
  iQueryType := cbTables.ItemIndex;
  DataModuleMain.ADOTable1.Open;
  //ADOQuery1.Open;
  EditFindString.SetFocus;
  DataModuleMain.ADOTable1.First;
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
