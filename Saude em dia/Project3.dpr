program Project3;



uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Saude_em_dia in 'Saude_em_dia.pas' {Form3},
  Tela_Cadastro in 'Tela_Cadastro.pas' {/  Tela_Principal in 'Tela_Principal.pas' {Form4},
  TTela_Principal in 'Tela_Principal.pas' {TelaPrincipal},
  Castro_Meicamento in 'Castro_Meicamento.pas' {Form5},
  Cadastro_Medicamento in '..\..\..\Saude em dia-20250807T232549Z-1-001\Saude em dia\Cadastro_Medicamento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.Run;
end.
