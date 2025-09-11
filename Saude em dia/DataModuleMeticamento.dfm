object DMMedicamento: TDMMedicamento
  Height = 996
  Width = 1461
  PixelsPerInch = 120
  object FDQRYBuscarMedicamntos: TFDQuery
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT *FROM REMEDIO;')
    Left = 302
    Top = 172
  end
end
