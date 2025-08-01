unit Tela4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Projeto_BANCODADOS,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TCadastro_Conta_Tela = class(TForm)
    DataSource: TDataSource;
    Label1: TLabel;
    dbedtid_farmacia: TDBEdit;
    Label2: TLabel;
    dbmmocnpj_farm: TDBMemo;
    Label3: TLabel;
    dbmmosenha: TDBMemo;
    Label4: TLabel;
    dbmmorazao_social: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cadastro_Conta_Tela: TCadastro_Conta_Tela;

implementation

{$R *.dfm}

end.
