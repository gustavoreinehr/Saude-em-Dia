unit Tela_Lembrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.WinXCalendars, Vcl.Grids, System.Math;

type
  TTela_Lembretes = class(TForm)
    BarraInferior: TPanel;
    BotaoEditar: TButton;
    BotaoExcluir: TButton;
    BotaoIncluir: TButton;
    AVoltar: TButton;
    PainelBotoes: TPanel;
    DataInicio: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Calendario: TCalendarPicker;
    Horario: TTimePicker;
    Edit1: TEdit;         // Nome do paciente
    NomePaciente: TLabel;
    Dosagem: TComboBox;
    Lembrete: TMemo;
    Tabela: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AVoltarClick(Sender: TObject);
    procedure TabelaSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure BotaoIncluirClick(Sender: TObject);
    procedure BotaoExcluirClick(Sender: TObject);
    procedure BotaoEditarClick(Sender: TObject);
  private
    procedure LimparCampos;
    procedure ConfigurarTabela;
    procedure CarregarDadosNaTabela;
    function MontarItem: string;
    function ExisteItem(const Item: string): Boolean;
  public
  end;

var
  Tela_Lembretes: TTela_Lembretes;

implementation

{$R *.dfm}

var
  LembretesList: TStringList;

{ Função que monta o item no formato salvo }
function TTela_Lembretes.MontarItem: string;
begin
  Result := Edit1.Text + '|' +
            Dosagem.Text + '|' +
            FormatDateTime('hh:nn', Horario.Time) + '|' +
            FormatDateTime('dd/mm/yyyy', Calendario.Date) + '|' +
            StringReplace(Lembrete.Text, sLineBreak, ' ', [rfReplaceAll]);
end;

{ Função que verifica duplicação }
function TTela_Lembretes.ExisteItem(const Item: string): Boolean;
begin
  Result := LembretesList.IndexOf(Item) <> -1;
end;

procedure TTela_Lembretes.FormCreate(Sender: TObject);
begin
  LembretesList := TStringList.Create;
  ConfigurarTabela;

  Dosagem.Items.Clear;
  Dosagem.Items.Add('1 vez ao dia');
  Dosagem.Items.Add('2 vezes ao dia');
  Dosagem.Items.Add('3 vezes ao dia');
  Dosagem.Items.Add('De 4 em 4 horas');
  Dosagem.Items.Add('De 6 em 6 horas');
  Dosagem.Items.Add('De 8 em 8 horas');

  CarregarDadosNaTabela;
  LimparCampos;
end;

procedure TTela_Lembretes.FormDestroy(Sender: TObject);
begin
  FreeAndNil(LembretesList);
end;

procedure TTela_Lembretes.ConfigurarTabela;
begin
  Tabela.ColCount  := 5;
  Tabela.RowCount  := 2;
  Tabela.FixedCols := 0;
  Tabela.FixedRows := 1;

  Tabela.Cells[0, 0] := 'Nome Paciente';
  Tabela.Cells[1, 0] := 'Periodicidade';
  Tabela.Cells[2, 0] := 'Horário';
  Tabela.Cells[3, 0] := 'Data';
  Tabela.Cells[4, 0] := 'Lembrete';

  Tabela.ColWidths[0] := 300;
  Tabela.ColWidths[1] := 300;
  Tabela.ColWidths[2] := 120;
  Tabela.ColWidths[3] := 200;
  Tabela.ColWidths[4] := 300;

  Tabela.Options := Tabela.Options - [goEditing];
end;

procedure TTela_Lembretes.LimparCampos;
begin
  Edit1.Clear;
  Dosagem.ItemIndex := -1;
  Horario.Time := StrToTime('00:00');
  Calendario.Date := Date;
  Lembrete.Clear;

  BotaoEditar.Enabled := False;
  BotaoExcluir.Enabled := False;
end;

procedure TTela_Lembretes.CarregarDadosNaTabela;
var
  i: Integer;
  Parts: TStringList;
