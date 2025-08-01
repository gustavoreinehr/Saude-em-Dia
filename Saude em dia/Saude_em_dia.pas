unit Saude_em_dia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    img1: TImage;
    pnl1: TPanel;
    Label1: TLabel;
    pnlPAINEL_CNPJ: TPanel;
    medtCNPJEdit: TMaskEdit;
    pnlPAINEL_CNPJ1: TPanel;
    Label2: TLabel;
    edtSenha: TEdit;
    ALoginButton: TButton;
    pnl2: TPanel;
    procedure medtCNPJEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);

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
