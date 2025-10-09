object DataModuleLogin: TDataModuleLogin
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QryLogin: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from FARMACIA')
    Left = 200
    Top = 224
  end
end
