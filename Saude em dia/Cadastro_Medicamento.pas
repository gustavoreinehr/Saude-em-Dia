unit Cadastro_Medicamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  System.IniFiles, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  DataModuleMeticamento, Vcl.Imaging.pngimage;

type
  TFCadastro_Medicamento = class(TForm)
    AVoltar: TButton;
    Incluir_Button: TButton;
    Editar_Button: TButton;
    Excluir_Button: TButton;
    Painel_Principal: TPanel;
    Button1: TButton;
    Button2: TButton;
    Grid_Cadastrados: TDBGrid;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Nome_Medicamento_Edit: TDBEdit;
    Unidade_Medida_Comb: TDBComboBox;
    Forma_Farmaceutica_Comb: TDBComboBox;
    Via_Adm_Comb: TDBComboBox;
    Classificacao_Comb: TDBComboBox;
    Edit_Descricao: TDBEdit;
    DataSourceBuscarMedicamentos: TDataSource;
    Validade_Time: TDBEdit;
    Panel1: TPanel;
    Image1: TImage;
    procedure AVoltarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Incluir_ButtonClick(Sender: TObject);
    procedure Editar_ButtonClick(Sender: TObject);
    procedure Excluir_ButtonClick(Sender: TObject);
  private
    function ParseDateBR(const S: string; out D: TDateTime): Boolean;
    procedure Nome_Obrigatorio;
    procedure Unidade_Obrigatorio;
    procedure Validade_Obrigatorio;
    procedure Class_Obrigatorio;
  public
  end;

var
  FCadastro_Medicamento: TFCadastro_Medicamento;
  DMMedicamentos: TDMMedicamento;

implementation

{$R *.dfm}

procedure TFCadastro_Medicamento.AVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCadastro_Medicamento.Button3Click(Sender: TObject);
begin

  Nome_Medicamento_Edit.Text := '';
  Unidade_Medida_Comb.Text := '';
  Via_Adm_Comb.Text := '';
  Forma_Farmaceutica_Comb.Text := '';
  Classificacao_Comb.Text := '';
  Edit_Descricao.Text := '';
  Validade_Time.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TFCadastro_Medicamento.Class_Obrigatorio;
begin
  if Trim(Classificacao_Comb.Text) = '' then
  begin
    ShowMessage('O Campo Classificação é Obrigatório');
    Classificacao_Comb.SetFocus;
  end;
end;

procedure TFCadastro_Medicamento.Editar_ButtonClick(Sender: TObject);
var
  D: TDateTime;
begin
  // A. VERIFICA SE HÁ UMA OPERAÇÃO EM ANDAMENTO
  //    Só continua se o dataset estiver em modo de inserção (novo) ou edição.
  if not (DMMedicamentos.FDQRYBuscarMedicamntos.State in [dsEdit, dsInsert]) then
  begin
    // Se o usuário clicar em salvar sem ter iniciado uma inclusão ou edição,
    // o sistema coloca o registro atual em modo de edição automaticamente.
    if DMMedicamentos.FDQRYBuscarMedicamntos.IsEmpty then
    begin
      ShowMessage('Não há registros para salvar. Clique em "Incluir" para adicionar um novo.');
      Exit;
    end;
    DMMedicamentos.FDQRYBuscarMedicamntos.Edit;
  end;

  // B. VALIDAÇÕES DOS CAMPOS OBRIGATÓRIOS
  if Trim(Nome_Medicamento_Edit.Text) = '' then
  begin
    Nome_Obrigatorio;
    Exit;
  end;

  if Trim(Unidade_Medida_Comb.Text) = '' then
  begin
    Unidade_Obrigatorio;
    Exit;
  end;

  if not ParseDateBR(Validade_Time.Text, D) then
  begin
    ShowMessage('Informe uma data de validade válida no formato dd/mm/aaaa.');
    Validade_Time.SetFocus;
    Exit;
  end;

  if D < Date then
  begin
    ShowMessage('A data de validade não pode ser anterior a hoje.');
    Validade_Time.SetFocus;
    Exit;
  end;

  if Trim(Classificacao_Comb.Text) = '' then
  begin
    Class_Obrigatorio;
    Exit;
  end;

  // C. SALVAR OS DADOS COM TRATAMENTO DE ERROS
  try
    // Atribui a data validada ao campo do dataset
    if DMMedicamentos.FDQRYBuscarMedicamntos.FindField('Validade') <> nil then
      DMMedicamentos.FDQRYBuscarMedicamntos.FieldByName('Validade').AsDateTime := D;

    // Salva os dados no banco
    DMMedicamentos.FDQRYBuscarMedicamntos.Post;
    DMMedicamentos.FDQRYBuscarMedicamntos.ApplyUpdates;

    ShowMessage('Medicamento salvo com sucesso!'); // <-- MENSAGEM DE SUCESSO

  except
    on E: Exception do
    begin
      // Exibe qualquer erro que o banco de dados retornar
      ShowMessage('Ocorreu um erro ao salvar o medicamento.' + #13#10 +
                  'Erro: ' + E.Message);
      DMMedicamentos.FDQRYBuscarMedicamntos.CancelUpdates; // Desfaz a tentativa de salvar
    end;
  end;
