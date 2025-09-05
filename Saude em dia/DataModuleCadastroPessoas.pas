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
    QueryDadosPessoaTIPO: TIntegerField;
    QueryDadosPessoaCPF: TStringField;
    QueryDadosPessoaTELEFONE: TStringField;
    QueryDadosPessoaID_FARMACIA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastroPessoa: TDMCadastroPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
