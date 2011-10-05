object BMViewerCustomers: TBMViewerCustomers
  Left = 240
  Top = 198
  BorderStyle = bsDialog
  Caption = 'BMViewerCustomers'
  ClientHeight = 602
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 841
    Height = 49
    Caption = 'GroupBox1'
    TabOrder = 0
    object DBEditCustomerCode: TDBEdit
      Left = 128
      Top = 16
      Width = 193
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 0
    end
    object DBEditTAXCode: TDBEdit
      Left = 560
      Top = 16
      Width = 257
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 64
    Width = 841
    Height = 241
    Caption = 'GroupBox2'
    TabOrder = 1
    object DBEditTitle: TDBEdit
      Left = 72
      Top = 24
      Width = 65
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 0
    end
    object DBEditName: TDBEdit
      Left = 72
      Top = 56
      Width = 233
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 1
    end
    object DBEditStreet: TDBEdit
      Left = 72
      Top = 88
      Width = 233
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 2
    end
    object DBEditCountry: TDBEdit
      Left = 72
      Top = 120
      Width = 41
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 3
    end
    object DBEditZIPCode: TDBEdit
      Left = 120
      Top = 120
      Width = 73
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 4
    end
    object DBEditCity: TDBEdit
      Left = 72
      Top = 152
      Width = 233
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 5
    end
    object DBEditState: TDBEdit
      Left = 144
      Top = 184
      Width = 161
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 6
    end
    object DBEditPostalCode: TDBEdit
      Left = 72
      Top = 184
      Width = 65
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 7
    end
    object DBEditPhone: TDBEdit
      Left = 480
      Top = 24
      Width = 193
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 8
    end
    object DBEditFax: TDBEdit
      Left = 480
      Top = 56
      Width = 193
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 9
    end
    object DBEditMobilePhone: TDBEdit
      Left = 480
      Top = 88
      Width = 193
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 10
    end
    object DBEditEmail: TDBEdit
      Left = 480
      Top = 120
      Width = 273
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 11
    end
  end
end
