unit uClasse;

interface

uses
  System.SysUtils, System.UITypes, FireDAC.Comp.Client, FireDAC.DApt, uDM;

type
  {$REGION 'Interface'}
  iCliente = interface
    ['{892755A2-BB9A-41EF-BEC2-CC5707E7C516}']
    function pesquisaCampo(CampoPesquisa, IdCliente : String) : String;

    function GetConsulta : TFDQuery;
    function GetIdCliente : Integer;
    function GetNome : string;
    function GetLocalizaCliente : Boolean;

    procedure SetConsulta(const Value: TFDQuery);
    procedure SetIdCliente(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetLocalizaCliente(const Value: Boolean);

    property Consulta : TFDQuery read GetConsulta write SetConsulta;
    property IdCliente : Integer read GetIdCliente write SetIdCliente;
    property Nome : String read GetNome write SetNome;
    property LocalizaCliente : Boolean read GetLocalizaCliente write SetLocalizaCliente;
  end;

  iProduto = interface
    ['{EDF7E25C-D91D-44C5-B923-10A1F3939336}']
    function GetConsulta : TFDQuery;
    function GetIdProduto : Integer;
    function GetDescProduto : String;
    function GetPrecoProduto : Real;
    function GetLocalizaProduto : Boolean;

    procedure SetConsulta(const Value: TFDQuery);
    procedure SetIdProduto(const Value: Integer);
    procedure SetDescProduto(const Value: String);
    procedure SetPrecoProduto(const Value: Real);
    procedure SetLocalizaProduto(const Value: Boolean);

    property Consulta : TFDQuery read GetConsulta write SetConsulta;
    property IdProduto: Integer read GetIdProduto write SetIdProduto;
    property DescProduto : String read GetDescProduto write SetDescProduto;
    property PrecoProduto : Real read GetPrecoProduto write SetPrecoProduto;
    property LocalizaProduto : Boolean read GetLocalizaProduto write SetLocalizaProduto;
  end;

  iPedido = interface
    ['{9E551E26-4062-4519-9F3E-1C14FB83E254}']
    function GetSequenciaPedido : Integer;

    function GetConsulta : TFDQuery;
    function GetIdPedido : Integer;
    function GetDataEmissao : TDateTime;
    function GetIdCliente : Integer;
    function GetValorTotal : Real;
    function GetLocalizaPedido : Boolean;
    function GetCarregaItem : Boolean;
    function GetItemPedido : TFDQuery;

    procedure SetConsulta(const Value: TFDQuery);
    procedure SetIdPedido(const Value: Integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetIdCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Real);
    procedure SetLocalizaPedido(const Value: Boolean);
    procedure SetCarregaItem(const Value: Boolean);
    procedure SetItemPedido(const Value: TFDQuery);

    property Consulta : TFDQuery read GetConsulta write SetConsulta;
    property IdPedido : Integer read GetIdPedido write SetIdPedido;
    property DataEmissao : TDateTime read GetDataEmissao write SetDataEmissao;
    property IdCliente : Integer read GetIdCliente write SetIdCliente;
    property ValorTotal : Real read GetValorTotal  write SetValorTotal;
    property LocalizaPedido : Boolean read GetLocalizaPedido write SetLocalizaPedido;
    property CarregaItem : Boolean read GetCarregaItem write SetCarregaItem;
    property ItemPedido : TFDQuery read GetItemPedido write SetItemPedido;

    function SalvarPedido : Boolean;
    function CancelarPedido : Boolean;
  end;
  {$ENDREGION 'Interface'}

  {$REGION 'Classe'}
  TCliente = class sealed(TInterfacedObject, iCliente)
  private
    FLocalizaCliente : boolean;
    FConsulta: TFDQuery;
    FIdCliente : Integer;
    FNome: String;

    function GetConsulta : TFDQuery;
    function GetIdCliente : Integer;
    function GetNome : string;
    function GetLocalizaCliente : Boolean;

    procedure SetConsulta(const Value: TFDQuery);
    procedure SetIdCliente(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetLocalizaCliente(const Value: Boolean);

    function LocalizarCliente : iCliente;
  protected
    property Consulta : TFDQuery read GetConsulta write SetConsulta;
    property LocalizaCliente: boolean read GetLocalizaCliente write SetLocalizaCliente;
  public
    constructor Create;
    destructor  Destroy; override;
    class function New : iCliente;
    function pesquisaCampo(CampoPesquisa, IdCliente : String) : String;
  end;

  TProduto = class sealed(TInterfacedObject, iProduto)
  private
    FLocalizaProduto : boolean;
    FConsulta: TFDQuery;
    FIdProduto : Integer;
    FDescProduto: String;
    FPrecoProduto : Real;

    function GetConsulta : TFDQuery;
    function GetIdProduto : Integer;
    function GetDescProduto : string;
    function GetPrecoProduto : Real;
    function GetLocalizaProduto : Boolean;

    procedure SetConsulta(const Value: TFDQuery);
    procedure SetIdProduto(const Value: Integer);
    procedure SetDescProduto(const Value: String);
    procedure SetPrecoProduto(const Value: Real);
    procedure SetLocalizaProduto(const Value: Boolean);

    function LocalizarProduto : iProduto;
  protected
    property Consulta : TFDQuery read GetConsulta write SetConsulta;
    property LocalizaProduto: boolean read GetLocalizaProduto write SetLocalizaProduto;
  public
    constructor Create;
    destructor  Destroy; override;
    class function New : iProduto;
  end;

  TPedido = class sealed(TInterfacedObject, iPedido)
    private
      FLocalizaPedido : boolean;
      FConsulta: TFDQuery;
      FIdPedido : Integer;
      FDataEmissao : TDateTime;
      FIdCliente : Integer;
      FValorTotal : Real;
      FItemPedido : TFDQuery;
      FCarregaItem : boolean;

      function GetConsulta : TFDQuery;
      function GetIdPedido : Integer;
      function GetDataEmissao : TDateTime;
      function GetIdCliente : Integer;
      function GetValorTotal : Real;
      function GetLocalizaPedido : Boolean;
      function GetCarregaItem : Boolean;
      function GetItemPedido : TFDQuery;

      procedure SetConsulta(const Value: TFDQuery);
      procedure SetIdPedido(const Value: Integer);
      procedure SetDataEmissao(const Value: TDateTime);
      procedure SetIdCliente(const Value: Integer);
      procedure SetValorTotal(const Value: Real);
      procedure SetLocalizaPedido(const Value: Boolean);
      procedure SetCarregaItem(const Value: Boolean);
      procedure SetItemPedido(const Value: TFDQuery);

      function SalvarPedido : Boolean;
      function CancelarPedido : Boolean;
      function LocalizarPedido : Boolean;
    protected
      property Consulta : TFDQuery read GetConsulta write SetConsulta;
      property LocalizaPedido: boolean read GetLocalizaPedido write SetLocalizaPedido;
  public
    constructor Create;
    destructor  Destroy; override;
    class function New : iPedido;
    function GetSequenciaPedido : Integer;
  end;

  {$ENDREGION 'Classe'}

implementation

{ TCliente }

constructor TCliente.Create;
begin
  self.FIdCliente := 0;
  self.FNome      := '';
end;

destructor TCliente.Destroy;
begin

  inherited;
end;

function TCliente.GetConsulta: TFDQuery;
begin
  Result := Self.FConsulta;
end;

function TCliente.GetIdCliente: Integer;
begin
  Result := Self.FIdCliente;
end;

function TCliente.GetLocalizaCliente: Boolean;
begin
  Result := Self.FLocalizaCliente;
end;

function TCliente.GetNome: string;
begin
  Result := Self.FNome;
end;

function TCliente.LocalizarCliente: iCliente;
begin
  if not Self.Consulta.Active then
    Self.Consulta.Open;

  Self.LocalizaCliente := Self.Consulta.Locate('idcliente', Self.FIdCliente, []);
  if Self.LocalizaCliente then
    Self.FNome := Self.Consulta.FieldByName('nome').AsString;
end;

class function TCliente.New: iCliente;
begin
  Result := Self.Create;
end;

function TCliente.pesquisaCampo(CampoPesquisa, IdCliente : String): String;
var
  fQry : TFDQuery;
begin
  fQry := TFDQuery.Create(nil);
  try
    fQry.Connection := DM.FdConexao;
    fQry.CachedUpdates := True;

    fQry.Close;
    fQry.SQL.Clear;
    fQry.SQL.Add('SELECT ' + CampoPesquisa + ' from clientes WHERE idcliente = ' + IdCliente);
    fQry.Open();
  finally
    Result := fQry.FieldByName(CampoPesquisa).AsString;
    fQry.Close;
    fQry.Free;
  end;
end;

procedure TCliente.SetConsulta(const Value: TFDQuery);
begin
  self.FConsulta := Value;
end;

procedure TCliente.SetIdCliente(const Value: Integer);
begin
  self.FIdCliente:= Value;
  LocalizarCliente;
end;

procedure TCliente.SetLocalizaCliente(const Value: Boolean);
begin
  self.FLocalizaCliente := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  self.FNome := Value;
end;

{ TProduto }

constructor TProduto.Create;
begin
  self.FIdProduto    := 0;
  self.FDescProduto  := '';
  self.FPrecoProduto := 0.00;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

function TProduto.GetConsulta: TFDQuery;
begin
  Result := Self.FConsulta;
end;

function TProduto.GetDescProduto: string;
begin
  Result := Self.FDescProduto;
end;

function TProduto.GetIdProduto: Integer;
begin
  Result := Self.FIdProduto;
end;

function TProduto.GetLocalizaProduto: Boolean;
begin
  Result := Self.FLocalizaProduto;
end;

function TProduto.GetPrecoProduto: Real;
begin
  Result := Self.FPrecoProduto;
end;

function TProduto.LocalizarProduto: iProduto;
begin
  if not Self.Consulta.Active then
    Self.Consulta.Open;

  Self.LocalizaProduto := Self.Consulta.Locate('idproduto', Self.FIdProduto, []);
  if Self.LocalizaProduto then
  begin
    Self.FDescProduto  := Self.Consulta.FieldByName('descproduto').AsString;
    Self.FPrecoProduto := Self.Consulta.FieldByName('precount').AsFloat;
  end;
end;

class function TProduto.New: iProduto;
begin
  Result := Self.Create;
end;

procedure TProduto.SetConsulta(const Value: TFDQuery);
begin
  self.FConsulta := Value;
end;

procedure TProduto.SetDescProduto(const Value: String);
begin
  self.FDescProduto := Value;
end;

procedure TProduto.SetIdProduto(const Value: Integer);
begin
  self.FIdProduto := Value;
  LocalizarProduto;
end;

procedure TProduto.SetLocalizaProduto(const Value: Boolean);
begin
  self.FLocalizaProduto := Value;
end;

procedure TProduto.SetPrecoProduto(const Value: Real);
begin
  self.FPrecoProduto := Value;
end;

{ TPedido }

function TPedido.CancelarPedido: Boolean;
var
  TeveErro : Boolean;
begin
  TeveErro := False;
  DM.FdConexao.StartTransaction;
  try
    try
      DM.FdConexao.ExecSQL('delete from pedidos where pedido=' + IntToStr(FIdPedido));
      DM.FdConexao.Commit;
    except
      DM.FdConexao.RollBack;
      TeveErro := True;
    end;
  finally
    if not TeveErro then
    begin
      FConsulta.Refresh;

      FItemPedido.Close;
      FItemPedido.ParamByName('IDPEDIDO').AsInteger := -1;
      FItemPedido.Open;
    end;
  end;
end;

constructor TPedido.Create;
begin
  self.FIdPedido     := 0;
  self.FDataEmissao  := now;
  self.FIdCliente    := 0;
  self.FValorTotal   := 0;
end;

destructor TPedido.Destroy;
begin

  inherited;
end;

function TPedido.GetCarregaItem: Boolean;
begin
  Result := Self.FCarregaItem;
end;

function TPedido.GetConsulta: TFDQuery;
begin
  Result := Self.FConsulta;
end;

function TPedido.GetDataEmissao: TDateTime;
begin
  Result := Self.FDataEmissao;
end;

function TPedido.GetIdCliente: Integer;
begin
  Result := Self.FIdCliente;
end;

function TPedido.GetIdPedido: Integer;
begin
  Result := Self.FIdPedido;
end;

function TPedido.GetItemPedido: TFDQuery;
begin
  Result := Self.FItemPedido;
end;

function TPedido.GetLocalizaPedido: Boolean;
begin
  Result := Self.FLocalizaPedido;
end;

function TPedido.GetSequenciaPedido: Integer;
var
  fQry : TFDQuery;
begin
  fQry := TFDQuery.Create(nil);
  try
    fQry.Connection    := DM.FdConexao;
    fQry.CachedUpdates := True;

    fQry.Close;
    fQry.SQL.Clear;
    fQry.SQL.Add('SELECT COALESCE(max(pedido), 0) AS NumPedido FROM pedidos');
    fQry.Open();
  finally
    Result := fQry.FieldByName('NumPedido').AsInteger + 1;
    fQry.Close;
    fQry.Free;
  end;
end;

function TPedido.GetValorTotal: Real;
begin
  Result := Self.FValorTotal;
end;

function TPedido.LocalizarPedido: Boolean;
begin
  if not Self.Consulta.Active then
    Self.Consulta.Open;

  Self.LocalizaPedido := Self.Consulta.Locate('pedido', Self.FIdPedido, []);
  if Self.LocalizaPedido then
  begin
    Self.FIdPedido     := Self.Consulta.FieldByName('pedido').AsInteger;
    Self.FDataEmissao  := Self.Consulta.FieldByName('dataemissao').AsFloat;
    self.FIdCliente    := Self.Consulta.FieldByName('idcliente').AsInteger;
    self.FValorTotal   := Self.Consulta.FieldByName('valortotal').AsFloat;
  end;

  Result := Self.LocalizaPedido;
end;

class function TPedido.New: iPedido;
begin
  Result := Self.Create;
end;

function TPedido.SalvarPedido: Boolean;
var
  Salvou : Boolean;
  ValorBD, QtdItem, PrecoItem, VlrItem, IdItem : String;
begin
  Salvou := true;
  DM.FdConexao.StartTransaction;
  try
    try
      ValorBD := StringReplace( FormatFloat('0.00', self.FValorTotal), ',', '.', []);

      DM.FdConexao.ExecSQL('REPLACE INTO pedidos (pedido, dataemissao, idcliente, valortotal) VALUES (' +
                            IntToStr(self.FIdPedido)    + ',' +
                            QuotedStr(FormatDateTime('yyyy-mm-dd HH:mm:ss', self.FDataEmissao)) + ',' +
                            IntToStr(self.FIdCliente)   + ',' +
                            ValorBD   + ')');


      FItemPedido.First;
      while not FItemPedido.Eof do
      begin
        QtdItem    := StringReplace( FormatFloat('0.00', FItemPedido.FieldByName('quantidade').AsFloat), ',', '.', []);
        PrecoItem  := StringReplace( FormatFloat('0.00', FItemPedido.FieldByName('precount').AsFloat), ',', '.', []);
        VlrItem    := StringReplace( FormatFloat('0.00', FItemPedido.FieldByName('valortotal').AsFloat), ',', '.', []);

        if (FItemPedido.FieldByName('iditempedido').AsInteger <= 0) then
          IdItem := 'null'
        else
          IdItem := FItemPedido.FieldByName('iditempedido').AsString;

        DM.FdConexao.ExecSQL('REPLACE INTO itempedido (iditempedido, pedido, idproduto, quantidade, precount, valortotal) VALUES (' +
                             IdItem                                            + ', ' +
                             FItemPedido.FieldByName('pedido').AsString        + ', ' +
                             FItemPedido.FieldByName('idproduto').AsString     + ', ' +
                             QtdItem      + ', ' +
                             PrecoItem    + ', ' +
                             VlrItem      + ')');

        FItemPedido.Next
      end;
      DM.FdConexao.Commit;
    except
      DM.FdConexao.RollBack;
      Salvou := False;
    end;
  finally
    Result := Salvou;
  end;
end;

procedure TPedido.SetCarregaItem(const Value: Boolean);
begin
  self.FCarregaItem := Value;
end;

procedure TPedido.SetConsulta(const Value: TFDQuery);
begin
  self.FConsulta := Value;
end;

procedure TPedido.SetDataEmissao(const Value: TDateTime);
begin
  self.FDataEmissao := Value;
end;

procedure TPedido.SetIdCliente(const Value: Integer);
begin
  self.FIdCliente := Value;
end;

procedure TPedido.SetIdPedido(const Value: Integer);
begin
  self.FIdPedido := Value;
  LocalizarPedido;

  if Self.FCarregaItem then
  begin
    FItemPedido.Close;
    FItemPedido.ParamByName('IDPEDIDO').AsInteger := Value;
    FItemPedido.Open;
  end;
end;

procedure TPedido.SetItemPedido(const Value: TFDQuery);
begin
  self.FItemPedido := Value;
end;

procedure TPedido.SetLocalizaPedido(const Value: Boolean);
begin
  self.FLocalizaPedido := Value;
end;

procedure TPedido.SetValorTotal(const Value: Real);
begin
  self.FValorTotal := Value;
end;

end.
