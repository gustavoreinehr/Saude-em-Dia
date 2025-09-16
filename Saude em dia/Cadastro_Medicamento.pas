unit Cadastro_Medicamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  System.IniFiles, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  DataModuleMeticamento;

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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Buscar_Button: TButton;
    Label11: TLabel;
    Nome_Medicamento_Edit: TDBEdit;
    Unidade_Medida_Comb: TDBComboBox;
    Forma_Farmaceutica_Comb: TDBComboBox;
    Via_Adm_Comb: TDBComboBox;
    Classificacao_Comb: TDBComboBox;
    Edit_Descricao: TDBEdit;
    Quantidade_Medicamento_Edit: TDBEdit;
    DataSourceBuscarMedicamentos: TDataSource;
    Edit_Buscar: TDBLookupListBox;
    Validade_Time: TDBEdit;
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
    procedure Quantidade_Obrigatorio;
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
  Quantidade_Medicamento_Edit.Text := '';
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

  if Trim(Nome_Medicamento_Edit.Text) = '' then
  begin
    Nome_Obrigatorio; Exit;
  end;

  if Trim(Quantidade_Medicamento_Edit.Text) = '' then
  begin
    Quantidade_Obrigatorio; Exit;
  end;

  if Trim(Unidade_Medida_Comb.Text) = '' then
  begin
    Unidade_Obrigatorio; Exit ;
  end;

  if not ParseDateBR(Validade_Time.Text, D) then
  begin
    ShowMessage('Informe uma data válida no formato dd/mm/aaaa.');
    Validade_Time.SetFocus; Exit;
  end;

  if D < Date then
  begin
    ShowMessage('A validade não pode ser anterior a hoje.');
    Validade_Time.SetFocus; Exit;
  end;

  if Trim(Classificacao_Comb.Text) = '' then
  begin
    Class_Obrigatorio; Exit;
  end;

  with DMMedicamentos.FDQRYBuscarMedicamntos do
  begin
    if not (State in [dsEdit, dsInsert]) then
      Edit;

    if FindField('Validade') <> nil then
      FieldByName('Validade').AsDateTime := D;

    Post;
    ApplyUpdates;
  end;
end;

procedure TFCadastro_Medicamento.Excluir_ButtonClick(Sender: TObject);
begin
  if DMMedicamentos.FDQRYBuscarMedicamntos.Active
     and not DMMedicamentos.FDQRYBuscarMedicamntos.IsEmpty then
    DMMedicamentos.FDQRYBuscarMedicamntos.Delete;
    
    if DMMedicamentos.FDQRYBuscarMedicamntos.State in [dsEdit, dsInsert] then
     DMMedicamentos.FDQRYBuscarMedicamntos.Post; 
    DMMedicamentos.FDQRYBuscarMedicamntos.ApplyUpdates;
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
var
  D: TDateTime;
begin

  DMMedicamentos.FDQRYBuscarMedicamntos.Append;

  if ParseDateBR(Validade_Time.Text, D) then
    if DMMedicamentos.FDQRYBuscarMedicamntos.FindField('Validade') <> nil then
      DMMedicamentos.FDQRYBuscarMedicamntos.FieldByName('Validade').AsDateTime := D;

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

procedure TFCadastro_Medicamento.Quantidade_Obrigatorio;
var
  DummyInt: Integer;
begin
  if Trim(Quantidade_Medicamento_Edit.Text) = '' then
  begin
    ShowMessage('O Campo Quantidade é Obrigatório');
    Quantidade_Medicamento_Edit.SetFocus;
    Exit;
  end;

  if not TryStrToInt(Quantidade_Medicamento_Edit.Text, DummyInt) then
  begin
    ShowMessage('O Campo Quantidade Deve Ser Numérico');
    Quantidade_Medicamento_Edit.SetFocus;
    Exit;
  end;

  if DummyInt < 0 then
  begin
    ShowMessage('Quantidade não pode ser negativa');
    Quantidade_Medicamento_Edit.SetFocus;
  end;
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

