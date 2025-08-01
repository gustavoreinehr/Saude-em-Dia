object Projeto_Produto: TProjeto_Produto
  Left = 0
  Top = 0
  Caption = 'Cadastro_Produto'
  ClientHeight = 691
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Grid: TDBGrid
    Left = 0
    Top = 419
    Width = 1084
    Height = 272
    Align = alClient
    DataSource = datasource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Width = 143
        Visible = True
      end>
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1084
    Height = 362
    Align = alTop
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 1
    object Label_ID: TLabel
      Left = 72
      Top = 28
      Width = 21
      Height = 30
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label_Descricao: TLabel
      Left = 72
      Top = 85
      Width = 90
      Height = 30
      Caption = 'Descricao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label_Preco: TLabel
      Left = 72
      Top = 142
      Width = 52
      Height = 30
      Caption = 'Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label_Quantidade: TLabel
      Left = 72
      Top = 203
      Width = 109
      Height = 30
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 30
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBEditID: TDBEdit
      Left = 72
      Top = 56
      Width = 121
      Height = 23
      DataField = 'id'
      DataSource = datasource
      Enabled = False
      TabOrder = 0
    end
    object DBEditDescricao: TDBEdit
      Left = 72
      Top = 113
      Width = 305
      Height = 23
      DataField = 'nome'
      DataSource = datasource
      TabOrder = 1
    end
    object DBEdit_Preco: TDBEdit
      Left = 72
      Top = 174
      Width = 121
      Height = 23
      DataField = 'preco'
      DataSource = datasource
      TabOrder = 2
      OnKeyPress = DBEdit_PrecoKeyPress
    end
    object DBEditQuantidade: TDBEdit
      Left = 72
      Top = 232
      Width = 121
      Height = 23
      DataField = 'quantidade'
      DataSource = datasource
      TabOrder = 3
      OnKeyPress = DBEditQuantidadeKeyPress
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 362
    Width = 1084
    Height = 57
    DataSource = datasource
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 96
    ExplicitTop = 448
    ExplicitWidth = 310
  end
  object datasource: TDataSource
    DataSet = DMDataBase.FDProduto
    Left = 648
    Top = 424
  end
end
