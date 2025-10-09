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
    QryLembretes: TFDQuery;
    QryIDLembrete: TFDQuery;
    QryIDLembreteIDCONTROLA: TLargeintField;
    QryPessoas: TFDQuery;
    QryLembretesPessoa: TStringField;
    QryRemedios: TFDQuery;
    QryRemediosID_REMEDIO: TIntegerField;
    QryRemediosNOME: TStringField;
    QryRemediosCLASSIFICACAO: TStringField;
    QryRemediosFORMA_FARMACEUTICA: TStringField;
    QryRemediosVALIDADE: TDateField;
    QryRemediosVIA_ADMINISTRACAO: TStringField;
    QryRemediosUNIDADE_MEDIDA: TStringField;
    QryRemediosDESCRICAO: TStringField;
    QryLembretesID_CONTROLA: TIntegerField;
    QryLembretesID_REMEDIO: TIntegerField;
    QryLembretesDOSAGEM: TStringField;
    QryLembretesMENSAGEM_LEMBRETE: TStringField;
    QryLembretesID_PESSOA: TIntegerField;
    QryLembretesDATA: TDateField;
    QryLembretesHORA: TTimeField;
    QryLembretesPERIODICIDADE: TIntegerField;
    QryPessoasID_PESSOA: TIntegerField;
    QryPessoasNOME: TStringField;
    QryPessoasCPF: TStringField;
    QryPessoasTELEFONE: TStringField;
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
end;

procedure TDataModuleLembrete.AbrirDataSetRemedios;
begin
  QryRemedios.Connection := DmPrincipal.FDConnection1;
  QryRemedios.Close;
  QryRemedios.SQL.Clear;
  QryRemedios.SQL.Add('select * from REMEDIO');
  QryRemedios.Open;
end;

procedure TDataModuleLembrete.BuscarDadosPessoas;
begin
  QryLembretes.Connection := DmPrincipal.FDConnection1;
  QryLembretes.Close;
  QryLembretes.SQL.Clear;
  QryLembretes.SQL.Add('select * from CONTROLA');
  QryLembretes.Open;
end;

function TDataModuleLembrete.BuscarProximoID: integer;
begin
  QryIDLembrete.Close; // Fecha a consulta, se estiver aberta
  QryIDLembrete.SQL.Clear; // Limpa a consulta anterior
  QryIDLembrete.SQL.Add
    ('select coalesce(max (ID_CONTROLA) + 1, 1) as IDCONTROLA from CONTROLA');
  // Adiciona a nova consulta
  QryIDLembrete.Open; // Abre a consulta para execução
  Result := QryIDLembrete.FieldByName('IDCONTROLA').AsInteger;
  // Obtém o valor do campo IDPESSOA
end;

procedure TDataModuleLembrete.QryLembretesNewRecord(DataSet: TDataSet);
begin
  DataModuleLembrete.QryLembretes.FieldByName('ID_CONTROLA').AsInteger :=
    DataModuleLembrete.BuscarProximoID;
end;

end.
