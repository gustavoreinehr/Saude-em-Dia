object Tela_Lembretes: TTela_Lembretes
  Left = 0
  Top = 0
  Caption = 'Tela_Lembretes'
  ClientHeight = 661
  ClientWidth = 984
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
    Width = 984
    Height = 100
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 982
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
    Width = 984
    Height = 561
    Align = alClient
    Caption = 'SW'
    TabOrder = 1
    ExplicitWidth = 982
    ExplicitHeight = 553
    object DataInicio: TLabel
      Left = 100
      Top = 22
      Width = 158
      Height = 35
      Caption = 'Data de inicio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 352
      Top = 22
      Width = 302
      Height = 35
      Caption = 'Periodicidade da dosagem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 100
      Top = 136
      Width = 191
      Height = 35
      Caption = 'Horario de inicio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 728
      Top = 22
      Width = 110
      Height = 35
      Caption = 'Lembrete:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -25
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Calendario: TCalendarPicker
      Left = 100
      Top = 63
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
    object ComboBox1: TComboBox
      Left = 352
      Top = 63
      Width = 150
      Height = 23
      TabOrder = 1
      Text = 'ComboBox1'
    end
    object TimePicker1: TTimePicker
      Left = 100
      Top = 177
      Width = 189
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
      Time = 45876.891205104170000000
      TimeFormat = 'hh:nn'
    end
    object MemoLembrete: TMemo
      Left = 728
      Top = 63
      Width = 249
      Height = 146
      Lines.Strings = (
        'Lembrete')
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 240
      Width = 976
      Height = 317
      Align = alBottom
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
end
