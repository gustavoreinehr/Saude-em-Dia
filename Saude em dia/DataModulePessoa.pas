unit DataModulePessoa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModulePrincipal;

type
  TDMCadastroPessoa = class(TDataModule)
    QueryDadosPessoa: TFDQuery;
    QryIDPessoa: TFDQuery;
    QueryDadosPessoaID_PESSOA: TIntegerField;
    QueryDadosPessoaNOME: TStringField;
    QueryDadosPessoaCPF: TStringField;
    QueryDadosPessoaTELEFONE: TStringField;
    QryIDPessoaIDPESSOA: TLargeintField;
    FDQryValidarCPF: TFDQuery;
    procedure BuscarDadosPessoas;
  private
  public
    function BuscarProximoID(): integer;
    function ValidarCPF(CPF: String): Boolean;
  end;

var
  DMCadastroPessoa: TDMCadastroPessoa;
  GIDPessoa: integer;

Const
  SQL = 'select PESSOA.CPF FROM PESSOA WHERE PESSOA.CPF = %0:S';

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
  QryIDPessoa.Close;
  QryIDPessoa.SQL.Clear;
  QryIDPessoa.SQL.Add
    ('select coalesce(max (ID_PESSOA) + 1, 1) as IDPESSOA from pessoa');
  QryIDPessoa.Open;
  Result := QryIDPessoa.FieldByName('IDPESSOA').AsInteger;
end;

function TDMCadastroPessoa.ValidarCPF(CPF: String): Boolean;
begin
  FDQryValidarCPF.Close; // Fecha a consulta, se estiver aberta
  FDQryValidarCPF.SQL.Clear; // Limpa a consulta anterior
  FDQryValidarCPF.SQL.Add(Format(SQL, [QuotedStr(CPF)]));
  // Adiciona a nova consulta
  FDQryValidarCPF.Open; // Abre a consulta para execução

  Result := not FDQryValidarCPF.IsEmpty;

end;

end.
