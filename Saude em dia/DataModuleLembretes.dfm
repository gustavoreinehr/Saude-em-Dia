object DataModuleLembrete: TDataModuleLembrete
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QryPessoas: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from PESSOA')
    Left = 280
    Top = 80
    object QryPessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryPessoasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object QryPessoasCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 14
    end
    object QryPessoasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
    end
  end
  object QryIDLembrete: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select gen_id(GN_CONTROLA, 1) AS IDCONTROLA FROM RDB$DATABASE')
    Left = 304
    Top = 233
    object QryIDLembreteIDCONTROLA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'IDCONTROLA'
      Origin = 'IDCONTROLA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryRemedios: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from REMEDIO')
    Left = 160
    Top = 288
    object QryRemediosID_REMEDIO: TIntegerField
      FieldName = 'ID_REMEDIO'
      Origin = 'ID_REMEDIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryRemediosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object QryRemediosCLASSIFICACAO: TStringField
      FieldName = 'CLASSIFICACAO'
      Origin = 'CLASSIFICACAO'
      Size = 50
    end
    object QryRemediosFORMA_FARMACEUTICA: TStringField
      FieldName = 'FORMA_FARMACEUTICA'
      Origin = 'FORMA_FARMACEUTICA'
      Size = 50
    end
    object QryRemediosVALIDADE: TDateField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
    end
    object QryRemediosVIA_ADMINISTRACAO: TStringField
      FieldName = 'VIA_ADMINISTRACAO'
      Origin = 'VIA_ADMINISTRACAO'
      Size = 50
    end
    object QryRemediosUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
    end
    object QryRemediosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
  end
  object QryLembretes: TFDQuery
    OnNewRecord = QryLembretesNewRecord
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      
        'SELECT C.* FROM CONTROLA C INNER JOIN PESSOA P ON (C.ID_PESSOA =' +
        ' P.ID_PESSOA)')
    Left = 112
    Top = 104
    object QryLembretesID_CONTROLA: TIntegerField
      FieldName = 'ID_CONTROLA'
      Origin = 'ID_CONTROLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryLembretesID_REMEDIO: TIntegerField
      FieldName = 'ID_REMEDIO'
      Origin = 'ID_REMEDIO'
      Required = True
    end
    object QryLembretesDOSAGEM: TStringField
      FieldName = 'DOSAGEM'
      Origin = 'DOSAGEM'
      Required = True
      Size = 50
    end
    object QryLembretesMENSAGEM_LEMBRETE: TStringField
      FieldName = 'MENSAGEM_LEMBRETE'
      Origin = 'MENSAGEM_LEMBRETE'
      Required = True
      Size = 400
    end
    object QryLembretesID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      Required = True
    end
    object QryLembretesDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object QryLembretesHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
      Required = True
    end
    object QryLembretesPERIODICIDADE: TIntegerField
      FieldName = 'PERIODICIDADE'
      Origin = 'PERIODICIDADE'
      Required = True
    end
    object QryLembretesNOMEPESSOA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMEPESSOA'
      LookupDataSet = QryPessoas
      LookupKeyFields = 'ID_PESSOA'
      LookupResultField = 'NOME'
      KeyFields = 'ID_PESSOA'
      Lookup = True
    end
  end
end
