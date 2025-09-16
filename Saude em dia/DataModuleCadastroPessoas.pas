unit DataModuleCadastroPessoas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModulePrincipal;

type
  TDMCadastroPessoa = class(TDataModule)
    QueryDadosPessoa: TFDQuery;
    QueryDadosPessoaID_PESSOA: TIntegerField;
    QueryDadosPessoaNOME: TStringField;
    QueryDadosPessoaCPF: TStringField;
    QueryDadosPessoaTELEFONE: TStringField;
    QueryDadosPessoaID_FARMACIA: TIntegerField;
    QueryDadosPessoaTIPO: TStringField;
    QryIDPessoa: TFDQuery;
    procedure BuscarDadosPessoas;
  private
  public
    function BuscarProximoID(): integer;
  end;

var
  DMCadastroPessoa: TDMCadastroPessoa;
  GIDPessoa: Integer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDMCadastroPessoa.BuscarDadosPessoas;
begin
  QueryDadosPessoa.Close;
  QueryDadosPessoa.SQL.Clear;
  QueryDadosPessoa.SQL.Add('select * from pessoa');
  QueryDadosPessoa.Open;
end;

function TDMCadastroPessoa.BuscarProximoID: integer;

begin
  QryIDPessoa.Close; // Fecha a consulta, se estiver aberta
QryIDPessoa.SQL.Clear; // Limpa a consulta anterior
QryIDPessoa.SQL.Add('select coalesce(max(ID_PESSOA) + 1, 1) as IDPESSOA from pessoa'); // Adiciona a nova consulta
QryIDPessoa.Open; // Abre a consulta para execução
Result := QryIDPessoa.FieldByName('IDPESSOA').AsInteger; // Obtém o valor do campo IDPESSOA
end;

end.
