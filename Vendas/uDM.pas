unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FdConexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    fdqProduto: TFDQuery;
    fdqProdutoidproduto: TFDAutoIncField;
    fdqProdutodescproduto: TStringField;
    fdqProdutoprecount: TSingleField;
    fdqCliente: TFDQuery;
    fdqClienteidcliente: TFDAutoIncField;
    fdqClientenome: TStringField;
    fdqClientecidade: TStringField;
    fdqClienteuf: TStringField;
    fdqPedidos: TFDQuery;
    fdqPedidospedido: TIntegerField;
    fdqPedidosdataemissao: TDateTimeField;
    fdqPedidosidcliente: TIntegerField;
    fdqPedidosvalortotal: TSingleField;
    fdqItemPedido: TFDQuery;
    fdqItemPedidoiditempedido: TFDAutoIncField;
    fdqItemPedidopedido: TIntegerField;
    fdqItemPedidoidproduto: TIntegerField;
    fdqItemPedidodescproduto: TStringField;
    fdqItemPedidoquantidade: TSingleField;
    fdqItemPedidoprecount: TSingleField;
    fdqItemPedidovalortotal: TSingleField;
    dsrItemPedido: TDataSource;
    fdqItemPedidoTOTALPEDIDO: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  uFuncs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Path: String;
begin
  if FdConexao.Connected then
  begin
    Alerta('Foi gerada a versão conectada ao banco...');
    Halt;
  end;

  Path := ExtractFilePath(ParamStr(0));

  if FileExists(Path + 'libmysql.dll') then
    FDPhysMySQLDriverLink1.VendorLib := Path + 'libmysql.dll'
  else
    begin
      Erro('DLL libmysql não encontrada no diretorio de exeucação: ' + #13#13 + Path + 'libmysql.dll');
      Halt;
    end;

  FdConexao.Open();
end;

end.
