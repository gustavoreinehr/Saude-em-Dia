object DataModuleLembrete: TDataModuleLembrete
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QryLembretes: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'SELECT '
      '    c.ID_CONTROLA,'
      '    c.DATA,'
      '    c.HORA,'
      '    c.ID_RECEITA,'
      '    c.ID_REMEDIO,'
      '    c.DOSAGEM,'
      '    c.MENSAGEM_LEMBRETE'
      'FROM CONTROLA c')
    Left = 168
    Top = 80
    object QryLembretesID_CONTROLA: TIntegerField
      FieldName = 'ID_CONTROLA'
      Origin = 'ID_CONTROLA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  end
  object QryIDLembrete: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      
        'select coalesce(max (ID_CONTROLA) + 1, 1) as IDCONTROLA from CON' +
        'TROLA')
    Left = 408
    Top = 168
    object QryIDLembreteIDCONTROLA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'IDCONTROLA'
      Origin = 'IDCONTROLA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryPessoas: TFDQuery
    Active = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from pessoa')
    Left = 248
    Top = 280
  end
end
