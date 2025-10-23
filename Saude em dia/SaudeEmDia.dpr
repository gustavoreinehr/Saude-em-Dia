  program SaudeEmDia;



uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Tela_Login in 'Tela_Login.pas' {Form3},
  TTela_Principal in 'Tela_Principal.pas' {TelaPrincipal},
  Tela_CadastroMedicamento in 'Tela_CadastroMedicamento.pas' {FCadastro_Medicamento},
  Tela_CadastroPessoa in 'Tela_CadastroPessoa.pas' {Tela_Cadastrp},
  Tela_CadastroLembrete in 'Tela_CadastroLembrete.pas' {Tela_Lembretes},
  DataModulePrincipal in 'DataModulePrincipal.pas' {DmPrincipal: TDataModule},
  DataModuleMedicamento in 'DataModuleMedicamento.pas' {DMMedicamento: TDataModule},
  DataModulePessoa in 'DataModulePessoa.pas' {DMCadastroPessoa: TDataModule},
  DataModuleLembretes in 'DataModuleLembretes.pas' {DataModuleLembrete: TDataModule},
  DataModuleTelaLogin in 'DataModuleTelaLogin.pas' {DataModuleLogin: TDataModule};

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
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TTela_Cadastrp, Tela_Cadastrp);
  Application.CreateForm(TTela_Lembretes, Tela_Lembretes);
  Application.CreateForm(TFCadastro_Medicamento, FCadastro_Medicamento);
  Application.CreateForm(TTela_Cadastrp, Tela_Cadastrp);
  Application.CreateForm(TTela_Lembretes, Tela_Lembretes);
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  TStyleManager.TrySetStyle('Light');
  Application.Run;
end.
