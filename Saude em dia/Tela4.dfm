object Cadastro_Conta_Tela: TCadastro_Conta_Tela
  Left = 0
  Top = 0
  Caption = 'Cadastro De Contas'
  ClientHeight = 613
  ClientWidth = 1186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 280
    Top = 88
    Width = 61
    Height = 15
    Caption = 'id_farmacia'
    FocusControl = dbedtid_farmacia
  end
  object Label2: TLabel
    Left = 280
    Top = 136
    Width = 53
    Height = 15
    Caption = 'cnpj_farm'
    FocusControl = dbmmocnpj_farm
  end
  object Label3: TLabel
    Left = 280
    Top = 248
    Width = 31
    Height = 15
    Caption = 'senha'
    FocusControl = dbmmosenha
  end
  object Label4: TLabel
    Left = 280
    Top = 360
    Width = 63
    Height = 15
    Caption = 'razao_social'
    FocusControl = dbmmorazao_social
  end
  object dbedtid_farmacia: TDBEdit
    Left = 280
    Top = 104
    Width = 154
    Height = 23
    DataField = 'id_farmacia'
    DataSource = DataSource
    TabOrder = 0
  end
  object dbmmocnpj_farm: TDBMemo
    Left = 280
    Top = 152
    Width = 185
    Height = 89
    DataField = 'cnpj_farm'
    DataSource = DataSource
    TabOrder = 1
  end
  object dbmmosenha: TDBMemo
    Left = 280
    Top = 264
    Width = 185
    Height = 89
    DataField = 'senha'
    DataSource = DataSource
    TabOrder = 2
  end
  object dbmmorazao_social: TDBMemo
    Left = 280
    Top = 376
    Width = 185
    Height = 89
    DataField = 'razao_social'
    DataSource = DataSource
    TabOrder = 3
  end
  object DataSource: TDataSource
    DataSet = DMDataBase.FDFarmacia
    Left = 584
    Top = 304
  end
end
