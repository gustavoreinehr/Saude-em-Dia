object DmPrincipal: TDmPrincipal
  Height = 600
  Width = 800
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 205
    Top = 58
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Saude_em_dia\Sistema\Saude-em-Dia\SAUDE_EM_DIA2.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'DriverID=FB')
    Connected = True
    Left = 314
    Top = 58
  end
end
