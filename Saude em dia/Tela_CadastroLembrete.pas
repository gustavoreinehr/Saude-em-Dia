unit Tela_CadastroLembrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  DataModuleLembretes, Vcl.WinXPickers, Vcl.WinXCalendars, DataModulePrincipal,
  Vcl.Imaging.pngimage;

type
  TTela_Lembretes = class(TForm)
    BotaoSalvar: TButton;
    BotaoExcluir: TButton;
    BotaoIncluir: TButton;
    AVoltar: TButton;
    PainelBotoes: TPanel;
    DataInicio: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel; // Nome do paciente
    NomePaciente: TLabel;
    Dosagem: TDBComboBox;
    Lembrete: TDBMemo;
    Tabela: TDBGrid;
    DBEdit1: TDBEdit;
    DsLembrete: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DSRemedios: TDataSource;
    DSPessoa: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    DBEdtData: TDBEdit;
    DBEdit2: TDBEdit;
    LblPeriodicidadeEmDias: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure BotaoIncluirClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoSalvarClick(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdtDataChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  Tela_Lembretes: TTela_Lembretes;
  GDmTelaLembrete: TDataModuleLembrete;

implementation

{$R *.dfm}

procedure TTela_Lembretes.BotaoSalvarClick(Sender: TObject);
begin
  // A. VERIFICA SE HÁ UMA OPERAÇÃO EM ANDAMENTO
  if not (GDmTelaLembrete.QryLembretes.State in [dsEdit, dsInsert]) then
  begin
    ShowMessage('Clique em "Incluir" para adicionar um novo lembrete.');
    Exit;
  end;

  // B. VALIDAÇÃO DOS CAMPOS OBRIGATÓRIOS
  // Adapte os nomes dos componentes se necessário (DBLookupComboBox1, 2)
  if DBLookupComboBox1.Text = '' then
  begin
    ShowMessage('O campo "Remédio" é obrigatório.');
    DBLookupComboBox1.SetFocus;
    Exit;
  end;

  if DBLookupComboBox2.Text = '' then // Supondo ser o paciente
  begin
    ShowMessage('O campo "Paciente" é obrigatório.');
    DBLookupComboBox2.SetFocus;
    Exit;
  end;

  if (Trim(DBEdtData.Text) = '') or (Length(DBEdtData.Text) < 10) then
  begin
    ShowMessage('O campo "Data" é obrigatório e deve ser preenchido completamente.');
    DBEdtData.SetFocus;
    Exit;
  end;

  if (Trim(DBEdit1.Text) = '') or (Length(DBEdit1.Text) < 8) then // Supondo ser o horário
  begin
    ShowMessage('O campo "Horário" é obrigatório e deve ser preenchido como hh:mm:ss.');
    DBEdit1.SetFocus;
    Exit;
  end;

  // C. SALVAR OS DADOS
  try
    GDmTelaLembrete.QryLembretes.Post;
    GDmTelaLembrete.QryLembretes.ApplyUpdates;
    ShowMessage('Lembrete salvo com sucesso!'); // <-- MENSAGEM DE SUCESSO

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível salvar o lembrete.' + #13#10 + 'Erro: ' + E.Message);
      GDmTelaLembrete.QryLembretes.CancelUpdates;
    end;
  end;
end;

procedure TTela_Lembretes.DBEdit1Change(Sender: TObject);
var
  S: string;
  HH, MM, SS: Integer;
begin
  // Remove caracteres que não são números
  S := StringReplace(DBEdit1.Text, ':', '', [rfReplaceAll]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);

  // Limita a 6 dígitos (hhmmss)
  if Length(S) > 6 then
    S := Copy(S, 1, 6);

  // Reaplica a máscara hh:mm:ss
  case Length(S) of
    3:
      S := Copy(S, 1, 2) + ':' + Copy(S, 3, 1);
    4:
      S := Copy(S, 1, 2) + ':' + Copy(S, 3, 2);
    5:
      S := Copy(S, 1, 2) + ':' + Copy(S, 3, 2) + ':' + Copy(S, 5, 1);
    6:
      S := Copy(S, 1, 2) + ':' + Copy(S, 3, 2) + ':' + Copy(S, 5, 2);
  end;

  // === Validação da hora ===
  if Length(S) >= 2 then
  begin
    HH := StrToIntDef(Copy(S, 1, 2), 0);
    if (HH < 0) or (HH > 23) then
      Delete(S, Length(S), 1); // remove último dígito inválido
  end;

  if Length(S) >= 5 then
  begin
    MM := StrToIntDef(Copy(S, 4, 2), 0);
    if (MM < 0) or (MM > 59) then
      Delete(S, Length(S), 1); // remove último dígito inválido
  end;

  if Length(S) = 8 then
  begin
    SS := StrToIntDef(Copy(S, 7, 2), 0);
    if (SS < 0) or (SS > 59) then
      Delete(S, Length(S), 1); // remove último dígito inválido
  end;

  // Atualiza o texto
  DBEdit1.OnChange := nil; // evita loop recursivo
  DBEdit1.Text := S;
  DBEdit1.SelStart := Length(DBEdit1.Text); // cursor no fim
  DBEdit1.OnChange := DBEdit1Change;
end;

procedure TTela_Lembretes.DBEdtDataChange(Sender: TObject);
var
  S: string;
  Dia, Mes, Ano: Integer;
begin
  // Remove caracteres que não são números
  S := StringReplace(DBEdtData.Text, '/', '', [rfReplaceAll]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);

  // Limita a 8 dígitos (ddmmyyyy)
  if Length(S) > 8 then
    S := Copy(S, 1, 8);

  // Reaplica a máscara dd/mm/yyyy
  case Length(S) of
    3:
      S := Copy(S, 1, 2) + '/' + Copy(S, 3, 1);
    4:
      S := Copy(S, 1, 2) + '/' + Copy(S, 3, 2);
    5:
      S := Copy(S, 1, 2) + '/' + Copy(S, 3, 2) + '/' + Copy(S, 5, 1);
    6:
      S := Copy(S, 1, 2) + '/' + Copy(S, 3, 2) + '/' + Copy(S, 5, 2);
    7:
      S := Copy(S, 1, 2) + '/' + Copy(S, 3, 2) + '/' + Copy(S, 5, 3);
    8:
      S := Copy(S, 1, 2) + '/' + Copy(S, 3, 2) + '/' + Copy(S, 5, 4);
  end;

  // === Validação básica ===
  if Length(S) >= 2 then
  begin
    Dia := StrToIntDef(Copy(S, 1, 2), 0);
    if (Dia < 1) or (Dia > 31) then
      Delete(S, Length(S), 1); // remove último dígito inválido
  end;

  if Length(S) >= 5 then
  begin
    Mes := StrToIntDef(Copy(S, 4, 2), 0);
    if (Mes < 1) or (Mes > 12) then
      Delete(S, Length(S), 1); // remove último dígito inválido
  end;

  if Length(S) = 10 then
  begin
    Ano := StrToIntDef(Copy(S, 7, 4), 0);
    if (Ano < 2025) then
      Delete(S, Length(S), 1); // não deixa ano menor que 2025
  end;

  // Atualiza o texto
  DBEdtData.OnChange := nil; // evita loop recursivo
  DBEdtData.Text := S;
  DBEdtData.SelStart := Length(DBEdtData.Text); // cursor no fim
  DBEdtData.OnChange := DBEdtDataChange;
end;

procedure TTela_Lembretes.AVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TTela_Lembretes.BotaoExcluirClick(Sender: TObject);
begin
  // 1. VERIFICA SE HÁ ALGO PARA EXCLUIR
  if GDmTelaLembrete.QryLembretes.IsEmpty then
  begin
    ShowMessage('Não há lembretes para excluir.');
    Exit;
  end;

  // 2. MENSAGEM DE CONFIRMAÇÃO
  if MessageDlg('Tem certeza que deseja excluir o lembrete selecionado?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // 3. TRATAMENTO DE ERROS
    try
      GDmTelaLembrete.QryLembretes.Delete;
      GDmTelaLembrete.QryLembretes.ApplyUpdates;
      ShowMessage('Lembrete excluído com sucesso!'); // <-- MENSAGEM DE SUCESSO

    except
      on E: Exception do
      begin
        ShowMessage('Não foi possível excluir o lembrete.' + #13#10 + 'Erro: ' + E.Message);
        GDmTelaLembrete.QryLembretes.CancelUpdates;
      end;
    end;
  end;
end;

procedure TTela_Lembretes.BotaoIncluirClick(Sender: TObject);
begin
  GDmTelaLembrete.QryLembretes.Append;
end;

{ ========================== FORM SHOW ========================== }

procedure TTela_Lembretes.FormCreate(Sender: TObject);
begin
  GDmTelaLembrete := TDataModuleLembrete.Create(nil);
end;

procedure TTela_Lembretes.FormDestroy(Sender: TObject);
begin
  FreeAndNil(GDmTelaLembrete);
end;

procedure TTela_Lembretes.FormShow(Sender: TObject);
begin
  DsLembrete.DataSet := GDmTelaLembrete.QryLembretes;
  DSPessoa.DataSet   := GDmTelaLembrete.QryPessoas;
  DSRemedios.DataSet := GDmTelaLembrete.QryRemedios;
  DSRemedios.DataSet.Active := true;
  DsLembrete.DataSet.Active := true;
  DSPessoa.DataSet.Active := true;

  GDmTelaLembrete.BuscarDadosPessoas; // Suponho que isso abra a QryLembretes
  GDmTelaLembrete.AbrirDataSetPessoas;
  GDmTelaLembrete.AbrirDataSetRemedios;
end;

end.
