program Project3;



uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Saude_em_dia in 'Saude_em_dia.pas' {Form3},
  TTela_Principal in 'Tela_Principal.pas' {TelaPrincipal},
  Castro_Meicamento in 'Castro_Meicamento.pas' {Form5},
  Tela_Lembrete in 'Tela_Lembrete.pas' {Tela_Lembretes},
  Tela_Cadastro in 'Tela_Cadastro.pas' {Tela_Cadastrp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTela_Lembretes, Tela_Lembretes);
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TTela_Cadastrp, Tela_Cadastrp);
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

