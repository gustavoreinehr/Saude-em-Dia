unit Tela_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Tela_Cadastro, Cadastro_Medicamento,Tela_Lembrete;

type
  TTelaPrincipal = class(TForm)
    Panel_Cabecalho: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel_Principal: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel_Menu: TPanel;
    PanelCadastro_Pessoa: TPanel;
    img1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    A1: TButton;
    PanelCadastro_Medicamentos: TPanel;
    img2: TImage;
    Label8: TLabel;
    Label9: TLabel;
    A2: TButton;
    PanelCadastro_Lembretes: TPanel;
    img3: TImage;
    Label10: TLabel;
    Label11: TLabel;
    A3: TButton;
    Panel2: TPanel;
    procedure A1Click(Sender: TObject);
    procedure A3Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{$R *.dfm}  // <-- mover para cá, fora do bloco 'type'

var
  TelaPrincipal: TTelaPrincipal;

implementation

uses
  Saude_em_dia;

procedure TTelaPrincipal.A1Click(Sender: TObject);
begin
  Self.Hide;
  try
    Tela_Cadastrp := TTela_Cadastrp.Create(nil);
    try
      Tela_Cadastrp.ShowModal;
    finally
      FreeAndNil(Tela_Cadastrp);
      Self.show
    end;
  finally
  end;
end;

procedure TTelaPrincipal.A2Click(Sender: TObject);
begin
  Self.Hide;
  try
    Tela_Lembretes := TTela_Lembretes.Create(nil);
    try
      Tela_Lembretes.ShowModal;
    finally
      FreeAndNil(Tela_Lembretes);
      Self.show
    end;
  finally
  end;
end;

procedure TTelaPrincipal.A3Click(Sender: TObject);

begin
  Self.Hide;
  try
    FCadastro_Medicamento := TFCadastro_Medicamento.Create(nil);
    try
      FCadastro_Medicamento.ShowModal;
    finally
      FreeAndNil(FCadastro_Medicamento);
      Self.show
    end;
  finally
  end;
end;

end.
