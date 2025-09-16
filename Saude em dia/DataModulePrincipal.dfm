object DmPrincipal: TDmPrincipal
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 256
    Top = 73
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Saude_em_dia\Sistema\Saude-em-Dia\SAUDE_EM_DIA2.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'DriverID=FB')
    Connected = True
    Left = 393
    Top = 73
  end
end
