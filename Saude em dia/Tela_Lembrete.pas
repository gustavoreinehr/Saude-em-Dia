unit Tela_Lembrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.WinXCalendars, Data.DB, Vcl.Grids, Vcl.DBGrids;

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
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    NomePaciente: TLabel;
    Dosagem: TComboBox;
    Lembrete: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tela_Lembretes: TTela_Lembretes;

implementation

{$R *.dfm}

procedure TTela_Lembretes.FormCreate(Sender: TObject);
begin
Lembrete.Text := '';
end;

end.
