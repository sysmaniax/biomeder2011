object BMViewerMain: TBMViewerMain
  Left = 224
  Top = 93
  Width = 1045
  Height = 738
  Caption = 'BMViewerMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = Form1Show
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 1025
    Height = 625
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
  end
  object EditFindString: TEdit
    Left = 120
    Top = 640
    Width = 233
    Height = 21
    TabOrder = 1
    OnKeyDown = EditFindStringKeyDown
  end
  object btnFind: TButton
    Left = 360
    Top = 640
    Width = 105
    Height = 25
    Caption = 'btnFind'
    TabOrder = 2
    OnClick = btnFindClick
  end
  object cbTables: TComboBox
    Left = 472
    Top = 640
    Width = 177
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object btnChangeTable: TButton
    Left = 656
    Top = 640
    Width = 113
    Height = 25
    Caption = 'btnChangeTable'
    TabOrder = 4
    OnClick = btnChangeTableClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=biome' +
      'd'
    LoginPrompt = False
    Left = 936
    Top = 638
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Prodotti'
    Left = 904
    Top = 638
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 1000
    Top = 638
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select ArtNo, Nome, PrezzoNetto, Prezzo, IVA FROM Prodotti ORDER' +
        ' BY Nome ASC;')
    Left = 968
    Top = 638
  end
end
