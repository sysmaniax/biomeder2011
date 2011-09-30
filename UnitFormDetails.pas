unit UnitFormDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TBMViewerDetails = class(TForm)
    GroupBox1: TGroupBox;
    DBEditArticleNo: TDBEdit;
    DBEditProductName: TDBEdit;
    DBEditNetPrice: TDBEdit;
    DBEditVAT: TDBEdit;
    DBEditPrice: TDBEdit;
    btnOK: TButton;
    btnAbort: TButton;
    DBCheckBoxAvail: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure DBEditPriceEnter(Sender: TObject);
    procedure Form2Close(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnAbortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BMViewerDetails: TBMViewerDetails;

implementation

uses UnitFormMain, UnitMiscShared;

{$R *.dfm}

procedure TBMViewerDetails.FormShow(Sender: TObject);
begin
  // DBEdit1.DataSource := Form1.DataSource1;
  BMViewerMain.DBGrid1.ReadOnly := False;
  case iQueryType of
  QUERY_TYPE_PRODUCTS_TABLE:
    begin
        DBEditArticleNo.DataField := 'ArtNo';
        DBEditProductName.DataField := 'Nome';
        DBEditNetPrice.DataField := 'PrezzoNetto';
        DBEditVAT.DataField := 'IVA';
        DBEditPrice.DataField := 'Prezzo';

        DBEditArticleNo.Text := BMViewerMain.DBGrid1.Fields[0].Value;
        DBEditProductName.Text := BMViewerMain.DBGrid1.Fields[1].Value;
        DBEditNetPrice.Text := BMViewerMain.DBGrid1.Fields[2].Value;
        DBEditVAT.Text := BMViewerMain.DBGrid1.Fields[4].Value;
        DBEditPrice.Text := BMViewerMain.DBGrid1.Fields[3].Value;
        
        DBEditArticleNo.SetFocus;


    end;
  end;
  BMViewerMain.DBGrid1.ReadOnly := True;
  BMViewerMain.ADOQuery1.Edit;
end;

procedure TBMViewerDetails.DBEditPriceEnter(Sender: TObject);
var fNetPrice, fVAT, fTotalPrice: Double;
begin
  if iQueryType = QUERY_TYPE_PRODUCTS_TABLE then
  begin
    fNetPrice := StrToFloat(DBEditNetPrice.Text);
    fVAT := StrToFloat(DBEditVAT.Text);
    fTotalPrice := (fNetPrice / 100) * fVAT + fNetPrice;
    DBEditPrice.Text := FloatToStr(fTotalPrice);
  end;
end;

procedure TBMViewerDetails.Form2Close(Sender: TObject; var Action: TCloseAction);
var
  E: Exception;
begin
end;

procedure TBMViewerDetails.btnOKClick(Sender: TObject);
begin
  //try
    if BMViewerMain.ADOQuery1.Modified = True then
    begin
      BMViewerMain.ADOQuery1.UpdateRecord;
      BMViewerMain.ADOQuery1.Post;

    end;

    DBEditArticleNo.DataField := '';
    DBEditProductName.DataField := '';
    DBEditNetPrice.DataField := '';
    DBEditVAT.DataField := '';
    DBEditPrice.DataField := '';

    DBEditArticleNo.Text := '';
    DBEditProductName.Text := '';
    DBEditNetPrice.Text := '';
    DBEditVAT.Text := '';
    DBEditPrice.Text := '';


    self.Close;
  //except
  //   Application.MessageBox('Error','Error');
  //   BMViewerMain.ADOQuery1.CancelUpdates;
  // end;
  //finally

end;

procedure TBMViewerDetails.btnAbortClick(Sender: TObject);
var
  iRes: integer;
  strMessage: String;
begin
  if BMViewerMain.ADOQuery1.Modified = True then
  begin
    iRes := Application.MessageBox(STR_MSG_SAVE_MODIFIED_RECORDS,'',MB_YESNO);
    case iRes of
      IDYES:
        begin
          BMViewerMain.ADOQuery1.UpdateRecord;
          BMViewerMain.ADOQuery1.Post;
          Application.MessageBox(STR_MSG_CHANGES_SAVED,'',MB_OK);
          self.Close
        end;
      IDNO: begin BMViewerMain.ADOQuery1.CancelUpdates; self.Close; end;
    end; // case
    self.Close;
  end;
  self.Close;

  // BMViewerMain.ADOQuery1.CancelUpdates;
  // self.Close;
end;

procedure TBMViewerDetails.FormCreate(Sender: TObject);
begin
  btnOK.Caption := '&OK';
  btnAbort.Caption := 'Ann&ulla';
end;

end.
