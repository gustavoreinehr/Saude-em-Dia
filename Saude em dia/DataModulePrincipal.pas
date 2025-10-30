unit DataModulePrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, Vcl.Dialogs, System.IniFiles;

type
  TDmPrincipal = class(TDataModule)
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDConnection1: TFDConnection;
  private
    function BuscarCaminhoBase(): String;
  public
     procedure ConectarBanco;
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPrincipal }

function TDmPrincipal.BuscarCaminhoBase: String;
var
  LIniFile: TIniFile;
  LCaminho: String;

begin
  LCaminho := ExtractFilePath(ParamStr(0));

  if FileExists(LCaminho + 'config.ini') then
  begin
    LIniFile := TIniFile.Create(LCaminho + 'config.ini');
    try
      Result := LIniFile.ReadString('configuracao', 'caminhobanco', '');
    finally
      FreeAndNil(LIniFile);
    end;
  end
  else
  begin
    ShowMessage('Arquivo' + LCaminho + 'config.ini não encontrado!' + sLineBreak
      + 'Verifique');
    Abort
  end;
end;

procedure TDmPrincipal.ConectarBanco;
begin
  BuscarCaminhoBase;
  try
    FDConnection1.Close;
    FDConnection1.Params.Add('Database=' + BuscarCaminhoBase);
    FDConnection1.Params.Add('User_Name=sysdba');
    FDConnection1.Params.Add('Password=masterkey');
    FDConnection1.Connected := True;

  except

    on E: Exception do
      ShowMessage('Não foi possível conectar ao banco');

  end;

end;

end.
