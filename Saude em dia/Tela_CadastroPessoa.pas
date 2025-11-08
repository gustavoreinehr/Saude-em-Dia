unit Tela_CadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, DataModulePessoa,
  Vcl.Imaging.pngimage;

type
  TTela_Cadastrp = class(TForm)
    PnlDadosCadastro: TPanel;
    LblNomeCompleto: TLabel;
    LblCPF: TLabel;
    LblTelefone: TLabel;
    BtnSalvar: TButton;
    BtnExcluir: TButton;
    BtnIncluir: TButton;
    PnlGrid: TPanel;
    GridDadosPessoa: TDBGrid;
    BtnVoltar: TButton;
    edtNomeCompleto: TDBEdit;
    edtCPF: TDBEdit;
    edttelefone: TDBEdit;
    DataSourcePessoas: TDataSource;
    Panel1: TPanel;
    Image1: TImage;
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure edtCPFChange(Sender: TObject);
    procedure edttelefoneChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
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

procedure TTela_Cadastrp.BtnSalvarClick(Sender: TObject);
var
  LCpfFormatado: string;


begin
  // A. VERIFICA SE HÁ UMA OPERAÇÃO EM ANDAMENTO
  //    Só continua se o dataset estiver em modo de inserção ou edição.
  if not (GTDMCadastroPessoa.QueryDadosPessoa.State in [dsEdit, dsInsert]) then
  begin
    ShowMessage('Nenhuma inclusão ou edição em andamento para salvar!');
    Exit; // Sai do procedimento, pois não há o que fazer.
  end;

  if GTDMCadastroPessoa.ValidarCPF(edtCPF.Text) then
  begin
  ShowMessage('CPF Já cadastrado');
  exit;
  end;

  // B. VALIDAÇÃO DOS CAMPOS (lógica que estava no botão Incluir)
  LCpfFormatado := StringReplace(edtCPF.Text, '.', '', [rfReplaceAll]);
  LCpfFormatado := StringReplace(LCpfFormatado, '-', '', [rfReplaceAll]);

  if Length(edtNomeCompleto.Text) < 10 then
  begin
    ShowMessage('O nome precisa conter no mínimo 10 caracteres.');
    edtNomeCompleto.SetFocus;
    Exit; // Interrompe o salvamento
  end;

  if Length(LCpfFormatado) <> 11 then
  begin
    ShowMessage('O CPF precisa ter 11 dígitos.');
    edtCPF.SetFocus;
    Exit; // Interrompe o salvamento
  end;

  // A validação do telefone deve considerar o formato com máscara: (XX)XXXXX-XXXX -> 14 caracteres
  if Length(edttelefone.Text) < 14 then
  begin
    ShowMessage('O telefone precisa ser preenchido completamente (DDD + número).');
    edttelefone.SetFocus;
    Exit; // Interrompe o salvamento
  end;

  // C. SALVAR OS DADOS
  //    Se todas as validações passaram, o código chega até aqui.

  // Atribui o próximo ID apenas se for uma nova inclusão (dsInsert)
  if GTDMCadastroPessoa.QueryDadosPessoa.State = dsInsert then
  begin
    GTDMCadastroPessoa.QueryDadosPessoa.FieldByName('ID_PESSOA').AsInteger :=
      GTDMCadastroPessoa.BuscarProximoID;
  end;

  // Efetivamente salva os dados
  GTDMCadastroPessoa.QueryDadosPessoa.Post;
  GTDMCadastroPessoa.QueryDadosPessoa.ApplyUpdates;

  ShowMessage('Dados salvos com sucesso!');
end;

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

procedure TTela_Cadastrp.BtnExcluirClick(Sender: TObject);
begin
  // 1. VERIFICAR SE HÁ UM REGISTRO SELECIONADO
  //    Se a Query estiver vazia (sem registros), não há o que excluir.
  if GTDMCadastroPessoa.QueryDadosPessoa.IsEmpty then
  begin
    ShowMessage('Não há nenhum registro para excluir.');
    Exit;
  end;

  // 2. ADICIONAR UMA MENSAGEM DE CONFIRMAÇÃO (BOA PRÁTICA)
  //    Isso evita que o usuário exclua registros acidentalmente.
  if MessageDlg('Tem certeza que deseja excluir o registro selecionado?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // 3. ADICIONAR TRATAMENTO DE ERROS (A PARTE MAIS IMPORTANTE)
    //    Isso vai capturar qualquer erro que o banco de dados retorne.
    try
      // Executa o comando de exclusão no registro atualmente selecionado na grid
      GTDMCadastroPessoa.QueryDadosPessoa.Delete;
      GTDMCadastroPessoa.QueryDadosPessoa.ApplyUpdates;

      ShowMessage('Registro excluído com sucesso!');
    except
      on E: Exception do
      begin
        // Se algo der errado (ex: chave estrangeira), esta mensagem será exibida.
        ShowMessage('Não foi possível excluir o registro.' + #13#10 +
                    'Erro retornado pelo banco de dados: ' + E.Message);

        // Cancela a operação de exclusão localmente para o dataset voltar ao normal
        GTDMCadastroPessoa.QueryDadosPessoa.CancelUpdates;
      end;
    end;
  end;
end;

procedure TTela_Cadastrp.BtnIncluirClick(Sender: TObject);
begin
  // 1. Coloca o dataset em modo de inserção.
  //    Isso limpa automaticamente os campos (DBEdits) ligados a ele.
  GTDMCadastroPessoa.QueryDadosPessoa.Append;

  // 2. Coloca o foco no primeiro campo para facilitar a digitação.
  edtNomeCompleto.SetFocus;
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
