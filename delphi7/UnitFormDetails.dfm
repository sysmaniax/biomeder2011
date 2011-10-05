object BMViewerDetails: TBMViewerDetails
  Left = 315
  Top = 273
  BorderStyle = bsDialog
  Caption = 'BMViewerDetails'
  ClientHeight = 217
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = Form2Close
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 737
    Height = 169
    Caption = 'GroupBox1'
    TabOrder = 0
    object DBEditArticleNo: TDBEdit
      Left = 112
      Top = 20
      Width = 209
      Height = 21
      DataSource = DataModuleMain.DataSource1
      TabOrder = 0
    end
    object DBEditProductName: TDBEdit
      Left = 112
      Top = 48
      Width = 209
      Height = 21
      DataSource = DataModuleMain.DataSource1
      TabOrder = 1
    end
    object DBEditNetPrice: TDBEdit
      Left = 112
      Top = 72
      Width = 209
      Height = 21
      DataSource = DataModuleMain.DataSource1
      TabOrder = 2
    end
    object DBEditVAT: TDBEdit
      Left = 112
      Top = 96
      Width = 89
      Height = 21
      DataSource = DataModuleMain.DataSource1
      TabOrder = 3
    end
    object DBEditPrice: TDBEdit
      Left = 112
      Top = 120
      Width = 209
      Height = 21
      DataSource = DataModuleMain.DataSource1
      TabOrder = 4
      OnEnter = DBEditPriceEnter
    end
    object DBCheckBoxAvail: TDBCheckBox
      Left = 328
      Top = 16
      Width = 153
      Height = 25
      Caption = 'DBCheckBoxAvail'
      DataSource = DataModuleMain.DataSource1
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object btnOK: TButton
    Left = 8
    Top = 184
    Width = 97
    Height = 33
    Caption = 'btnOK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnAbort: TButton
    Left = 640
    Top = 184
    Width = 105
    Height = 33
    Caption = 'btnAbort'
    TabOrder = 2
    OnClick = btnAbortClick
  end
end
