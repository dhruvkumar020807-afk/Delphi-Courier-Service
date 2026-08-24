object DMUsers: TDMUsers
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 267
  Width = 459
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DATABASES\USERS' +
      ' DATABASE.mdb;Persist Security Info=False'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 240
    Top = 112
  end
end
