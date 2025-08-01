unit Tela3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Projeto.Produto;

type
  TForm1 = class(TForm)
    mmCadastro_Conta: TMainMenu;
    CadastrodeContas1: TMenuItem;
    procedure CadastrodeContas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CadastrodeContas1Click(Sender: TObject);
begin
   Projeto_Produto.ShowModal;
end;

end.
