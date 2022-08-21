unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uClasse;

type
  TfrmPesquisa = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtPedido: TEdit;
    btnBuscarPedido: TButton;
    Label2: TLabel;
    edtNomeCliente: TEdit;
    btConfirmar: TButton;
    procedure edtPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    cCliente : iCliente;
  public
    cPedido : iPedido;
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses uDM, uFuncs;

procedure TfrmPesquisa.btnBuscarPedidoClick(Sender: TObject);
begin
  if trim(edtPedido.Text) = '' then
  begin
    Alerta('Informe o pedido.');
    Exit;
  end;

  cPedido.IdPedido :=  StrToInt(edtPedido.Text);
  if cPedido.LocalizaPedido then
    begin
      cCliente.IdCliente  := cPedido.IdCliente;
      edtNomeCliente.Text := cCliente.Nome;
    end
  else
    Alerta('Pedido informado não localizado.');
end;

procedure TfrmPesquisa.edtPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', ';', #8])) then
    Key := #0;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  cCliente := TCliente.Create;
  cCliente.Consulta  := DM.fdqCliente;

  cPedido := TPedido.Create;
  cPedido.CarregaItem := False;
  cPedido.Consulta    := DM.fdqPedidos;
  cPedido.ItemPedido  := DM.fdqItemPedido;
end;

end.
