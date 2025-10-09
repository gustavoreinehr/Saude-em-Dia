unit Tela_Lembrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  DataModuleLembretes, Vcl.WinXPickers, Vcl.WinXCalendars, DataModulePrincipal;

type
  TTela_Lembretes = class(TForm)
    BarraInferior: TPanel;
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
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    DBEdtData: TDBEdit;
    DBEdit2: TDBEdit;
    LblPeriodicidadeEmDias: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BotaoIncluirClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoSalvarClick(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdtDataChange(Sender: TObject);
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
  if GDmTelaLembrete.QryLembretes.State in [dsEdit, dsInsert] then
  begin
    GDmTelaLembrete.QryLembretes.Post;
    GDmTelaLembrete.QryLembretes.ApplyUpdates;

    // Lembre-se de adicionar a lógica para controlar
    // a aparência dos botões (habilitar/desabilitar)
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
  GDmTelaLembrete.QryLembretes.Delete;
  GDmTelaLembrete.QryLembretes.ApplyUpdates;
end;

procedure TTela_Lembretes.BotaoIncluirClick(Sender: TObject);
begin
  GDmTelaLembrete.QryLembretes.Append;
end;

{ ========================== FORM SHOW ========================== }

procedure TTela_Lembretes.FormShow(Sender: TObject);
begin
  try
    GDmTelaLembrete := TDataModuleLembrete.Create(nil);
    GDmTelaLembrete.BuscarDadosPessoas;
    GDmTelaLembrete.AbrirDataSetPessoas;
    GDmTelaLembrete.AbrirDataSetRemedios;
  finally
    FreeAndNil(GDmTelaLembrete);
  end;

end;

end.
