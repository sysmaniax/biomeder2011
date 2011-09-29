unit UnitFormDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TBMViewerDetails = class(TForm)
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    btnOK: TButton;
    btnAbort: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
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
        DBEdit1.DataField := 'ArtNo';
        DBEdit2.DataField := 'Nome';
        DBEdit3.DataField := 'PrezzoNetto';
        DBEdit4.DataField := 'IVA';
        DBEdit5.DataField := 'Prezzo';

        DBEdit1.Text := BMViewerMain.DBGrid1.Fields[0].Value;
        DBEdit2.Text := BMViewerMain.DBGrid1.Fields[1].Value;
        DBEdit3.Text := BMViewerMain.DBGrid1.Fields[2].Value;
        DBEdit4.Text := BMViewerMain.DBGrid1.Fields[4].Value;
        DBEdit5.Text := BMViewerMain.DBGrid1.Fields[3].Value;


    end;
  end;
  BMViewerMain.DBGrid1.ReadOnly := True;
  BMViewerMain.ADOQuery1.Edit;
end;

procedure TBMViewerDetails.DBEdit5Enter(Sender: TObject);
var fNetPrice, fVAT, fTotalPrice: Double;
begin
  if iQueryType = QUERY_TYPE_PRODUCTS_TABLE then
  begin
    fNetPrice := StrToFloat(DBEdit3.Text);
    fVAT := StrToFloat(DBEdit4.Text);
    fTotalPrice := (fNetPrice / 100) * fVAT + fNetPrice;
    DBEdit5.Text := FloatToStr(fTotalPrice);
  end;
end;

procedure TBMViewerDetails.Form2Close(Sender: TObject; var Action: TCloseAction);
var E: Exception;
begin

end;

procedure TBMViewerDetails.btnOKClick(Sender: TObject);
begin
  try
    BMViewerMain.ADOQuery1.Post;

    DBEdit1.DataField := '';
    DBEdit2.DataField := '';
    DBEdit3.DataField := '';
    DBEdit4.DataField := '';
    DBEdit5.DataField := '';

    DBEdit1.Text := '';
    DBEdit2.Text := '';
    DBEdit3.Text := '';
    DBEdit4.Text := '';
    DBEdit5.Text := '';

  self.Close;

  except
     Application.MessageBox('Error','Error');
     BMViewerMain.ADOQuery1.CancelUpdates;
  end;
  //finally

end;

procedure TBMViewerDetails.btnAbortClick(Sender: TObject);
begin
  BMViewerMain.ADOQuery1.CancelUpdates;
  self.Close;
end;

procedure TBMViewerDetails.FormCreate(Sender: TObject);
begin
  btnOK.Caption := '&OK';
  btnAbort.Caption := 'Ann&ulla';
end;

end.
