-- Copiando estrutura do banco de dados para vendas
CREATE DATABASE IF NOT EXISTS `vendas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vendas`;

-- Copiando estrutura para tabela vendas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`idcliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela vendas.clientes: ~21 rows (aproximadamente)
INSERT INTO `clientes` (`idcliente`, `nome`, `cidade`, `uf`) VALUES
	(1, 'Lucas', 'Muriaé', 'MG'),
	(2, 'Ruan', 'Muriaé', 'MG'),
	(3, 'Bruna', 'Bom Jesus', 'RJ'),
	(4, 'Samuel', 'Rio de Janeiro', 'RJ'),
	(5, 'Cleves', 'Juiz de Fora', 'MG'),
	(6, 'Miguel', 'Curitiba', 'PR'),
	(7, 'Helena', 'Carlos Chargas', 'MG'),
	(8, 'Arthur', 'Contagem', 'MG'),
	(9, 'Alice', 'Belo Horizonte', 'MG'),
	(10, 'Laura', 'Ribeirão Preto', 'SP'),
	(11, 'Gael', 'Niterói', 'RJ'),
	(12, 'Heitor', 'São Paulo ', 'SP'),
	(13, 'Sophia', 'Carlos Chargas', 'MG'),
	(14, 'Heitor', 'Guarulhos', 'SP'),
	(15, 'Maria Alice', 'Santo André', 'SP'),
	(16, 'Theo', 'Londrina', 'PR'),
	(17, 'Valentina', 'Carlos Chargas', 'MG'),
	(18, 'Davi', 'São Gonçalo', 'RJ'),
	(19, 'Heloísa', 'Campinas ', 'SP'),
	(20, 'Gabriel', 'Duque de Caxias	', 'RJ'),
	(21, 'Maria Cecília', 'Volta Redonda', 'RJ');

-- Copiando estrutura para tabela vendas.itempedido
CREATE TABLE IF NOT EXISTS `itempedido` (
  `iditempedido` int(11) NOT NULL AUTO_INCREMENT,
  `pedido` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` float NOT NULL DEFAULT 0,
  `precount` float NOT NULL DEFAULT 0,
  `valortotal` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`iditempedido`),
  KEY `FK_itempedido_pedidos` (`pedido`),
  KEY `FK_itempedido_produtos` (`idproduto`),
  CONSTRAINT `FK_itempedido_pedidos` FOREIGN KEY (`pedido`) REFERENCES `pedidos` (`pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_itempedido_produtos` FOREIGN KEY (`idproduto`) REFERENCES `produtos` (`idproduto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela vendas.itempedido: ~16 rows (aproximadamente)
INSERT INTO `itempedido` (`iditempedido`, `pedido`, `idproduto`, `quantidade`, `precount`, `valortotal`) VALUES
	(8, 1, 1, 1, 65.8, 65.8),
	(9, 1, 2, 1, 112, 112),
	(10, 1, 3, 1, 89.9, 89.9),
	(11, 2, 3, 1, 89.9, 89.9),
	(12, 2, 2, 1, 112, 112),
	(13, 3, 5, 1, 480, 480),
	(14, 4, 1, 1, 65.8, 65.8),
	(15, 4, 1, 1, 65.8, 65.8),
	(16, 4, 2, 1, 112, 112),
	(17, 4, 7, 1, 45.5, 45.5),
	(18, 5, 11, 1, 175, 175),
	(19, 5, 4, 1, 255, 255),
	(20, 5, 7, 1, 45.5, 45.5),
	(21, 6, 1, 1, 65.8, 65.8),
	(22, 6, 21, 1, 140, 140),
	(23, 7, 7, 1, 45.5, 45.5),
	(24, 7, 14, 2, 170, 340),
	(25, 8, 17, 3.5, 65, 227.5);

-- Copiando estrutura para tabela vendas.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `pedido` int(11) NOT NULL,
  `dataemissao` datetime NOT NULL,
  `idcliente` int(11) NOT NULL DEFAULT 0,
  `valortotal` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`pedido`),
  KEY `FK_pedidos_clientes` (`idcliente`),
  CONSTRAINT `FK_pedidos_clientes` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela vendas.pedidos: ~7 rows (aproximadamente)
INSERT INTO `pedidos` (`pedido`, `dataemissao`, `idcliente`, `valortotal`) VALUES
	(1, '2022-08-21 11:01:46', 1, 267.7),
	(2, '2022-08-21 11:01:55', 2, 201.9),
	(3, '2022-08-21 11:02:12', 5, 480),
	(4, '2022-08-21 11:02:46', 4, 289.1),
	(5, '2022-08-21 11:03:52', 9, 475.5),
	(6, '2022-08-21 11:04:03', 11, 205.8),
	(7, '2022-08-21 11:04:28', 6, 385.5),
	(8, '2022-08-21 11:09:18', 20, 227.5);

-- Copiando estrutura para tabela vendas.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `descproduto` varchar(60) NOT NULL,
  `precount` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela vendas.produtos: ~19 rows (aproximadamente)
INSERT INTO `produtos` (`idproduto`, `descproduto`, `precount`) VALUES
	(1, 'Aerofólio', 65.8),
	(2, 'Alarme', 112),
	(3, 'Apoio de Braço', 89.9),
	(4, 'Bagageiros', 255),
	(5, 'Bateria', 480),
	(6, 'Buzina', 56.85),
	(7, 'Calha', 45.5),
	(8, 'Calota', 23.6),
	(9, 'Capota', 360),
	(10, 'Disco de Freio', 140.5),
	(11, 'Engate', 175),
	(12, 'Escapamento', 48),
	(13, 'Extintor', 60),
	(14, 'Lanterna', 170),
	(15, 'Filtro de Ar', 80),
	(16, 'Guincho', 400),
	(17, 'Óleo', 65),
	(18, 'Aditivo', 15),
	(19, 'Ponteira', 55),
	(20, 'Retrovisor', 75),
	(21, 'Sensor de Estacionamento', 140),
	(22, 'Volantes', 425);
