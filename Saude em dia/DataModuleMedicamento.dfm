object DMMedicamento: TDMMedicamento
  Height = 797
  Width = 1169
  object FDQRYBuscarMedicamntos: TFDQuery
    OnNewRecord = FDQRYBuscarMedicamntosNewRecord
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT *FROM REMEDIO;')
    Left = 242
    Top = 138
    object FDQRYBuscarMedicamntosID_REMEDIO: TIntegerField
      FieldName = 'ID_REMEDIO'
      Origin = 'ID_REMEDIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQRYBuscarMedicamntosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object FDQRYBuscarMedicamntosCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Origin = 'CLASSIFICACAO'
      Size = 50
    end
    object FDQRYBuscarMedicamntosFORMA_FARMACEUTICA: TStringField
      FieldName = 'FORMA_FARMACEUTICA'
      Origin = 'FORMA_FARMACEUTICA'
      Size = 50
    end
    object FDQRYBuscarMedicamntosVIA_ADMINISTRACAO: TStringField
      FieldName = 'VIA_ADMINISTRACAO'
      Origin = 'VIA_ADMINISTRACAO'
      Size = 50
    end
    object FDQRYBuscarMedicamntosUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
    end
    object FDQRYBuscarMedicamntosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
  end
end