end;

procedure TFCadastro_Medicamento.Excluir_ButtonClick(Sender: TObject);
begin
  // 1. VERIFICA SE HÁ UM REGISTRO SELECIONADO
  if DMMedicamentos.FDQRYBuscarMedicamntos.IsEmpty then
  begin
    ShowMessage('Não há nenhum medicamento para excluir.');
    Exit;
  end;

  // 2. MENSAGEM DE CONFIRMAÇÃO (ESSENCIAL!)
  if MessageDlg('Tem certeza que deseja excluir este medicamento?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // 3. TRATAMENTO DE ERROS NA EXCLUSÃO
    try
      DMMedicamentos.FDQRYBuscarMedicamntos.Delete;
      DMMedicamentos.FDQRYBuscarMedicamntos.ApplyUpdates;

      ShowMessage('Medicamento excluído com sucesso!'); // <-- MENSAGEM DE SUCESSO

    except
      on E: Exception do
      begin
        // Avisa sobre o erro (geralmente por chave estrangeira)
        ShowMessage('Não foi possível excluir o registro.' + #13#10 +
                    'Pode estar em uso em outra parte do sistema.' + #13#10 +
                    'Erro: ' + E.Message);
        DMMedicamentos.FDQRYBuscarMedicamntos.CancelUpdates; // Desfaz a exclusão local
      end;
    end;
  end;
end;

procedure TFCadastro_Medicamento.FormCreate(Sender: TObject);
begin
  Validade_Time.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TFCadastro_Medicamento.FormShow(Sender: TObject);
var
  F: TField;
begin

  DMMedicamentos := TDMMedicamento.Create(Self);
  DMMedicamentos.FDQRYBuscarMedicamntos.Close;
  DMMedicamentos.FDQRYBuscarMedicamntos.Open;

  F := DMMedicamentos.FDQRYBuscarMedicamntos.FindField('Validade');
  if Assigned(F) then
  begin
    F.EditMask := '!99/99/0000;1;_';
    if F is TDateField then
      TDateField(F).DisplayFormat := 'dd/mm/yyyy'
    else if F is TSQLTimeStampField then
      TSQLTimeStampField(F).DisplayFormat := 'dd/mm/yyyy';
  end;

  Validade_Time.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TFCadastro_Medicamento.Incluir_ButtonClick(Sender: TObject);
begin
  // Apenas coloca o dataset em modo de inserção e posiciona o cursor.
  DMMedicamentos.FDQRYBuscarMedicamntos.Append;
  Nome_Medicamento_Edit.SetFocus;
end;

function TFCadastro_Medicamento.ParseDateBR(const S: string; out D: TDateTime): Boolean;
var
  FS: TFormatSettings;
begin
  FS := TFormatSettings.Create('pt-BR');
  FS.ShortDateFormat := 'dd/mm/yyyy';
  FS.DateSeparator   := '/';
  Result := TryStrToDate(Trim(S), D, FS);
end;

procedure TFCadastro_Medicamento.Nome_Obrigatorio;
begin
  ShowMessage('O Campo Nome é Obrigatório');
  Nome_Medicamento_Edit.SetFocus;
end;



procedure TFCadastro_Medicamento.Unidade_Obrigatorio;
begin
  if Trim(Unidade_Medida_Comb.Text) = '' then
  begin
    ShowMessage('O Campo Unidade de Medida é Obrigatório');
    Unidade_Medida_Comb.SetFocus;
  end;
end;

procedure TFCadastro_Medicamento.Validade_Obrigatorio;
var
  D: TDateTime;
begin
  if not ParseDateBR(Validade_Time.Text, D) then
  begin
    ShowMessage('Informe uma data válida no formato dd/mm/aaaa.');
    Validade_Time.SetFocus;
    Exit;
  end;

  if D < Date then
  begin
    ShowMessage('A validade não pode ser anterior a hoje.');
    Validade_Time.SetFocus;
  end;
end;

end.

