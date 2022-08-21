object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vendas'
  ClientHeight = 495
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 753
    Height = 489
    Align = alTop
    Caption = ' Pedido '
    TabOrder = 0
    object Label1: TLabel
      Left = 33
      Top = 28
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 136
      Top = 28
      Width = 63
      Height = 13
      Caption = 'Nome Cliente'
    end
    object Label3: TLabel
      Left = 33
      Top = 72
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label4: TLabel
      Left = 137
      Top = 72
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label5: TLabel
      Left = 417
      Top = 72
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label6: TLabel
      Left = 518
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label7: TLabel
      Left = 618
      Top = 72
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object Label9: TLabel
      Left = 518
      Top = 426
      Width = 63
      Height = 13
      Caption = 'Total Pedido:'
    end
    object edtCliente: TEdit
      Left = 33
      Top = 43
      Width = 102
      Height = 21
      TabOrder = 0
      OnChange = edtClienteChange
      OnEnter = edtClienteEnter
      OnExit = edtClienteExit
      OnKeyPress = edtClienteKeyPress
    end
    object edtNomeCliente: TEdit
      Left = 136
      Top = 43
      Width = 584
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtProduto: TEdit
      Left = 33
      Top = 87
      Width = 102
      Height = 21
      TabOrder = 2
      OnChange = edtProdutoChange
      OnExit = edtProdutoExit
      OnKeyPress = edtClienteKeyPress
    end
    object edtDescricao: TEdit
      Left = 136
      Top = 87
      Width = 280
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object dbeQuantidade: TDBEdit
      Left = 417
      Top = 87
      Width = 100
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = dsrApoio
      TabOrder = 4
      OnKeyDown = dbeQuantidadeKeyDown
    end
    object dbePreco: TDBEdit
      Left = 518
      Top = 87
      Width = 100
      Height = 21
      DataField = 'PRECO'
      DataSource = dsrApoio
      TabOrder = 5
      OnKeyDown = dbeQuantidadeKeyDown
    end
    object dbeValorTotal: TDBEdit
      Left = 618
      Top = 87
      Width = 102
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'VALORTOTAL'
      DataSource = dsrApoio
      ReadOnly = True
      TabOrder = 6
    end
    object dbgItemPedido: TDBGrid
      Left = 14
      Top = 160
      Width = 736
      Height = 257
      DataSource = DM.dsrItemPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgItemPedidoKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'idproduto'
          Title.Caption = 'Produto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descproduto'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 369
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precount'
          Title.Caption = 'Pre'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valortotal'
          Title.Caption = 'Valor Item'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object btnInserirItem: TButton
      Left = 618
      Top = 124
      Width = 102
      Height = 25
      Cursor = crHandPoint
      Caption = 'Inserir Item (enter)'
      TabOrder = 8
      OnClick = btnInserirItemClick
    end
    object DBEdit1: TDBEdit
      Left = 587
      Top = 423
      Width = 133
      Height = 21
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = clBtnFace
      DataField = 'TOTALPEDIDO'
      DataSource = DM.dsrItemPedido
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 9
    end
    object btnBuscarPedido: TButton
      Left = 9
      Top = 456
      Width = 100
      Height = 25
      Cursor = crHandPoint
      Caption = 'Buscar Pedido'
      TabOrder = 10
      OnClick = btnBuscarPedidoClick
    end
    object btnCancelarPedido: TButton
      Left = 115
      Top = 456
      Width = 100
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar Pedido'
      TabOrder = 11
      OnClick = btnCancelarPedidoClick
    end
    object btnSalvar: TButton
      Left = 221
      Top = 456
      Width = 100
      Height = 25
      Cursor = crHandPoint
      Caption = 'Salvar Pedido'
      TabOrder = 12
      OnClick = btnSalvarClick
    end
  end
  object cdsApoio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 304
    object cdsApoioQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      OnChange = cdsApoioQUANTIDADEChange
    end
    object cdsApoioPRECO: TFloatField
      FieldName = 'PRECO'
      OnChange = cdsApoioQUANTIDADEChange
      currency = True
    end
    object cdsApoioVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      currency = True
    end
    object cdsApoioIDITEMPEDIDO: TIntegerField
      FieldName = 'IDITEMPEDIDO'
    end
  end
  object dsrApoio: TDataSource
    DataSet = cdsApoio
    Left = 320
    Top = 304
  end
end
