unit DataModuleLembretes;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DataModulePrincipal;

type
  TDataModuleLembrete = class(TDataModule)
    QryIDLembrete: TFDQuery;
    QryIDLembreteIDCONTROLA: TLargeintField;
    QryPessoas: TFDQuery;
    QryRemedios: TFDQuery;
    QryRemediosID_REMEDIO: TIntegerField;
    QryRemediosNOME: TStringField;
    QryRemediosCLASSIFICACAO: TStringField;
    QryRemediosFORMA_FARMACEUTICA: TStringField;
    QryRemediosVALIDADE: TDateField;
    QryRemediosVIA_ADMINISTRACAO: TStringField;
    QryRemediosUNIDADE_MEDIDA: TStringField;
    QryRemediosDESCRICAO: TStringField;
    QryPessoasID_PESSOA: TIntegerField;
    QryPessoasNOME: TStringField;
    QryPessoasCPF: TStringField;
    QryPessoasTELEFONE: TStringField;
    QryLembretes: TFDQuery;
    QryLembretesID_CONTROLA: TIntegerField;
    QryLembretesID_REMEDIO: TIntegerField;
    QryLembretesDOSAGEM: TStringField;
    QryLembretesMENSAGEM_LEMBRETE: TStringField;
    QryLembretesID_PESSOA: TIntegerField;
    QryLembretesDATA: TDateField;
    QryLembretesHORA: TTimeField;
    QryLembretesPERIODICIDADE: TIntegerField;
    QryLembretesNOMEPESSOA: TStringField;
    procedure QryLembretesNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function BuscarProximoID(): integer;
    procedure BuscarDadosPessoas;
    procedure AbrirDataSetPessoas;
    procedure AbrirDataSetRemedios;
  end;

var
  DataModuleLembrete: TDataModuleLembrete;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModuleLembrete }

procedure TDataModuleLembrete.AbrirDataSetPessoas;
begin
  QryPessoas.Connection := DmPrincipal.FDConnection1;
  QryPessoas.Close;
  QryPessoas.SQL.Clear;
  QryPessoas.SQL.Add('select * from PESSOA');
  QryPessoas.Open;
  QryPessoas.Active := True; // Garante que a query está ativa
end;

procedure TDataModuleLembrete.AbrirDataSetRemedios;
begin
  QryRemedios.Connection := DmPrincipal.FDConnection1;
  QryRemedios.Close;
  QryRemedios.SQL.Clear;
  QryRemedios.SQL.Add('select * from REMEDIO');
  QryRemedios.Open;
  QryRemedios.Active := True; // Garante que a query está ativa
end;

procedure TDataModuleLembrete.BuscarDadosPessoas;
begin
  QryLembretes.Connection := DmPrincipal.FDConnection1;
  QryLembretes.Close;
  QryLembretes.SQL.Clear;
  QryLembretes.SQL.Add
    ('SELECT C.* FROM CONTROLA C INNER JOIN PESSOA P ON (C.ID_PESSOA = P.ID_PESSOA)');
  QryLembretes.Open;
  QryLembretes.Active := True; // Garante que a query está ativa
end;

function TDataModuleLembrete.BuscarProximoID: integer;
begin
  // Garante que a conexão está atribuída
  QryIDLembrete.Connection := DmPrincipal.FDConnection1;
  QryIDLembrete.Close;
  QryIDLembrete.SQL.Clear;
  // Pede o próximo valor para o generator de forma segura
  QryIDLembrete.SQL.Add
    ('select gen_id(GN_CONTROLA, 1) AS IDCONTROLA FROM RDB$DATABASE');
  QryIDLembrete.Open;
  // O resultado é obtido e a query pode ser fechada, não precisa ficar ativa
  Result := QryIDLembrete.FieldByName('IDCONTROLA').AsInteger;
end;

procedure TDataModuleLembrete.QryLembretesNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_CONTROLA').AsInteger := BuscarProximoID;
end;

end.