begin
  Tabela.RowCount := Max(2, LembretesList.Count + 1);

  for i := 1 to Tabela.RowCount - 1 do
  begin
    Tabela.Cells[0, i] := '';
    Tabela.Cells[1, i] := '';
    Tabela.Cells[2, i] := '';
    Tabela.Cells[3, i] := '';
    Tabela.Cells[4, i] := '';
  end;

  Parts := TStringList.Create;
  try
    Parts.Delimiter := '|';
    Parts.StrictDelimiter := True;

    for i := 0 to LembretesList.Count - 1 do
    begin
      Parts.DelimitedText := LembretesList[i];
      while Parts.Count < 5 do Parts.Add('');

      Tabela.Cells[0, i + 1] := Parts[0];
      Tabela.Cells[1, i + 1] := Parts[1];
      Tabela.Cells[2, i + 1] := Parts[2];
      Tabela.Cells[3, i + 1] := Parts[3];
      Tabela.Cells[4, i + 1] := Parts[4];
    end;
  finally
    Parts.Free;
  end;
end;

procedure TTela_Lembretes.BotaoIncluirClick(Sender: TObject);
var
  Item: string;
begin
  if (Trim(Edit1.Text) = '') or (Trim(Lembrete.Text) = '') then
  begin
    ShowMessage('Por favor, preencha o Nome do Paciente e o Lembrete.');
    Exit;
  end;

  Item := MontarItem;

  if ExisteItem(Item) then
  begin
    ShowMessage('Já existe um lembrete idêntico cadastrado!');
    Exit;
  end;

  LembretesList.Add(Item);
  CarregarDadosNaTabela;
  LimparCampos;
  ShowMessage('Lembrete incluído com sucesso!');
end;

procedure TTela_Lembretes.BotaoExcluirClick(Sender: TObject);
var
  Idx: Integer;
begin
  if Tabela.Row < 1 then
  begin
    ShowMessage('Por favor, selecione um lembrete para excluir.');
    Exit;
  end;

  Idx := Tabela.Row - 1;
  if (Idx < 0) or (Idx >= LembretesList.Count) then
  begin
    ShowMessage('Seleção inválida.');
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir este lembrete?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    LembretesList.Delete(Idx);
    CarregarDadosNaTabela;
    LimparCampos;
    ShowMessage('Lembrete excluído com sucesso!');
  end;
end;

procedure TTela_Lembretes.BotaoEditarClick(Sender: TObject);
var
  Idx: Integer;
  Item: string;
begin
  if Tabela.Row < 1 then
  begin
    ShowMessage('Por favor, selecione um lembrete para editar.');
    Exit;
  end;

  Idx := Tabela.Row - 1;
  if (Idx < 0) or (Idx >= LembretesList.Count) then
  begin
    ShowMessage('Seleção inválida.');
    Exit;
  end;

  if (Trim(Edit1.Text) = '') or (Trim(Lembrete.Text) = '') then
  begin
    ShowMessage('Por favor, preencha o Nome do Paciente e o Lembrete.');
    Exit;
  end;

  Item := MontarItem;

  // Evita duplicar em outro índice
  if ExisteItem(Item) and (LembretesList[Idx] <> Item) then
  begin
    ShowMessage('Já existe outro lembrete idêntico!');
    Exit;
  end;

  LembretesList[Idx] := Item;
  CarregarDadosNaTabela;
  LimparCampos;
  ShowMessage('Lembrete atualizado com sucesso!');
end;

procedure TTela_Lembretes.TabelaSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  Idx: Integer;
  Parts: TStringList;
begin
  if ARow = 0 then
  begin
    BotaoEditar.Enabled := False;
    BotaoExcluir.Enabled := False;
    Exit;
  end;

  Idx := ARow - 1;
  if (Idx < 0) or (Idx >= LembretesList.Count) then
  begin
    BotaoEditar.Enabled := False;
    BotaoExcluir.Enabled := False;
    Exit;
  end;

  Parts := TStringList.Create;
  try
    Parts.Delimiter := '|';
    Parts.StrictDelimiter := True;
    Parts.DelimitedText := LembretesList[Idx];

    while Parts.Count < 5 do Parts.Add('');

    Edit1.Text := Parts[0];
    Dosagem.Text := Parts[1];
    if Parts[2] <> '' then
      Horario.Time := StrToTimeDef(Parts[2], 0);
    if Parts[3] <> '' then
      Calendario.Date := StrToDateDef(Parts[3], Date);
    Lembrete.Text := Parts[4];

    BotaoEditar.Enabled := True;
    BotaoExcluir.Enabled := True;
  finally
    Parts.Free;
  end;
end;

procedure TTela_Lembretes.AVoltarClick(Sender: TObject);
begin
  Close;
end;

end.

