object DMMedicamento: TDMMedicamento
  Height = 797
  Width = 1169
  object FDQRYBuscarMedicamntos: TFDQuery
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT *FROM REMEDIO;')
    Left = 88
    Top = 48
  end
end
