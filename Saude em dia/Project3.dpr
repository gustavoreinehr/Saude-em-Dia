  program Project3;



uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Saude_em_dia in 'Saude_em_dia.pas' {Form3},
  TTela_Principal in 'Tela_Principal.pas' {TelaPrincipal},
  Cadastro_Medicamento in 'Cadastro_Medicamento.pas' {FCadastro_Medicamento},
  Tela_Cadastro in 'Tela_Cadastro.pas' {Tela_Cadastrp},
  Tela_Lembrete in 'Tela_Lembrete.pas' {Tela_Lembretes},
  DataModulePrincipal in 'DataModulePrincipal.pas' {DmPrincipal: TDataModule},
  DataModuleMeticamento in 'DataModuleMeticamento.pas' {DMMedicamento: TDataModule},
  DataModuleCadastroPessoas in 'DataModuleCadastroPessoas.pas' {DMCadastroPessoa: TDataModule},
  DataModuleLembretes in 'DataModuleLembretes.pas' {DataModuleLembrete: TDataModule};

(*uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Saude_em_dia in 'Saude_em_dia.pas' {Form3},
  TTela_Principal in 'Tela_Principal.pas' {TelaPrincipal},

  Cadastro_Medicamento in 'Cadastro_Medicamento.pas' {FCadastro_Medicamento};*)


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TTela_Cadastrp, Tela_Cadastrp);
  Application.CreateForm(TTela_Lembretes, Tela_Lembretes);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFCadastro_Medicamento, FCadastro_Medicamento);
  Application.CreateForm(TTela_Cadastrp, Tela_Cadastrp);
  Application.CreateForm(TTela_Lembretes, Tela_Lembretes);
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TDataModuleLembrete, DataModuleLembrete);
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.Run;
end.
