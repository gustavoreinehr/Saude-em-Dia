unit Castro_Meicamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm5 = class(TForm)
    AVoltar: TButton;
    Incluir_Button: TButton;
    Nome_Medicamento_Edit: TEdit;
    Quantidade_Medicamento_Edit: TEdit;
    Unidade_Medida_Comb: TComboBox;
    Via_Adm_Comb: TComboBox;
    Forma_Farmaceutica_Comb: TComboBox;
    Validade_Time: TDateTimePicker;
    Classificacao_Comb: TComboBox;
    Editar_Button: TButton;
    Excluir_Button: TButton;
    Painel_Principal: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    DateTimePicker1: TDateTimePicker;
    ComboBox4: TComboBox;
    Grid_Cadastrados: TDBGrid;
    DBGrid1: TDBGrid;
    ComboBox5: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

end.
