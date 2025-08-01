unit Tela_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.dfm}

end.
