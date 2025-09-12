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
  OnClick = BotaoExcluirClick
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object BarraInferior: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 100
    Align = alTop
    TabOrder = 0
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
      OnClick = AVoltarClick
    end
  end
  object PainelBotoes: TPanel
    Left = 0
    Top = 100
    Width = 1100
    Height = 605
    Align = alClient
    TabOrder = 1
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
      Left = 728
      Top = 41
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
    object Calendario: TCalendarPicker
      Left = 352
      Top = 177
      Width = 189
      Height = 32
      CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
      CalendarHeaderInfo.DaysOfWeekFont.Height = -17
      CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
      CalendarHeaderInfo.DaysOfWeekFont.Style = []
      CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
      CalendarHeaderInfo.Font.Color = clWindowText
      CalendarHeaderInfo.Font.Height = -25
      CalendarHeaderInfo.Font.Name = 'Segoe UI'
      CalendarHeaderInfo.Font.Style = []
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Selecione a Data'
    end
    object Horario: TTimePicker
      Left = 100
      Top = 182
      Width = 189
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
      Time = 45890.799382546300000000
      TimeFormat = 'hh:nn'
    end
    object Dosagem: TDBComboBox
      Left = 352
      Top = 69
      Width = 185
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Lembrete: TDBMemo
      Left = 728
      Top = 70
      Width = 249
      Height = 146
      TabOrder = 3
    end
    object Tabela: TDBGrid
      Left = 1
      Top = 272
      Width = 1099
      Height = 329
      DataSource = DSLembrete
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA_E_HORA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOSAGEM'
          Width = 202
          Visible = True
        end>
    end
    object Nome_Paciente: TDBLookupComboBox
      Left = 100
      Top = 70
      Width = 185
      Height = 29
      DataField = 'NOME'
      DataSource = DSPessoa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ListSource = DSPessoa
      ParentFont = False
      TabOrder = 5
    end
  end
  object DSLembrete: TDataSource
    Left = 992
    Top = 24
  end
  object DSPessoa: TDataSource
    Left = 888
    Top = 24
  end
end
