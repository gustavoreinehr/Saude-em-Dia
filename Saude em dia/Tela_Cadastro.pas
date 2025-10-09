unit Tela_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, DataModuleCadastroPessoas;

type
  TTela_Cadastrp = class(TForm)
    PnlDadosCadastro: TPanel;
    LblNomeCompleto: TLabel;
    LblCPF: TLabel;
    LblTelefone: TLabel;
    BtnSalvar: TButton;
    BtnExcluir: TButton;
    BtnIncluir: TButton;
    PnlBotoes: TPanel;
    PnlGrid: TPanel;
    GridDadosPessoa: TDBGrid;
    BtnVoltar: TButton;
    edtNomeCompleto: TDBEdit;
    edtCPF: TDBEdit;
    edttelefone: TDBEdit;
    DataSourcePessoas: TDataSource;
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure edtCPFChange(Sender: TObject);
    procedure edttelefoneChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tela_Cadastrp: TTela_Cadastrp;
  GQtdLetrasEditNome: Integer;
  GTDMCadastroPessoa: TDMCadastroPessoa;

implementation

{$R *.dfm}

procedure TTela_Cadastrp.BtnVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TTela_Cadastrp.ButtonSalvarClick(Sender: TObject);
begin
  if GTDMCadastroPessoa.QueryDadosPessoa.State in [dsEdit, dsInsert] then
  begin
    GTDMCadastroPessoa.QueryDadosPessoa.Post;
    GTDMCadastroPessoa.QueryDadosPessoa.ApplyUpdates;
  end;

end;

procedure TTela_Cadastrp.ButtonExcluirClick(Sender: TObject);
begin
  GTDMCadastroPessoa.QueryDadosPessoa.Delete;
  GTDMCadastroPessoa.QueryDadosPessoa.ApplyUpdates;

end;

procedure TTela_Cadastrp.BtnIncluirClick(Sender: TObject);
var
  LCpfFormatado: string;
begin
  LCpfFormatado := StringReplace(edtCPF.Text, '.', '', [rfReplaceAll]);
  LCpfFormatado := StringReplace(LCpfFormatado, '-', '', [rfReplaceAll]);

  if Length(edtNomeCompleto.Text) < 10 then
  begin
    ShowMessage('O nome precisa conter no mínimo 10 caracteres');
    edtNomeCompleto.SetFocus
  end
  else if Length(LCpfFormatado) <> 11 then
  begin
    ShowMessage('O CPF precisa ter 11 digitos');
    edtcpf.SetFocus
  end
  else if Length(edttelefone.Text) <> 14 then
  begin
    ShowMessage('O telefone precisa conter 11 digitos');
    edttelefone.SetFocus;
  end;

  if (Length(edtNomeCompleto.Text) >= 10)
    and (Length(LCpfFormatado) = 11) and (Length(edttelefone.Text) = 14) then
  begin

    if GTDMCadastroPessoa.QueryDadosPessoa.State in [dsEdit, dsInsert] then

    begin
      GTDMCadastroPessoa.QueryDadosPessoa.FieldByName('ID_PESSOA').AsInteger :=
        GTDMCadastroPessoa.BuscarProximoID;
      GTDMCadastroPessoa.QueryDadosPessoa.Post;
      GTDMCadastroPessoa.QueryDadosPessoa.ApplyUpdates;
    end
    else
      GTDMCadastroPessoa.QueryDadosPessoa.Append;
  end;

end;

procedure TTela_Cadastrp.FormShow(Sender: TObject);
begin
  try
    GTDMCadastroPessoa := TDMCadastroPessoa.Create(Self);
    GTDMCadastroPessoa.BuscarDadosPessoas;
  finally

  end;
end;

procedure TTela_Cadastrp.edtCPFChange(Sender: TObject);
var
  s, numbersOnly, formatted: string;
  i, posCursor: Integer;
begin
  s := edtcpf.Text;

  posCursor := edtcpf.SelStart;

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
    edtcpf.Text := formatted;

    edtcpf.SelStart := Length(formatted);
  end
  else
  begin
    edtcpf.Text := numbersOnly;

    if posCursor > Length(numbersOnly) then
      edtcpf.SelStart := Length(numbersOnly)
    else
      edtcpf.SelStart := posCursor;
  end;
end;

procedure TTela_Cadastrp.edttelefoneChange(Sender: TObject);
var
  s, numbersOnly, formatted: string;
  i, posCursor: Integer;
begin
  s := edttelefone.Text;

  // Salvar posição atual do cursor
  posCursor := edttelefone.SelStart;

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

    edttelefone.Text := formatted;
    edttelefone.SelStart := Length(formatted);
  end
  else
  begin
    // Se tiver menos que 10 dígitos, mostra só números
    edttelefone.Text := numbersOnly;

    if posCursor > Length(numbersOnly) then
      edttelefone.SelStart := Length(numbersOnly)
    else
      edttelefone.SelStart := posCursor;
  end;
end;

end.
