unit Tela_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TTela_Cadastrp = class(TForm)
    Panel_Dados_Cadastro: TPanel;
    LNome_Completo: TLabel;
    LTipo_Pessoa: TLabel;
    edtNome_Completo1: TEdit;
    ComboBoxTipo_Pessoa: TComboBox;
    CPF: TLabel;
    medtCPF: TMaskEdit;
    medtTelefone: TMaskEdit;
    Telefone: TLabel;
    ButtonCadastrar: TButton;
    ButtonExcluir: TButton;
    ButtonIncluir: TButton;
    ButtonLimpar: TButton;
    PanelBotoes: TPanel;
    PanelInferior: TPanel;
    DBGrid1: TDBGrid;
    AVoltar: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButtonLimparClick(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tela_Cadastrp: TTela_Cadastrp;

implementation

{$R *.dfm}

procedure TTela_Cadastrp.AVoltarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TTela_Cadastrp.ButtonLimparClick(Sender: TObject);
begin
  edtNome_Completo1.Text := '';
  ComboBoxTipo_Pessoa.ItemIndex := 0;
  medtCPF.Text := '';
  medtTelefone.Text := '';
end;

procedure TTela_Cadastrp.FormCreate(Sender: TObject);
begin
  edtNome_Completo1.Text := '';
end;

end.
