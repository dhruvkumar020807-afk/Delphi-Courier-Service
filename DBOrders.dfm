object DMOrders: TDMOrders
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 217
  Width = 321
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\PACKAGE' +
      ' ORDER.mdb;Persist Security Info=False'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 144
    Top = 96
  end
end
