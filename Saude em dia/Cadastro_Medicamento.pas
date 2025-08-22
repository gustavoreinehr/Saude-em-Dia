unit Cadastro_Medicamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, System.IniFiles, Vcl.DBGrids;

type
  TFCadastro_Medicamento = class(TForm)
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
    Grid_Cadastrados: TDBGrid;
    DBGrid1: TDBGrid;
    Fabricante: TComboBox;
    Edit_Buscar: TEdit;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Edit_Descricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Buscar_Button: TButton;
    Label11: TLabel;
    procedure Incluir_ButtonClick(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Procedure Nome_Obrigatorio;
    Procedure Quantidade_Obrigatorio;
    Procedure Unidade_Obrigatorio;
    Procedure Validade_Obrigatorio;
    Procedure Class_Obrigatorio;
  public
    { Public declarations }
  end;

var
  FCadastro_Medicamento: TFCadastro_Medicamento;

implementation

{$R *.dfm}
{ TForm5 }

procedure TFCadastro_Medicamento.AVoltarClick(Sender: TObject);
begin
  Self.Close
end;

procedure TFCadastro_Medicamento.Button3Click(Sender: TObject);
begin
  Nome_Medicamento_Edit.text := '';
  Classificacao_Comb.text := '';
  Quantidade_Medicamento_Edit.text := '';
  Unidade_Medida_Comb.text := '';
  Via_Adm_Comb.text := '';
  Forma_Farmaceutica_Comb.text := '';
  Validade_Time.Date := Date;
  Classificacao_Comb.text := '';
  Fabricante.text := '';
  Edit_Buscar.text := '';
  Edit_Descricao.text := '';

end;

procedure TFCadastro_Medicamento.Class_Obrigatorio;
begin
  if Classificacao_Comb.text = '' then
    ShowMessage('O Campo Classificação é Obrigatório');

end;

procedure TFCadastro_Medicamento.FormCreate(Sender: TObject);
begin
  Validade_Time.Date := Date;
end;

procedure TFCadastro_Medicamento.Incluir_ButtonClick(Sender: TObject);
begin
  Nome_Obrigatorio;
  Quantidade_Obrigatorio;
  Unidade_Obrigatorio;
  Validade_Obrigatorio;
  Class_Obrigatorio;
end;

procedure TFCadastro_Medicamento.Nome_Obrigatorio;

begin
  if Nome_Medicamento_Edit.text = '' then
    ShowMessage('O Campo Nome é Obrigatório');

end;

procedure TFCadastro_Medicamento.Quantidade_Obrigatorio;
var
  DummyInt: Integer;
begin
  if Trim(Quantidade_Medicamento_Edit.text) = '' then
    ShowMessage('O Campo Quantidade é Obrigatório')
  else if not TryStrToInt(Quantidade_Medicamento_Edit.text, DummyInt) then
    ShowMessage('O Campo Quantidade Deve Ser Numérico');

end;

procedure TFCadastro_Medicamento.Unidade_Obrigatorio;
begin
  if Unidade_Medida_Comb.text = '' then
    ShowMessage('O Campo Unidade de Medida é Obrigatório')
end;

procedure TFCadastro_Medicamento.Validade_Obrigatorio;
begin
  if (Validade_Time.Date <= Date) then
    ShowMessage('Data de validade inválida!')
end;

end.
