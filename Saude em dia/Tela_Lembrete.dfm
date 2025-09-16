object Tela_Lembretes: TTela_Lembretes
  Left = 0
  Top = 0
  Caption = 'Tela_Lembretes'
  ClientHeight = 705
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object BarraInferior: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 100
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1098
    object BotaoEditar: TButton
      Left = 68
      Top = 7
      Width = 118
      Height = 40
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BotaoEditarClick
    end
    object BotaoExcluir: TButton
      Left = 192
      Top = 7
      Width = 118
      Height = 40
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BotaoExcluirClick
    end
    object BotaoIncluir: TButton
      Left = 316
      Top = 7
      Width = 118
      Height = 40
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BotaoIncluirClick
    end
    object AVoltar: TButton
      Left = 0
      Top = 0
      Width = 49
      Height = 49
      Caption = #55357#56601
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object PainelBotoes: TPanel
    Left = 0
    Top = 100
    Width = 1100
    Height = 605
    Align = alClient
    TabOrder = 1
    ExplicitTop = 106
    object DataInicio: TLabel
      Left = 352
      Top = 155
      Width = 97
      Height = 21
      Caption = 'Data de inicio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 352
      Top = 42
      Width = 185
      Height = 21
      Caption = 'Periodicidade da dosagem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 100
      Top = 155
      Width = 118
      Height = 21
      Caption = 'Horario de inicio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 832
      Top = 42
      Width = 69
      Height = 21
      Caption = 'Lembrete:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object NomePaciente: TLabel
      Left = 100
      Top = 43
      Width = 107
      Height = 21
      Caption = 'Nome Paciente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Dosagem: TDBComboBox
      Left = 352
      Top = 69
      Width = 185
      Height = 29
      DataField = 'DOSAGEM'
      DataSource = DsLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        '6h em 6h'
        '8h em 8h'
        '12h em 12h'
        '24h em 24h')
      ParentFont = False
      TabOrder = 0
    end
    object Lembrete: TDBMemo
      Left = 832
      Top = 69
      Width = 249
      Height = 146
      DataField = 'MENSAGEM_LEMBRETE'
      DataSource = DsLembrete
      TabOrder = 1
    end
    object Tabela: TDBGrid
      Left = 1
      Top = 272
      Width = 1099
      Height = 329
      DataSource = DsLembrete
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_CONTROLA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_RECEITA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_REMEDIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOSAGEM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MENSAGEM_LEMBRETE'
          Visible = True
        end>
    end
    object DbEdtHoraInicio: TDBEdit
      Left = 100
      Top = 182
      Width = 185
      Height = 29
      DataField = 'HORA'
      DataSource = DsLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 352
      Top = 182
      Width = 185
      Height = 29
      DataField = 'DATA'
      DataSource = DsLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DbCbPessoa: TDBComboBox
      Left = 100
      Top = 70
      Width = 185
      Height = 29
      DataField = 'NOME'
      DataSource = DsPessoas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object DsLembrete: TDataSource
    DataSet = DataModuleLembrete.QryLembretes
    Left = 832
    Top = 32
  end
  object DsPessoas: TDataSource
    DataSet = DataModuleLembrete.QryPessoas
    Left = 752
    Top = 32
  end
end
