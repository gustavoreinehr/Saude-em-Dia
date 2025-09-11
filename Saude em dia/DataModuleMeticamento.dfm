object DMMedicamento: TDMMedicamento
  Height = 797
  Width = 1169
  object FDQRYBuscarMedicamntos: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT *FROM REMEDIO;')
    Left = 242
    Top = 138
  end
end
