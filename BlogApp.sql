-- Crear la base de datos BlogApp
CREATE DATABASE BlogApp;

-- Seleccionar la base de datos
USE BlogApp;

-- Crear la tabla Autores
CREATE TABLE `Autores` (
  `autor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `bio` text,
  `imagenUrl` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `bloqueado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`autor_id`),
  CONSTRAINT `Autores_chk_1` CHECK ((`rol` in (_utf8mb4'User',_utf8mb4'Admin')))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear la tabla Categorias
DROP TABLE IF EXISTS `Categorias`;
CREATE TABLE `Categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Crear la tabla Posts
CREATE TABLE `Posts` (
  `autor_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `post_id` int NOT NULL AUTO_INCREMENT,
  `fecha_publicacion` datetime(6) DEFAULT NULL,
  `contenido` text,
  `titulo` varchar(255) DEFAULT NULL,
  `imagenUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FKirg4va56f9ipunghmtyq3jaxh` (`autor_id`),
  KEY `FKc8x9oat55sy68l295h71uvi9s` (`categoria_id`),
  CONSTRAINT `FKc8x9oat55sy68l295h71uvi9s` FOREIGN KEY (`categoria_id`) REFERENCES `Categorias` (`categoria_id`),
  CONSTRAINT `FKirg4va56f9ipunghmtyq3jaxh` FOREIGN KEY (`autor_id`) REFERENCES `Autores` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Crear la tabla Comentarios
CREATE TABLE `Comentarios` (
  `autor_id` int DEFAULT NULL,
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `fecha_comentario` datetime(6) DEFAULT NULL,
  `contenido` text,
  PRIMARY KEY (`comentario_id`),
  KEY `FK75o2rphok7cullkev083frqa` (`autor_id`),
  KEY `FKiaj2kmr0ok827wdin7923q9ce` (`post_id`),
  CONSTRAINT `FK75o2rphok7cullkev083frqa` FOREIGN KEY (`autor_id`) REFERENCES `Autores` (`autor_id`),
  CONSTRAINT `FKiaj2kmr0ok827wdin7923q9ce` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
