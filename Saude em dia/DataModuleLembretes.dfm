object DataModuleLembrete: TDataModuleLembrete
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QryLembretes: TFDQuery
    OnNewRecord = QryLembretesNewRecord
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT * FROM CONTROLA')
    Left = 120
    Top = 72
    object QryLembretesID_CONTROLA: TIntegerField
      FieldName = 'ID_CONTROLA'
      Origin = 'ID_CONTROLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryLembretesID_RECEITA: TIntegerField
      FieldName = 'ID_RECEITA'
      Origin = 'ID_RECEITA'
    end
    object QryLembretesID_REMEDIO: TIntegerField
      FieldName = 'ID_REMEDIO'
      Origin = 'ID_REMEDIO'
    end
    object QryLembretesDOSAGEM: TStringField
      FieldName = 'DOSAGEM'
      Origin = 'DOSAGEM'
      Required = True
      Size = 11
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
    object QryLembretesPessoa: TStringField
      FieldKind = fkLookup
      FieldName = 'Pessoa'
      LookupDataSet = QryPessoas
      LookupKeyFields = 'ID_PESSOA'
      LookupResultField = 'NOME'
      KeyFields = 'ID_PESSOA'
      Lookup = True
    end
  end
  object QryPessoas: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT * FROM PESSOA')
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
    object QryPessoasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
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
    object QryPessoasID_FARMACIA: TIntegerField
      FieldName = 'ID_FARMACIA'
      Origin = 'ID_FARMACIA'
    end
  end
  object QryIDLembrete: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      
        'select coalesce(max (ID_CONTROLA) + 1, 1) as IDCONTROLA from CON' +
        'TROLA')
    Left = 304
    Top = 232
    object QryIDLembreteIDCONTROLA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'IDCONTROLA'
      Origin = 'IDCONTROLA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryRemedios: TFDQuery
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from remedio')
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
    object QryRemediosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
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
end
