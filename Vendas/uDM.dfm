object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 426
  Width = 697
  object FdConexao: TFDConnection
    ConnectionName = 'MySQL'
    Params.Strings = (
      'User_Name=root'
      'Database=vendas'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Pessoal\Faculdade\IF\3'#186'\Implementa'#231#227'o de Sistemas\Trabalho\Ex' +
      'ecut'#225'vel\libmysql.dll'
    Left = 136
    Top = 32
  end
  object fdqProduto: TFDQuery
    CachedUpdates = True
    Connection = FdConexao
    SQL.Strings = (
      'SELECT '
      'p.idproduto,'
      'p.descproduto,'
      'p.precount '
      'from produtos p ')
    Left = 200
    Top = 120
    object fdqProdutoidproduto: TFDAutoIncField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqProdutodescproduto: TStringField
      FieldName = 'descproduto'
      Origin = 'descproduto'
      Required = True
      Size = 60
    end
    object fdqProdutoprecount: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'precount'
      Origin = 'precount'
    end
  end
  object fdqCliente: TFDQuery
    CachedUpdates = True
    Connection = FdConexao
    SQL.Strings = (
      'SELECT'
      'c.idcliente,'
      'c.nome,'
      'c.cidade,'
      'c.uf '
      'FROM clientes c')
    Left = 248
    Top = 120
    object fdqClienteidcliente: TFDAutoIncField
      FieldName = 'idcliente'
      Origin = 'idcliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 60
    end
    object fdqClientecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 30
    end
    object fdqClienteuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 2
    end
  end
  object fdqPedidos: TFDQuery
    CachedUpdates = True
    Connection = FdConexao
    SQL.Strings = (
      'SELECT '
      'p.pedido, p.dataemissao, p.idcliente, p.valortotal'
      'FROM pedidos p')
    Left = 200
    Top = 184
    object fdqPedidospedido: TIntegerField
      FieldName = 'pedido'
      Origin = 'pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqPedidosdataemissao: TDateTimeField
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
      Required = True
    end
    object fdqPedidosidcliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
    object fdqPedidosvalortotal: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'valortotal'
      Origin = 'valortotal'
    end
  end
  object fdqItemPedido: TFDQuery
    CachedUpdates = True
    AggregatesActive = True
    Connection = FdConexao
    SQL.Strings = (
      'SELECT '
      'ip.iditempedido, '
      'ip.pedido,'
      'ip.idproduto,'
      'p.descproduto,'
      'ip.quantidade,'
      'ip.precount,'
      'ip.valortotal'
      'FROM itempedido ip'
      'INNER JOIN produtos p ON p.idproduto=ip.idproduto'
      'WHERE ip.pedido = :IDPEDIDO')
    Left = 256
    Top = 184
    ParamData = <
      item
        Name = 'IDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = -1
      end>
    object fdqItemPedidoiditempedido: TFDAutoIncField
      FieldName = 'iditempedido'
      Origin = 'iditempedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqItemPedidopedido: TIntegerField
      FieldName = 'pedido'
      Origin = 'pedido'
      Required = True
    end
    object fdqItemPedidoidproduto: TIntegerField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
    end
    object fdqItemPedidodescproduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descproduto'
      Origin = 'descproduto'
      ProviderFlags = []
      Size = 60
    end
    object fdqItemPedidoquantidade: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object fdqItemPedidoprecount: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'precount'
      Origin = 'precount'
      currency = True
    end
    object fdqItemPedidovalortotal: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'valortotal'
      Origin = 'valortotal'
      currency = True
    end
    object fdqItemPedidoTOTALPEDIDO: TAggregateField
      FieldName = 'TOTALPEDIDO'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valortotal)'
    end
  end
  object dsrItemPedido: TDataSource
    DataSet = fdqItemPedido
    Left = 304
    Top = 184
  end
end
