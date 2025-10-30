object DmPrincipal: TDmPrincipal
  Height = 600
  Width = 800
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 205
    Top = 58
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    Left = 314
    Top = 58
  end
end
