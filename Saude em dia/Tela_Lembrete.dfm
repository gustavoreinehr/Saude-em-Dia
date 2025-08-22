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
    ExplicitWidth = 984
    object BotaoEditar: TButton
      Left = 100
      Top = 25
      Width = 150
      Height = 50
      Caption = 'Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BotaoEditarClick
    end
    object BotaoExcluir: TButton
      Left = 300
      Top = 25
      Width = 150
      Height = 50
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BotaoExcluirClick
    end
    object BotaoIncluir: TButton
      Left = 500
      Top = 25
      Width = 150
      Height = 50
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
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
    ExplicitWidth = 984
    ExplicitHeight = 561
    object DataInicio: TLabel
      Left = 352
      Top = 145
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
      Top = 167
      Width = 189
      Height = 42
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
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Selecione a Data'
    end
    object Dosagem: TComboBox
      Left = 352
      Top = 63
      Width = 150
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Horario: TTimePicker
      Left = 100
      Top = 177
      Width = 189
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
      Time = 45890.799382546300000000
      TimeFormat = 'hh:nn'
    end
    object Lembrete: TMemo
      Left = 728
      Top = 63
      Width = 249
      Height = 146
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        'Lembrete')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
      StyleName = 'Windows'
    end
    object Edit1: TEdit
      Left = 100
      Top = 63
      Width = 189
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Tabela: TStringGrid
      Left = 0
      Top = 240
      Width = 984
      Height = 321
      TabOrder = 5
      OnSelectCell = TabelaSelectCell
    end
  end
end
