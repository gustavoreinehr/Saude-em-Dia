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
    QryLembretesID_CONTROLA: TIntegerField;
    QryLembretesDATA: TDateField;
    QryLembretesHORA: TTimeField;
    QryLembretesID_RECEITA: TIntegerField;
    QryLembretesID_REMEDIO: TIntegerField;
    QryLembretesDOSAGEM: TStringField;
    QryLembretesMENSAGEM_LEMBRETE: TStringField;
    QryPessoas: TFDQuery;
  private
    { Private declarations }
  public
    function BuscarProximoID(): integer;
    procedure BuscarDadosPessoas;
  end;

var
  DataModuleLembrete: TDataModuleLembrete;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModuleLembrete }

procedure TDataModuleLembrete.BuscarDadosPessoas;
begin
  Qrylembretes.Connection := DmPrincipal.FDConnection1;
  Qrylembretes.Close;
  Qrylembretes.SQL.Clear;
  QryLembretes.SQL.Add ('select * from CONTROLA');
  Qrylembretes.Open;
  QryLembretes.Active := true;
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

end.
