unit Saude_em_dia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Mask, Tela_Principal, Vcl.Imaging.pngimage;

type
  TTelaLogin = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    img1: TImage;
    PanelCNPJ: TPanel;
    LabelCNPJ: TLabel;
    PanelEditCNPJ: TPanel;
    medtCNPJEdit: TMaskEdit;
    PanelEditSenha: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    EdtSenha: TEdit;
    Panel2: TPanel;
    ALoginButton: TButton;
    procedure medtCNPJEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure ALoginButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
     CNPJPrench: Boolean;
    SenhaPrench: Boolean;
  public
   procedure VerificaCNPJeSenha;
  end;

var
  TelaLogin: TTelaLogin;

implementation

{$R *.dfm}


procedure TTelaLogin.ALoginButtonClick(Sender: TObject);
begin
  Self.Hide;
  try
    TelaPrincipal := TTelaPrincipal.Create(nil);
    try
      TelaPrincipal.ShowModal;
    finally
      FreeAndNil(TelaPrincipal);
    end;
  finally
    Close;
  end;
end;

procedure TTelaLogin.edtSenhaChange(Sender: TObject);
begin
  if edtSenha.Text <> '' then
    SenhaPrench := true
  else
    SenhaPrench := false;

 edtSenha.PasswordChar := '*';

  VerificaCNPJeSenha;
end;

procedure TTelaLogin.FormCreate(Sender: TObject);
begin
ALoginButton.Enabled := False;
end;

procedure TTelaLogin.FormResize(Sender: TObject);
begin

 medtCNPJEdit.Left := (TelaLogin.Width - medtCNPJEdit.Width) div 2;
 EdtSenha.Left := (TelaLogin.Width - EdtSenha.Width) div 2;
  ALoginButton.Left := (TelaLogin.Width - ALoginButton.Width) div 2;
end;

procedure TTelaLogin.medtCNPJEditChange(Sender: TObject);
begin
  if Pos('_', medtCNPJEdit.Text) = 0 then
    CNPJPrench := true
  else
    CNPJPrench := false;

  VerificaCNPJeSenha;
end;

procedure TTelaLogin.VerificaCNPJeSenha;
begin
  ALoginButton.Enabled := (CNPJPrench) and (SenhaPrench);
end;

end.
