unit Tela_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, DataModuleCadastroPessoas;

type
  TTela_Cadastrp = class(TForm)
    Panel_Dados_Cadastro: TPanel;
    LNome_Completo: TLabel;
    LTipo_Pessoa: TLabel;
    CPF: TLabel;
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
    edtNome_Completo1: TDBEdit;
    ComboBoxTipo_Pessoa: TDBComboBox;
    medtcpf: TDBEdit;
    medttelefone: TDBEdit;
    DataSourcePessoas: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure ButtonLimparClick(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
    procedure ButtonIncluirClick(Sender: TObject);
    procedure medtcpfChange(Sender: TObject);
    procedure medttelefoneChange(Sender: TObject);
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

  LCpfFormatado := StringReplace(medtcpf.Text, '.', '', [rfReplaceAll]);
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
    medtcpf.SetFocus
  end
  else if Length(medttelefone.Text) <> 14 then
  begin
    ShowMessage('O telefone precisa conter 11 digitos');
    medttelefone.SetFocus;
  end;

end;

procedure TTela_Cadastrp.ButtonLimparClick(Sender: TObject);
begin
  edtNome_Completo1.Text := '';
  ComboBoxTipo_Pessoa.ItemIndex := 0;
  medtcpf.Text := '';
  medttelefone.Text := '';
end;

procedure TTela_Cadastrp.medtcpfChange(Sender: TObject);
var
  s, numbersOnly, formatted: string;
  i, posCursor: Integer;
begin
  s := medtcpf.Text;

  posCursor := medtcpf.SelStart;

  numbersOnly := '';
  for i := 1 to Length(s) do
    if s[i] in ['0' .. '9'] then
      numbersOnly := numbersOnly + s[i];

  if Length(numbersOnly) > 11 then
    numbersOnly := Copy(numbersOnly, 1, 11);

  if Length(numbersOnly) = 11 then
  begin
    formatted := Format('%s.%s.%s-%s', [Copy(numbersOnly, 1, 3),
      Copy(numbersOnly, 4, 3), Copy(numbersOnly, 7, 3),
      Copy(numbersOnly, 10, 2)]);
    medtcpf.Text := formatted;

    medtcpf.SelStart := Length(formatted);
  end
  else
  begin
    medtcpf.Text := numbersOnly;

    if posCursor > Length(numbersOnly) then
      medtcpf.SelStart := Length(numbersOnly)
    else
      medtcpf.SelStart := posCursor;
  end;
end;

procedure TTela_Cadastrp.medttelefoneChange(Sender: TObject);
var
  s, numbersOnly, formatted: string;
  i, posCursor: Integer;
begin
  s := medttelefone.Text;

  // Salvar posição atual do cursor
  posCursor := medttelefone.SelStart;

  // Remove todos os caracteres que não sejam números
  numbersOnly := '';
  for i := 1 to Length(s) do
    if s[i] in ['0' .. '9'] then
      numbersOnly := numbersOnly + s[i];

  // Limita a 11 dígitos
  if Length(numbersOnly) > 11 then
    numbersOnly := Copy(numbersOnly, 1, 11);

  // Formata quando tiver pelo menos 10 dígitos (DDD + número)
  if Length(numbersOnly) >= 10 then
  begin
    // Se tiver 11 dígitos, formato com 5 dígitos no início do número
    if Length(numbersOnly) = 11 then
      formatted := Format('(%s)%s-%s', [Copy(numbersOnly, 1, 2), // DDD
        Copy(numbersOnly, 3, 5), // 5 primeiros dígitos do número
        Copy(numbersOnly, 8, 4)]) // últimos 4 dígitos
    else
      // Se tiver 10 dígitos, formato com 4 dígitos no início do número
      formatted := Format('(%s)%s-%s', [Copy(numbersOnly, 1, 2), // DDD
        Copy(numbersOnly, 3, 4), // 4 primeiros dígitos do número
        Copy(numbersOnly, 7, 4)]); // últimos 4 dígitos

    medttelefone.Text := formatted;
    medttelefone.SelStart := Length(formatted);
  end
  else
  begin
    // Se tiver menos que 10 dígitos, mostra só números
    medttelefone.Text := numbersOnly;

    if posCursor > Length(numbersOnly) then
      medttelefone.SelStart := Length(numbersOnly)
    else
      medttelefone.SelStart := posCursor;
  end;
end;

end.
