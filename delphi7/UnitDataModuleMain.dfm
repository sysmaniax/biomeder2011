object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  OnCreate = CreateModule
  Left = 192
  Top = 127
  Height = 150
  Width = 215
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    MasterSource = DataSource1
    TableName = 'Prodotti'
    Left = 32
    Top = 6
  end
  object ADOConnection1: TADOConnection
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 62
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      
        'Select ArtNo, Nome, PrezzoNetto, Prezzo, IVA, avail FROM Prodott' +
        'i ORDER BY Nome ASC;')
    Left = 152
    Top = 6
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 128
    Top = 64
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 8
  end
end
