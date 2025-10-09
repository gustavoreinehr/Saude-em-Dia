object FCadastro_Medicamento: TFCadastro_Medicamento
  Left = 0
  Top = 0
  Caption = 'Cadastro Medicamento'
  ClientHeight = 705
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Painel_Principal: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 393
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 1098
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 43
      Height = 21
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 108
      Width = 140
      Height = 21
      Caption = 'Forma Farmaceutica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 164
      Width = 59
      Height = 21
      Caption = 'Validade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 219
      Width = 88
      Height = 21
      Caption = 'Classifica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 354
      Top = 164
      Width = 147
      Height = 21
      Caption = 'Via de Administra'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Width = 135
      Height = 21
      Caption = 'Unidade de Medida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 291
      Width = 67
      Height = 21
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
    object Nome_Medicamento_Edit: TDBEdit
      Left = 16
      Top = 79
      Width = 619
      Height = 29
      DataField = 'NOME'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Unidade_Medida_Comb: TDBComboBox
      Left = 354
      Top = 129
      Width = 281
      Height = 29
      DataField = 'UNIDADE_MEDIDA'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
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
        'sup '#8211' suposit'#243'riomg '#8211' miligrama'
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
      ParentFont = False
      TabOrder = 3
    end
    object Forma_Farmaceutica_Comb: TDBComboBox
      Left = 16
      Top = 129
      Width = 281
      Height = 29
      DataField = 'FORMA_FARMACEUTICA'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
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
        'Enxaguante bucal'
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
      ParentFont = False
      TabOrder = 4
    end
    object Via_Adm_Comb: TDBComboBox
      Left = 354
      Top = 184
      Width = 281
      Height = 29
      DataField = 'VIA_ADMINISTRACAO'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 5
    end
    object Classificacao_Comb: TDBComboBox
      Left = 16
      Top = 240
      Width = 281
      Height = 29
      DataField = 'CLASSIFICACAO'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 6
    end
    object Edit_Descricao: TDBEdit
      Left = 16
      Top = 318
      Width = 619
      Height = 29
      DataField = 'DESCRICAO'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object Validade_Time: TDBEdit
      Left = 16
      Top = 184
      Width = 281
      Height = 29
      DataField = 'VALIDADE'
      DataSource = DataSourceBuscarMedicamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
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
    OnClick = AVoltarClick
  end
  object Incluir_Button: TButton
    Left = 320
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Incluir_ButtonClick
  end
  object Editar_Button: TButton
    Left = 80
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Editar_ButtonClick
  end
  object Excluir_Button: TButton
    Left = 200
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Excluir_ButtonClick
  end
  object Grid_Cadastrados: TDBGrid
    Left = 0
    Top = 393
    Width = 1100
    Height = 312
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 393
    Width = 1100
    Height = 312
    Align = alClient
    DataSource = DataSourceBuscarMedicamentos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_REMEDIO'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLASSIFICACAO'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_FARMACEUTICA'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALIDADE'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIA_ADMINISTRACAO'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE_MEDIDA'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 213
        Visible = True
      end>
  end
  object Button3: TButton
    Left = 448
    Top = 8
    Width = 97
    Height = 41
    Caption = 'Limpar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button3Click
  end
  object DataSourceBuscarMedicamentos: TDataSource
    DataSet = DMMedicamento.FDQRYBuscarMedicamntos
    Left = 928
    Top = 312
  end
end
