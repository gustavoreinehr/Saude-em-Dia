object FCadastro_Medicamento: TFCadastro_Medicamento
  Left = 0
  Top = 0
  Caption = 'e'
  ClientHeight = 700
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Painel_Principal: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 529
    Align = alTop
    TabOrder = 11
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 16
      Top = 108
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label3: TLabel
      Left = 16
      Top = 164
      Width = 108
      Height = 15
      Caption = 'Forma Farmaceutica'
    end
    object Label4: TLabel
      Left = 16
      Top = 220
      Width = 44
      Height = 15
      Caption = 'Validade'
    end
    object Label5: TLabel
      Left = 16
      Top = 275
      Width = 55
      Height = 15
      Caption = 'Fabricante'
    end
    object Label6: TLabel
      Left = 354
      Top = 275
      Width = 23
      Height = 15
      Caption = 'Lote'
    end
    object Label7: TLabel
      Left = 354
      Top = 219
      Width = 68
      Height = 15
      Caption = 'Classifica'#231#227'o'
    end
    object Label9: TLabel
      Left = 354
      Top = 164
      Width = 112
      Height = 15
      Caption = 'Via de Administra'#231#227'o'
    end
    object Label8: TLabel
      Left = 354
      Top = 108
      Width = 3
      Height = 15
      Caption = #39
    end
    object Label10: TLabel
      Left = 354
      Top = 108
      Width = 103
      Height = 15
      Caption = 'Unidade de Medida'
    end
    object Button1: TButton
      Left = 0
      Top = 1
      Width = 49
      Height = 41
      Caption = #55357#56601
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button2: TButton
      Left = 320
      Top = 8
      Width = 97
      Height = 41
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 682
      Top = 73
      Width = 231
      Height = 17
      HelpType = htKeyword
      Caption = 'Medicamento Gen'#233'rico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object AVoltar: TButton
    Left = 0
    Top = 1
    Width = 49
    Height = 41
    Caption = #55357#56601
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Incluir_Button: TButton
    Left = 320
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Incluir_ButtonClick
  end
  object Nome_Medicamento_Edit: TEdit
    Left = 16
    Top = 73
    Width = 619
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Quantidade_Medicamento_Edit: TEdit
    Left = 16
    Top = 129
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Unidade_Medida_Comb: TComboBox
    Left = 354
    Top = 129
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Items.Strings = (
      'mg '#8211' miligrama'
      'g '#8211' grama'
      'mcg '#8211' micrograma'
      'ng '#8211' nanograma '
      'kg '#8211' quilograma '
      'mL '#8211' mililitro'
      'L '#8211' litro'
      #181'L '#8211' microlitros'
      'cp '#8211' comprimido'
      'cap '#8211' c'#225'psula'
      'fl '#8211' frasco'
      'amp '#8211' ampola'
      'sup '#8211' suposit'#243'rio')
  end
  object Via_Adm_Comb: TComboBox
    Left = 354
    Top = 185
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Items.Strings = (
      'Oral'
      'Sublingual'
      'Bucal'
      'G'#225'strica'
      'Enteral'
      'Retal'
      'Vaginal'
      'Intravenosa'
      'Intramuscular'
      'Subcut'#226'nea'
      'Intrad'#233'rmica'
      'Intra'#243'ssea'
      'Intracard'#237'aca'
      'Intraperitoneal'
      'Intratecal'
      'Epidural'
      'Inalat'#243'ria'
      'Intrapulmonar'
      'Intranasal'
      'Oft'#225'lmica'
      'Otol'#243'gica'
      'T'#243'pica'
      'Transd'#233'rmica'
      'Intra-articular')
  end
  object Forma_Farmaceutica_Comb: TComboBox
    Left = 16
    Top = 185
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Items.Strings = (
      'Comprimido'
      'Comprimido efervescente'
      'Comprimido mastig'#225'vel'
      'Comprimido sublingual'
      'Comprimido bucal'
      'C'#225'psula dura'
      'C'#225'psula mole (gelatinosa)'
      'Dr'#225'gea'
      'P'#243' para solu'#231#227'o'
      'P'#243' para suspens'#227'o'
      'P'#243' para inala'#231#227'o'
      'Pastilha'
      'Granulado'
      'Tablete'
      'Solu'#231#227'o oral'
      'Solu'#231#227'o injet'#225'vel'
      'Solu'#231#227'o oft'#225'lmica (col'#237'rio)'
      'Solu'#231#227'o nasal'
      'Solu'#231#227'o t'#243'pica'
      'Solu'#231#227'o otol'#243'gica (para ouvidos)'
      'Suspens'#227'o oral'
      'Suspens'#227'o injet'#225'vel'
      'Xarope'
      'Elixir'
      'Emuls'#227'o'
      'Tintura'
      'Enxaguante bucal'#11
      'Spray nasal'
      'Spray bucal'
      'Spray t'#243'pico'
      'Inalador pressurizado'
      'Nebuliza'#231#227'o'
      'G'#225's medicinal'
      'Creme'
      'Pomada'
      'Gel'
      'Pasta'
      'Lo'#231#227'o'
      'Unguento'
      'B'#225'lsamo'
      'Ampola'
      'Frasco-ampola'
      'Cartucho'
      'Seringa pr'#233'-cheia'
      'Implante subcut'#226'neo'
      'Liofilizado para reconstitui'#231#227'o'
      'Adesivo transd'#233'rmico (patch)'
      'Suposit'#243'rio'
      #211'vulo vaginal'
      'Anel vaginal'
      'Diafragma medicamentoso'
      'Fita medicamentosa')
  end
  object Validade_Time: TDateTimePicker
    Left = 16
    Top = 240
    Width = 281
    Height = 25
    Date = 45883.000000000000000000
    Time = 0.910627071760245600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Classificacao_Comb: TComboBox
    Left = 354
    Top = 240
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Items.Strings = (
      'Comum'
      'Controlado - Tarja Preta'
      'Controlado - Tarja Vermelha'
      'Gen'#233'rico'
      'Similar'
      'Fitoter'#225'pico'
      'Homeop'#225'tico'
      'Manipulado'
      'Antibi'#243'tico'
      'Uso Hospitalar'
      'Venda Sob Prescri'#231#227'o'
      'Venda Livre')
  end
  object Editar_Button: TButton
    Left = 80
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Editar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object Excluir_Button: TButton
    Left = 200
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object Grid_Cadastrados: TDBGrid
    Left = 0
    Top = 529
    Width = 1000
    Height = 171
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 529
    Width = 1000
    Height = 171
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Fabricante: TComboBox
    Left = 16
    Top = 296
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    Items.Strings = (
      'Comum'
      'Controlado - Tarja Preta'
      'Controlado - Tarja Vermelha'
      'Gen'#233'rico'
      'Similar'
      'Fitoter'#225'pico'
      'Homeop'#225'tico'
      'Manipulado'
      'Antibi'#243'tico'
      'Uso Hospitalar'
      'Venda Sob Prescri'#231#227'o'
      'Venda Livre')
  end
  object Lote_Edit: TEdit
    Left = 354
    Top = 296
    Width = 281
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
  end
  object Button3: TButton
    Left = 448
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Limpar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
  object Edit1: TEdit
    Left = 16
    Top = 352
    Width = 619
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
  end
end
