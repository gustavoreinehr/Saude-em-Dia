unit Tela_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TTela_Cadastrp = class(TForm)
    Panel_Dados_Cadastro: TPanel;
    LNome_Completo: TLabel;
    LTipo_Pessoa: TLabel;
    edtNome_Completo1: TEdit;
    ComboBoxTipo_Pessoa: TComboBox;
    CPF: TLabel;
    medtCPF: TMaskEdit;
    medtTelefone: TMaskEdit;
    Telefone: TLabel;
    ButtonCadastrar: TButton;
    ButtonExcluir: TButton;
    ButtonIncluir: TButton;
    ButtonLimpar: TButton;
    PanelBotoes: TPanel;
    PanelInferior: TPanel;
    DBGrid1: TDBGrid;
    AVoltar: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure ButtonLimparClick(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
    procedure ButtonIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tela_Cadastrp: TTela_Cadastrp;
  GQtdLetrasEditNome: Integer;

implementation

{$R *.dfm}

procedure TTela_Cadastrp.AVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TTela_Cadastrp.ButtonIncluirClick(Sender: TObject);
var
  LCpfFormatado: string;
begin

  LCpfFormatado := StringReplace(medtCPF.Text, '.', '', [rfReplaceAll]);
  LCpfFormatado := StringReplace(LCpfFormatado, '-', '', [rfReplaceAll]);

  if Length(edtNome_Completo1.Text) < 10 then
  begin
    ShowMessage('O nome precisa conter no mínimo 10 caracteres');
    edtNome_Completo1.SetFocus
  end
  else if ComboBoxTipo_Pessoa.ItemIndex = 0 then
  begin
    ShowMessage('Selecione um tipo de pessoa');
    ComboBoxTipo_Pessoa.SetFocus;
  end
  else if Length(LCpfFormatado) <> 11 then
  begin
    ShowMessage('O CPF precisa ter 11 digitos');
    medtCPF.SetFocus
  end
  else if Length(medtTelefone.Text) <> 14 then
  begin
    ShowMessage('O telefone precisa conter 11 digitos');
    medtTelefone.SetFocus;
  end;

end;

procedure TTela_Cadastrp.ButtonLimparClick(Sender: TObject);
begin
  edtNome_Completo1.Text := '';
  ComboBoxTipo_Pessoa.ItemIndex := 0;
  medtCPF.Text := '';
  medtTelefone.Text := '';
end;

end.
