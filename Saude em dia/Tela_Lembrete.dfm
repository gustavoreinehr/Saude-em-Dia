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
  Position = poDesktopCenter
  OnClick = BotaoExcluirClick
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object BarraInferior: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1098
    object BotaoSalvar: TButton
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
      OnClick = BotaoSalvarClick
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
      OnClick = AVoltarClick
    end
  end
  object PainelBotoes: TPanel
    Left = 0
    Top = 100
    Width = 1100
    Height = 605
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1100
      605)
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
      Top = 40
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
      Left = 841
      Top = 43
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
    object Label4: TLabel
      Left = 604
      Top = 40
      Width = 65
      Height = 21
      Caption = 'Rem'#233'dio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LblPeriodicidadeEmDias: TLabel
      Left = 604
      Top = 155
      Width = 154
      Height = 21
      Caption = 'Periodicidade em dias:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Dosagem: TDBComboBox
      Left = 352
      Top = 67
      Width = 185
      Height = 29
      DataField = 'DOSAGEM'
      DataSource = DSLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        '6'
        '8'
        '12'
        '24')
      ParentFont = False
      TabOrder = 0
    end
    object Lembrete: TDBMemo
      Left = 841
      Top = 68
      Width = 252
      Height = 146
      DataField = 'MENSAGEM_LEMBRETE'
      DataSource = DSLembrete
      TabOrder = 1
    end
    object Tabela: TDBGrid
      Left = 1
      Top = 272
      Width = 1083
      Height = 329
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DSLembrete
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMEPESSOA'
          Width = 98
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
          FieldName = 'DOSAGEM'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MENSAGEM_LEMBRETE'
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 100
      Top = 182
      Width = 185
      Height = 29
      DataField = 'HORA'
      DataSource = DSLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = DBEdit1Change
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 100
      Top = 68
      Width = 185
      Height = 29
      DataField = 'ID_PESSOA'
      DataSource = DSLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'ID_PESSOA'
      ListField = 'NOME'
      ListSource = DSPessoa
      ParentFont = False
      TabOrder = 4
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 604
      Top = 67
      Width = 185
      Height = 29
      DataField = 'ID_REMEDIO'
      DataSource = DSLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'ID_REMEDIO'
      ListField = 'NOME'
      ListSource = DSRemedios
      ParentFont = False
      TabOrder = 5
    end
    object DBEdtData: TDBEdit
      Left = 352
      Top = 182
      Width = 185
      Height = 29
      DataField = 'DATA'
      DataSource = DSLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = DBEdtDataChange
    end
    object DBEdit2: TDBEdit
      Left = 604
      Top = 182
      Width = 185
      Height = 29
      DataField = 'PERIODICIDADE'
      DataSource = DSLembrete
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object DSLembrete: TDataSource
    DataSet = DataModuleLembrete.QryLembretes
    Left = 992
    Top = 24
  end
  object DSPessoa: TDataSource
    DataSet = DataModuleLembrete.QryPessoas
    Left = 888
    Top = 24
  end
  object DSRemedios: TDataSource
    DataSet = DataModuleLembrete.QryRemedios
    Left = 792
    Top = 24
  end
end
