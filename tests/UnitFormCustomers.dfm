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
    object DBEdit1: TDBEdit
      Left = 128
      Top = 16
      Width = 193
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 560
      Top = 16
      Width = 257
      Height = 21
      DataSource = BMViewerMain.DataSource1
      TabOrder = 1
    end
  end
end
