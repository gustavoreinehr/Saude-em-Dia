unit Saude_em_dia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Mask, Tela_Principal, Vcl.Imaging.pngimage, Vcl.DBCtrls,
  DataModuleTelaLogin, Data.DB;

type
  TForm3 = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    img1: TImage;
    PanelCNPJ: TPanel;
    LabelCNPJ: TLabel;
    PanelEditCNPJ: TPanel;
    PanelEditSenha: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    ALoginButton: TButton;
    DSLogin: TDataSource;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ALoginButtonClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
  end;

var
  Form3: TForm3;
  GDMLogin: TDataModuleLogin;

implementation

{$R *.dfm}

procedure TForm3.ALoginButtonClick(Sender: TObject);
var
  LoginValidado: Boolean;
begin
  Self.Hide;
  if GDMLogin.ValidarLogin(MaskEdit1.Text, Edit1.Text) then
  begin
    TelaPrincipal := TTelaPrincipal.Create(nil);
    try
      TelaPrincipal.ShowModal;
      Form3.Close;
    finally
      FreeAndNil(TelaPrincipal);
    end;
  end
  else
    ShowMessage('Senha ou usuário inválido');
  Form3.ShowModal;
end;

procedure TForm3.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
  begin
    ALoginButton.Click;
  end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  GDMLogin := TDataModuleLogin.Create(Self);

end;

end.
