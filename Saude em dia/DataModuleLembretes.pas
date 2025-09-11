unit DataModuleLembretes;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,DataModulePrincipal;

type
  TDataModuleLembrete = class(TDataModule)
    QryLembretes: TFDQuery;
    QryLembretesID_CONTROLA: TIntegerField;
    QryLembretesDATA_E_HORA: TSQLTimeStampField;
    QryLembretesID_RECEITA: TIntegerField;
    QryLembretesID_REMEDIO: TIntegerField;
    QryLembretesDOSAGEM: TIntegerField;
    QryPessoas: TFDQuery;
    QryPessoasID_PESSOA: TIntegerField;
    QryPessoasNOME: TStringField;
    QryPessoasTIPO: TIntegerField;
    QryPessoasCPF: TStringField;
    QryPessoasTELEFONE: TStringField;
    QryPessoasID_FARMACIA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleLembrete: TDataModuleLembrete;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
