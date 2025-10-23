unit DataModuleMedicamento;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModulePrincipal;

type
  TDMMedicamento = class(TDataModule)
    FDQRYBuscarMedicamntos: TFDQuery;
    FDQRYBuscarMedicamntosID_REMEDIO: TIntegerField;
    FDQRYBuscarMedicamntosNOME: TStringField;
    FDQRYBuscarMedicamntosCLASSIFICACAO: TStringField;
    FDQRYBuscarMedicamntosFORMA_FARMACEUTICA: TStringField;
    FDQRYBuscarMedicamntosVALIDADE: TDateField;
    FDQRYBuscarMedicamntosVIA_ADMINISTRACAO: TStringField;
    FDQRYBuscarMedicamntosUNIDADE_MEDIDA: TStringField;
    FDQRYBuscarMedicamntosDESCRICAO: TStringField;
    procedure FDQRYBuscarMedicamntosNewRecord(DataSet: TDataSet);
  private

  public
    function BuscarIDMedicamento : Largeint;
  end;

var
  DMMedicamento: TDMMedicamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



{ TDMMedicamento }

function TDMMedicamento.BuscarIDMedicamento: Largeint;
var
QRYBuscarMedicamentoProximo : TFDQuery;

begin

QRYBuscarMedicamentoProximo := TFDQuery.Create(nil);

try

QRYBuscarMedicamentoProximo.Connection := DmPrincipal.FDConnection1;
QRYBuscarMedicamentoProximo.Close;
QRYBuscarMedicamentoProximo.SQL.Clear;
QRYBuscarMedicamentoProximo.SQL.Add('select gen_id(GN_REMEDIO, 1) AS PROXIMO FROM RDB$DATABASE');
QRYBuscarMedicamentoProximo.Open;

Result := QRYBuscarMedicamentoProximo.FieldByName('PROXIMO').AsLargeInt;
finally
  FreeAndNil(QRYBuscarMedicamentoProximo);
end;

end;

procedure TDMMedicamento.FDQRYBuscarMedicamntosNewRecord(DataSet: TDataSet);
begin
FDQRYBuscarMedicamntos.FieldByName('ID_REMEDIO').AsLargeInt := BuscarIDMedicamento;
end;

end.
