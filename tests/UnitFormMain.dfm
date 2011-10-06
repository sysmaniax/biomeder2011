object BMViewerMain: TBMViewerMain
  Left = 224
  Top = 93
  Caption = 'BMViewerMain'
  ClientHeight = 700
  ClientWidth = 1037
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
  object Button1: TButton
    Left = 360
    Top = 671
    Width = 105
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=biome' +
      'd'
    LoginPrompt = False
    Left = 808
    Top = 638
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Prodotti'
    Left = 864
    Top = 638
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 984
    Top = 638
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select ArtNo, Nome, PrezzoNetto, Prezzo, IVA, avail FROM Prodott' +
        'i ORDER BY Nome ASC;')
    Left = 920
    Top = 638
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtEndUser
    DataSet = ADOQuery1
    Left = 256
    Top = 672
  end
  object RvProject1: TRvProject
    LoadDesigner = True
    ProjectFile = 
      'E:\Developer - My Documents\Projects\biomeder\src\biomeder2011\r' +
      'eports\BMPriceList.rav'
    Left = 56
    Top = 656
  end
end
