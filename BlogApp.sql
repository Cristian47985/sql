-- Crear la base de datos BlogApp
CREATE DATABASE BlogApp;

-- Seleccionar la base de datos
USE BlogApp;

-- Crear la tabla Autores
CREATE TABLE Autores (
  autor_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo_electronico VARCHAR(100) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  bio TEXT
);

-- Insertar datos en la tabla Autores
-- Las contraseñas están en texto plano solo para ilustración.
-- En una aplicación real, deberías usar BCrypt o algún otro algoritmo de hash y salting.
INSERT INTO Autores (nombre, correo_electronico, contrasena, bio) VALUES
('Juan Pérez', 'juan@example.com', '$2a$10$EhRl06BjntV4ksUeVAtyvOmDRCuvZ./a74A5Pwiw.0Z4V0NnS7OM6', 'Soy un apasionado escritor.'),
('María Gómez', 'maria@example.com', '$2a$10$EhRl06BjntV4ksUeVAtyvOmDRCuvZ./a74A5Pwiw.0Z4V0NnS7OM6', 'Amante de la literatura y la poesía.');

-- Crear la tabla Categorias
CREATE TABLE Categorias (
  categoria_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT
);

-- Insertar datos en la tabla Categorias

-- Insertar datos en la tabla Categorias
INSERT INTO Categorias (nombre, descripcion) VALUES
('Tecnología', 'Artículos sobre tecnología y gadgets.'),
('Viajes', 'Experiencias de viajes y recomendaciones.'),
('Cocina', 'Recetas deliciosas y tips culinarios.'),
('Salud y bienestar', 'Consejos y noticias sobre salud y bienestar.'),
('Moda y estilo', 'Tendencias de moda y consejos de estilo.'),
('Deportes y fitness', 'Noticias y rutinas de entrenamiento.'),
('Entretenimiento', 'Reseñas de películas, series y eventos.'),
('Arte y cultura', 'Explorando el mundo del arte y la cultura.'),
('Finanzas personales', 'Consejos para administrar tus finanzas.'),
('Educación', 'Temas educativos y consejos para el aprendizaje.'),
('Fotografía', 'Técnicas y consejos para la fotografía.'),
('Naturaleza y medio ambiente', 'Descubriendo la belleza de la naturaleza.'),
('Mascotas y animales', 'Cuidado y curiosidades sobre mascotas.'),
('Libros y literatura', 'Reseñas y recomendaciones de libros.'),
('Videojuegos', 'Novedades y análisis de videojuegos.'),
('Música', 'Noticias y reseñas de música.'),
('Historia', 'Explorando momentos históricos y culturas antiguas.'),
('Política', 'Análisis y noticias sobre política.'),
('Desarrollo personal y motivación', 'Consejos para crecimiento personal.'),
('Consejos de viaje y recomendaciones', 'Información y guías de viaje.');
-- (Resto de las categorías...)

-- Crear la tabla Posts
CREATE TABLE Posts (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  contenido TEXT,
  fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  autor_id INT NOT NULL,
  categoria_id INT,
  FOREIGN KEY (autor_id) REFERENCES Autores(autor_id) ON DELETE CASCADE,
  FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id) ON DELETE SET NULL
);


-- Insertar datos en la tabla Posts
INSERT INTO Posts (titulo, contenido, autor_id, categoria_id) VALUES
('Introducción a la inteligencia artificial', 'La inteligencia artificial (IA) es un campo de estudio que busca desarrollar algoritmos y sistemas capaces de simular la inteligencia humana. Desde el aprendizaje automático hasta el procesamiento del lenguaje natural y la visión por computadora, la IA ha experimentado un crecimiento significativo en los últimos años. En este artículo, exploramos los conceptos básicos de la IA y sus aplicaciones en diversas industrias.', 1, 1),
('Mi viaje a París', 'Hace unos meses tuve la oportunidad de viajar a París, la ciudad del amor y las luces. Desde la majestuosidad de la Torre Eiffel hasta la historia del Louvre y la belleza de Montmartre, cada rincón de la ciudad me dejó maravillado. En este relato, comparto mis experiencias, recomendaciones y momentos inolvidables que viví durante mi estadía en esta encantadora ciudad.', 2, 2),
('Receta de pastel de chocolate', '¿A quién no le gusta el chocolate? Si eres un amante del dulce, esta receta de pastel de chocolate es perfecta para ti. Con una base esponjosa de bizcocho de chocolate, relleno de crema de avellanas y cubierto con una ganache de chocolate suave y brillante, este pastel deleitará a tus papilas gustativas. Acompañado con una bola de helado de vainilla, es un verdadero placer para los sentidos. ¡Anímate a probarlo y sorprende a tus seres queridos con este delicioso postre!', 1, 3);
-- (Datos de ejemplo para los posts...)

-- Crear la tabla Comentarios
CREATE TABLE Comentarios (
  comentario_id INT AUTO_INCREMENT PRIMARY KEY,
  contenido TEXT NOT NULL,
  fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  autor_id INT NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY (autor_id) REFERENCES Autores(autor_id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE
);

-- Insertar datos en la tabla Comentarios
INSERT INTO Comentarios (contenido, autor_id, post_id) VALUES
('¡Excelente artículo! Me encantó la forma en que explicaste los conceptos de la IA.', 2, 1),
('París es definitivamente un lugar mágico. Gracias por compartir tus experiencias.', 1, 2),
('No puedo esperar para probar esta receta de pastel de chocolate. ¡Se ve delicioso!', 2, 3);
