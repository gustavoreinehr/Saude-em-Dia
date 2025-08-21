unit Tela_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TTela_Cadastrp = class(TForm)
    Painel: TPanel;
    Painel_Titulo: TPanel;
    Panel_Dados_Cadastro: TPanel;
    LNome_Completo: TLabel;
    LTipo_Pessoa: TLabel;
    edtNome_Completo1: TEdit;
    ComboBoxTipo_Pessoa: TComboBox;
    CPF: TLabel;
    medtCPF: TMaskEdit;
    medtCPF1: TMaskEdit;
    Telefone: TLabel;
    ButtonCadastrar: TButton;
    AVoltar: TButton;
    ButtonExcluir: TButton;
    ButtonIncluir: TButton;
    DBGrid1: TDBGrid;
    ButtonLimpar: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tela_Cadastrp: TTela_Cadastrp;

implementation

{$R *.dfm}

procedure TTela_Cadastrp.FormCreate(Sender: TObject);
begin
edtNome_Completo1.Text := '';
end;

end.
