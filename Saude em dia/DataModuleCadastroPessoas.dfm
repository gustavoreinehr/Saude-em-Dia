object DMCadastroPessoa: TDMCadastroPessoa
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object QueryDadosPessoa: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select * from pessoa')
    Left = 152
    Top = 72
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
    object QueryDadosPessoaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
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
    object QueryDadosPessoaID_FARMACIA: TIntegerField
      FieldName = 'ID_FARMACIA'
      Origin = 'ID_FARMACIA'
    end
  end
  object QryIDPessoa: TFDQuery
    Active = True
    Connection = DmPrincipal.FDConnection1
    SQL.Strings = (
      'select coalesce(max (ID_PESSOA) + 1, 1) as IDPESSOA from pessoa')
    Left = 248
    Top = 224
    object QryIDPessoaIDPESSOA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
