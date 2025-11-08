object DMCadastroPessoa: TDMCadastroPessoa
  Height = 600
  Width = 800
  object QueryDadosPessoa: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from pessoa')
    Left = 122
    Top = 58
    object QueryDadosPessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryDadosPessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object QueryDadosPessoaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 14
    end
    object QueryDadosPessoaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
    end
  end
  object QryIDPessoa: TFDQuery
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select coalesce(max (ID_PESSOA) + 1, 1) as IDPESSOA from pessoa')
    Left = 198
    Top = 179
    object QryIDPessoaIDPESSOA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQryValidarCPF: TFDQuery
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    Left = 528
    Top = 160
  end
end
