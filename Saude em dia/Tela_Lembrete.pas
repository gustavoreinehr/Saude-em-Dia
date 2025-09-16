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
    BotaoEditar: TButton;
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
    DbEdtHoraInicio: TDBEdit;
    DBEdit1: TDBEdit;
    DsLembrete: TDataSource;
    DsPessoas: TDataSource;
    DbCbPessoa: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure BotaoIncluirClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  Tela_Lembretes: TTela_Lembretes;

implementation

{$R *.dfm}

procedure TTela_Lembretes.BotaoEditarClick(Sender: TObject);
begin
  if DataModuleLembrete.QryLembretes.State in [dsEdit, dsInsert] then
  begin
    DataModuleLembrete.QryLembretes.Post;
    DataModuleLembrete.QryLembretes.ApplyUpdates;
  end;
end;

procedure TTela_Lembretes.BotaoExcluirClick(Sender: TObject);
begin
  DataModuleLembrete.QryLembretes.Delete;
  DataModuleLembrete.QryLembretes.ApplyUpdates;
end;

procedure TTela_Lembretes.BotaoIncluirClick(Sender: TObject);
begin
  // Se não estiver editando/inserindo, inicia inclusão
  if DataModuleLembrete.QryLembretes.State in [dsEdit, dsInsert] then

  begin
    DataModuleLembrete.QryLembretes.FieldByName('ID_CONTROLA').AsInteger :=
      DataModuleLembrete.BuscarProximoID;
    DataModuleLembrete.QryLembretes.Post;
    DataModuleLembrete.QryLembretes.ApplyUpdates;
  end
  else
    DataModuleLembrete.QryLembretes.Append;
end;

{ ========================== FORM SHOW ========================== }

procedure TTela_Lembretes.FormShow(Sender: TObject);
begin
  try
    DataModuleLembrete.BuscarDadosPessoas;
  finally

  end;

end;

end.
