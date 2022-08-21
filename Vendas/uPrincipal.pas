unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, uClasse,
  Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    edtCliente: TEdit;
    Label1: TLabel;
    edtNomeCliente: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtProduto: TEdit;
    edtDescricao: TEdit;
    cdsApoio: TClientDataSet;
    cdsApoioPRECO: TFloatField;
    cdsApoioQUANTIDADE: TFloatField;
    cdsApoioVALORTOTAL: TFloatField;
    dsrApoio: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    dbeQuantidade: TDBEdit;
    dbePreco: TDBEdit;
    Label7: TLabel;
    dbeValorTotal: TDBEdit;
    dbgItemPedido: TDBGrid;
    btnInserirItem: TButton;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    cdsApoioIDITEMPEDIDO: TIntegerField;
    btnBuscarPedido: TButton;
    btnCancelarPedido: TButton;
    btnSalvar: TButton;
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtProdutoChange(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure cdsApoioQUANTIDADEChange(Sender: TField);
    procedure btnInserirItemClick(Sender: TObject);
    procedure dbgItemPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteEnter(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    IdPedido : Integer;
    cCliente : iCliente;
    cProduto : iProduto;
    cPedido : iPedido;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uDM, uFuncs, uPesquisa;

procedure TfrmPrincipal.cdsApoioQUANTIDADEChange(Sender: TField);
begin
  cdsApoioVALORTOTAL.AsFloat := cdsApoioQUANTIDADE.AsFloat * cdsApoioPRECO.AsFloat;
end;

procedure TfrmPrincipal.dbeQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    btnInserirItem.SetFocus;
    btnInserirItem.Click;
  end;
end;

procedure TfrmPrincipal.dbgItemPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then
    if Perguntar('Deseja remover o item selecionado?') then
    begin
      DM.fdqItemPedido.Delete;
      edtProduto.SetFocus;
    end;

  if key = VK_RETURN then
    if Perguntar('Deseja alterar o item selecionado?') then
    begin
      edtProduto.Text            := DM.fdqItemPedidoidproduto.AsString;
      cdsApoioQUANTIDADE.AsFloat := DM.fdqItemPedidoquantidade.AsFloat;
      cdsApoioPRECO.AsFloat      := DM.fdqItemPedidoprecount.AsFloat;
      cdsApoioVALORTOTAL.AsFloat := DM.fdqItemPedidovalortotal.AsFloat;

      cdsApoioIDITEMPEDIDO.AsInteger := DM.fdqItemPedidoiditempedido.AsInteger;
      //DM.fdqItemPedido.Delete;

      edtProduto.Enabled := False;
      edtProduto.Color   := clBtnFace;
      dbeQuantidade.SetFocus;
    end;

  edtCliente.Enabled := DM.fdqItemPedido.IsEmpty;
end;

procedure TfrmPrincipal.edtClienteChange(Sender: TObject);
begin
  if Trim( edtCliente.Text ) = '' then
    edtNomeCliente.Clear
  else
    begin
      cCliente.IdCliente := StrToIntDef(edtCliente.Text, 0);

      if not cCliente.LocalizaCliente then
        edtNomeCliente.Clear
      else
        edtNomeCliente.Text := cCliente.Nome;
    end;

  btnBuscarPedido.Enabled   := edtNomeCliente.Text = '';
  btnCancelarPedido.Enabled := btnBuscarPedido.Enabled;
end;

procedure TfrmPrincipal.edtClienteEnter(Sender: TObject);
begin
  edtCliente.Enabled := DM.fdqItemPedido.IsEmpty;
end;

procedure TfrmPrincipal.edtClienteExit(Sender: TObject);
begin
  if (not cCliente.LocalizaCliente) and (Trim( edtCliente.Text ) <> '') then
  begin
    Alerta('Informe um código de cliente valido.');
    edtCliente.SetFocus;
  end
end;

procedure TfrmPrincipal.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', ';', #8])) then
    Key := #0;
end;

procedure TfrmPrincipal.edtProdutoChange(Sender: TObject);
begin
  if Trim( edtProduto.Text ) = '' then
    edtDescricao.Clear
  else
    begin
      cProduto.IdProduto := StrToIntDef(edtProduto.Text, 0);

      if not cProduto.LocalizaProduto then
        begin
          edtDescricao.Clear;
          cdsApoioPRECO.AsFloat := 0;
        end
      else
        begin
          edtDescricao.Text := cProduto.DescProduto;
          cdsApoioPRECO.AsFloat := cProduto.PrecoProduto;
        end;
    end;
end;

procedure TfrmPrincipal.edtProdutoExit(Sender: TObject);
begin
  if (not cProduto.LocalizaProduto) and (Trim( edtProduto.Text ) <> '') then
  begin
    Alerta('Informe um código de produto valido.');
    edtProduto.SetFocus;
  end
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  IdPedido := 0;

  cCliente := TCliente.Create;
  cCliente.Consulta  := DM.fdqCliente;

  cProduto := TProduto.Create;
  cProduto.Consulta  := DM.fdqProduto;

  cPedido := TPedido.Create;
  cPedido.Consulta   := DM.fdqPedidos;
  cPedido.ItemPedido := DM.fdqItemPedido;

  cdsApoio.CreateDataSet;
  cdsApoio.Append;

  DM.fdqPedidos.Open();
  DM.fdqItemPedido.Open();
end;

procedure TfrmPrincipal.btnBuscarPedidoClick(Sender: TObject);
begin
  cPedido.IdPedido    := -1;
  cPedido.CarregaItem := True;

  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.Caption := 'Buscar Pedido';
    frmPesquisa.ShowModal;

    cPedido.IdPedido := frmPesquisa.cPedido.IdPedido;
    if cPedido.LocalizaPedido then
    begin
      IdPedido := cPedido.IdPedido;
      edtCliente.Text := IntToStr(cPedido.IdCliente);
    end;
  finally
    FreeAndNil(frmPesquisa);
  end;
end;

procedure TfrmPrincipal.btnCancelarPedidoClick(Sender: TObject);
begin
  cPedido.IdPedido := -1;
  cPedido.CarregaItem := True;

  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.Caption := 'Cancelar Pedido';
    frmPesquisa.ShowModal;

    cPedido.IdPedido := frmPesquisa.cPedido.IdPedido;
    if cPedido.LocalizaPedido then
      if Perguntar('Deseja Cancelar o pedido selecionado?') then
        cPedido.CancelarPedido;
  finally
    if edtCliente.Enabled then
      edtCliente.SetFocus;
    FreeAndNil(frmPesquisa);
  end;
end;

procedure TfrmPrincipal.btnInserirItemClick(Sender: TObject);
begin
  if Trim(edtNomeCliente.Text) = '' then
  begin
    Alerta('Informe um cliente para prosseguir.');
    edtCliente.SetFocus;
    exit;
  end;

  if  Trim( edtDescricao.Text ) = '' then
  begin
    Alerta('Informe o produto para prosseguir.');
    edtProduto.SetFocus;
    exit;
  end;

  if cdsApoioVALORTOTAL.AsFloat = 0 then
  begin
    Alerta('Não é permitido salvar um item sem valor.');
    dbeQuantidade.SetFocus;
    Exit;
  end;

  if IdPedido = 0 then
    IdPedido := cPedido.GetSequenciaPedido;

  if DM.fdqItemPedido.Locate('IDITEMPEDIDO', cdsApoioIDITEMPEDIDO.AsInteger, []) then
    DM.fdqItemPedido.Edit
  else
    DM.fdqItemPedido.Append;

  DM.fdqItemPedidopedido.AsInteger       := IdPedido;
  DM.fdqItemPedidoidproduto.AsString     := edtProduto.Text;
  DM.fdqItemPedidodescproduto.AsString   := edtDescricao.Text;
  DM.fdqItemPedidoquantidade.AsFloat     := cdsApoioQUANTIDADE.AsFloat;
  DM.fdqItemPedidoprecount.AsFloat       := cdsApoioPRECO.AsFloat;
  DM.fdqItemPedidovalortotal.AsFloat     := cdsApoioVALORTOTAL.AsFloat;
  DM.fdqItemPedido.Post;

  edtProduto.Enabled := True;
  edtProduto.Color   := clWhite;

  edtProduto.Clear;
  edtProduto.SetFocus;

  cdsApoioQUANTIDADE.AsFloat     := 0;
  cdsApoioPRECO.AsFloat          := 0;
  cdsApoioVALORTOTAL.AsFloat     := 0;
  cdsApoioIDITEMPEDIDO.AsInteger := 0;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  if DM.fdqItemPedido.IsEmpty then
  begin
    Alerta('Informe um item para prosseguir.');
    edtProduto.SetFocus;
    Exit;
  end;

  cPedido.CarregaItem := False;
  cPedido.IdPedido    := IdPedido;
  cPedido.DataEmissao := Now;
  cPedido.IdCliente   := StrToInt(edtCliente.Text);
  cPedido.ValorTotal  := DM.fdqItemPedidoTOTALPEDIDO.Value;

  if cPedido.SalvarPedido then
  begin
    IdPedido := 0;

    edtCliente.Clear;
    cdsApoio.EmptyDataSet;
    cdsApoio.Append;

    DM.fdqItemPedido.Close;
    DM.fdqItemPedido.ParamByName('IDPEDIDO').AsInteger := -1;
    DM.fdqItemPedido.Open;

    cPedido.IdPedido := -1;
    edtCliente.Enabled := DM.fdqItemPedido.IsEmpty;
    edtCliente.SetFocus;

    DM.fdqPedidos.Refresh;
  end;
end;

end.
