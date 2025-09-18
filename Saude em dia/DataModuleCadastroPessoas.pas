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
    QryIDPessoa: TFDQuery;
    QueryDadosPessoaID_PESSOA: TIntegerField;
    QueryDadosPessoaNOME: TStringField;
    QueryDadosPessoaTIPO: TStringField;
    QueryDadosPessoaCPF: TStringField;
    QueryDadosPessoaTELEFONE: TStringField;
    QueryDadosPessoaID_FARMACIA: TIntegerField;
    QryIDPessoaIDPESSOA: TLargeintField;
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
  QryIDPessoa.Close;
  QryIDPessoa.SQL.Clear;
  QryIDPessoa.SQL.Add('select coalesce(max (ID_PESSOA) + 1, 1) as IDPESSOA from pessoa');
  QryIDPessoa.Open;
  Result := QryIDPessoa.FieldByName('IDPESSOA').AsInteger;
end;

end.
