unit Projeto_BANCODADOS;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.PG, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDMDataBase = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Connect: TFDConnection;
    fdphysqltdrvrlnk1: TFDPhysSQLiteDriverLink;
    FDProduto: TFDQuery;
    FDProdutoid: TFDAutoIncField;
    FDProdutopreco: TFloatField;
    FDProdutoquantidade: TIntegerField;
    FDProdutonome: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDataBase: TDMDataBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TDMDataBase.DataModuleCreate(Sender: TObject);
begin
  Connect.Connected := True;
  FDProduto.open;
end;

procedure TDMDataBase.DataModuleDestroy(Sender: TObject);
begin
  FDProduto.close;
  Connect.Connected := false;

end;

end.
