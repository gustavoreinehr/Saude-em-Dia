object DataModuleLembrete: TDataModuleLembrete
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QryLembretes: TFDQuery
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
    object QryLembretesDATA_E_HORA: TSQLTimeStampField
      FieldName = 'DATA_E_HORA'
      Origin = 'DATA_E_HORA'
      Required = True
    end
    object QryLembretesID_RECEITA: TIntegerField
      FieldName = 'ID_RECEITA'
      Origin = 'ID_RECEITA'
      Required = True
    end
    object QryLembretesID_REMEDIO: TIntegerField
      FieldName = 'ID_REMEDIO'
      Origin = 'ID_REMEDIO'
      Required = True
    end
    object QryLembretesDOSAGEM: TIntegerField
      FieldName = 'DOSAGEM'
      Origin = 'DOSAGEM'
      Required = True
    end
  end
  object QryPessoas: TFDQuery
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    Left = 280
    Top = 80
    object QryPessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      KeyFields = 'ID_PESSOA'
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
    object QryPessoasTIPO: TIntegerField
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
end
