CREATE TABLE `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `endereco` varchar(300) NOT NULL,
  `telefone` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cozinha` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pedido` bigint NOT NULL,
  `tempo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(7,2) NOT NULL,
  `status` enum('PREPARANDO','EM TRANSPORTE','ENTREGUE') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `cozinha_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `motoboy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  `motoboy_disponivel` tinyint(1) NOT NULL DEFAULT '0',
  `id_pedido` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `motoboy_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `precoTotal` decimal(5,2) NOT NULL,
  `valorTotal` decimal(7,2) NOT NULL,
  `cliente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
