object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca Pedido'
  ClientHeight = 194
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 424
    Height = 153
    Align = alTop
    Caption = ' Busca Pedido '
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 28
      Width = 47
      Height = 13
      Caption = 'N'#186' Pedido'
    end
    object Label2: TLabel
      Left = 9
      Top = 84
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object edtPedido: TEdit
      Left = 9
      Top = 43
      Width = 102
      Height = 21
      TabOrder = 0
      OnKeyPress = edtPedidoKeyPress
    end
    object btnBuscarPedido: TButton
      Left = 117
      Top = 41
      Width = 100
      Height = 25
      Cursor = crHandPoint
      Caption = 'Carregar Pedido'
      TabOrder = 1
      OnClick = btnBuscarPedidoClick
    end
    object edtNomeCliente: TEdit
      Left = 9
      Top = 103
      Width = 400
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
  end
  object btConfirmar: TButton
    Left = 317
    Top = 160
    Width = 103
    Height = 30
    Cursor = crHandPoint
    Caption = 'Confirmar'
    ModalResult = 1
    TabOrder = 1
  end
end
