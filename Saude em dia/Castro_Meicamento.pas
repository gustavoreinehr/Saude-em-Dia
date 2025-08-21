unit Castro_Meicamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, System.IniFiles, Vcl.DBGrids;

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
    Grid_Cadastrados: TDBGrid;
    DBGrid1: TDBGrid;
    Fabricante: TComboBox;
    Lote_Edit: TEdit;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
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
    procedure Incluir_ButtonClick(Sender: TObject);
  private
    Procedure Nome_Obrigatorio;
    Procedure Quantidade_Obrigatorio;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

{ TForm5 }

procedure TForm5.Incluir_ButtonClick(Sender: TObject);
begin
Nome_Obrigatorio;
Quantidade_Obrigatorio;
end;

procedure TForm5.Nome_Obrigatorio;

begin
if Nome_Medicamento_Edit.text = '' then
ShowMessage('O Campo Nome é Obrigatório');

end;

procedure TForm5.Quantidade_Obrigatorio;
begin

if Quantidade_Medicamento_Edit.text = '' then
ShowMessage('O Campo Quantidade é Obrigatório');
end;

end.
