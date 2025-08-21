unit Saude_em_dia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Mask, Tela_Principal;

type
  TForm3 = class(TForm)
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
  Form3: TForm3;

implementation

{$R *.dfm}


procedure TForm3.ALoginButtonClick(Sender: TObject);
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

procedure TForm3.edtSenhaChange(Sender: TObject);
var
i: integer;
begin
  if edtSenha.Text <> '' then
    SenhaPrench := true
  else
    SenhaPrench := false;

 edtSenha.PasswordChar := '*';

  VerificaCNPJeSenha;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
ALoginButton.Enabled := False;
end;

procedure TForm3.FormResize(Sender: TObject);
begin

 medtCNPJEdit.Left := (Form3.Width - medtCNPJEdit.Width) div 2;
 EdtSenha.Left := (Form3.Width - EdtSenha.Width) div 2;
  ALoginButton.Left := (Form3.Width - ALoginButton.Width) div 2;
end;

procedure TForm3.medtCNPJEditChange(Sender: TObject);
begin
  if Pos('_', medtCNPJEdit.Text) = 0 then
    CNPJPrench := true
  else
    CNPJPrench := false;

  VerificaCNPJeSenha;
end;

procedure TForm3.VerificaCNPJeSenha;
begin
  ALoginButton.Enabled := (CNPJPrench) and (SenhaPrench);
end;

end.
