unit DataModuleTelaLogin;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModulePrincipal;

type
  TDataModuleLogin = class(TDataModule)
    QryLogin: TFDQuery;
  private
    { Private declarations }
  public
    function ValidarLogin(usuario, senha: String): Boolean;
  end;

var
  DataModuleLogin: TDataModuleLogin;

Const
  SQL = 'select FARMACIA.CNPJ_FARM, FARMACIA.SENHA FROM FARMACIA WHERE FARMACIA.CNPJ_FARM = %0:S AND FARMACIA.SENHA = %1:S';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModuleLogin }

function TDataModuleLogin.ValidarLogin(usuario, senha: String): Boolean;
begin

  QryLogin.Close; // Fecha a consulta, se estiver aberta
  QryLogin.SQL.Clear; // Limpa a consulta anterior
  QryLogin.SQL.Add (Format(SQL, [QuotedStr(usuario), QuotedStr(senha)]));
  // Adiciona a nova consulta
  QryLogin.Open; // Abre a consulta para execução

  Result := not QryLogin.IsEmpty;

end;

end.
