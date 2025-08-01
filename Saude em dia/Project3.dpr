program Project3;

uses
  Vcl.Forms,
  Saude_em_dia in 'Saude_em_dia.pas' {Form3},
  Vcl.Themes,
  Vcl.Styles,
  Projeto_BANCODADOS in 'Projeto_BANCODADOS.pas' {DMDataBase: TDataModule},
  Tela3 in 'Tela3.pas' {Form1},
  Tela_Cadastro in 'Tela_Cadastro.pas' {Form2},
  Tela_Principal in 'Tela_Principal.pas' {Form4},
  Projeto.Produto in 'Projeto.Produto.pas' {Projeto_Produto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
//Application.CreateForm(TForm4, Form4);
//  Application.CreateForm(TForm2, Form2);
//  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDMDataBase, DMDataBase);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TProjeto_Produto, Projeto_Produto);
  Application.Run;
end.
