-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-11-2019 a las 17:07:02
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_libros`
--
CREATE DATABASE IF NOT EXISTS `inventario_libros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `inventario_libros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `codigo_autor` varchar(6) NOT NULL,
  `nombre_autor` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`codigo_autor`, `nombre_autor`, `nacionalidad`) VALUES
('AUT001', 'Julio Cortazar', 'Argentino'),
('AUT002', 'Roque Dalton', 'Salvadoreño'),
('AUT003', 'Miguel de Cervantes', 'Español'),
('AUT004', 'Oscar Wilde', 'Irlandes'),
('AUT006', 'Luis Alonso Arenivar', 'Salvadoreño'),
('AUT007', 'Eugenia Perez Martinez', 'Española'),
('AUT008', 'Aurelio Baldor', 'Cubano'),
('AUT009', 'Gabriel Garcia Marquez', 'Colombiano'),
('AUT010', 'Victor Lopez Castellanos', 'Salvadoreño'),
('AUT011', 'Mario Vargas Llosa', 'Peruano'),
('AUT012', 'Doris Lessing', 'Britanica'),
('AUT60', 'Ricardo', 'Estadounidence');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `codigo_editorial` varchar(6) NOT NULL DEFAULT '',
  `nombre_editorial` varchar(30) NOT NULL,
  `contacto` varchar(30) NOT NULL,
  `telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`codigo_editorial`, `nombre_editorial`, `contacto`, `telefono`) VALUES
('EDI001', 'Clasicos Roxsil', 'Juan Perez', '2285-8574'),
('EDI002', 'Editorial UDB', 'Hector Grenni', '2273-8574'),
('EDI003', 'Alfaguara', 'Santiago Morales', '2285-7485'),
('EDI004', 'Rama Editores', 'Marlon Castro', '2285-7485'),
('EDI005', 'McGraw-Hill', 'Steven Clinton', '2274-8596'),
('EDI006', 'Editorial Santillana', 'Miguel Juela', '2274-8574');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id_genero` int(11) NOT NULL,
  `nombre_genero` varchar(40) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id_genero`, `nombre_genero`, `descripcion`) VALUES
(1, 'Novela', 'Genero narrativo'),
(2, 'Poesía', 'Genero lirico'),
(3, 'Teatro', 'Obras clásicas de teatro'),
(4, 'Programación', 'Libros de programación'),
(5, 'Superación', 'Libros de superación y autoayuda'),
(6, 'Ciencias exactas', 'Libros de matemática y física'),
(7, 'Diccionarios', 'Diccionarios de diferentes idiomas y temas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `codigo_libro` varchar(9) NOT NULL,
  `nombre_libro` varchar(50) NOT NULL,
  `existencias` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `codigo_autor` varchar(6) NOT NULL,
  `codigo_editorial` varchar(6) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`codigo_libro`, `nombre_libro`, `existencias`, `precio`, `codigo_autor`, `codigo_editorial`, `id_genero`, `descripcion`) VALUES
('LIB000001', 'Rayuela', 3, '15.25', 'AUT001', 'EDI003', 1, 'Rayuela es una novela del escritor argentino Julio Cortázar. Escrita en París y publicada por primera vez el 28 de junio de 1963,​ constituye una de las obras centrales del boom latinoamericano.'),
('LIB000002', 'Historias de Cronopios', 10, '5.39', 'AUT001', 'EDI003', 1, 'Historias de Cronopios y de Famas es una obra fantástica del escritor argentino Julio Cortázar publicada en 1962 por el editorial Minotauro.'),
('LIB000003', 'Las historias prohibidas de pulgarcito', 4, '8.75', 'AUT002', 'EDI001', 1, 'Hay dos cosas que son ciertas aquí, ahora y siempre. La primera es que la historia –la oficial, la de mayúsculas reverenciales– la escriben los ganadores...'),
('LIB000004', 'Don Quijote de la Mancha', 5, '18.50', 'AUT003', 'EDI003', 1, 'Don Quijote de la Mancha​ es una novela escrita por el español Miguel de Cervantes Saavedra. Publicada su primera parte con el título de El ingenioso hidalgo don Quijote de la Mancha.'),
('LIB000005', 'Novelas ejemplares', 2, '5.78', 'AUT003', 'EDI003', 1, 'Se trata de doce novelas cortas que siguen el modelo establecido en Italia. Su denominación de ejemplares obedece al carácter didáctico y moral que incluyen en alguna medida los relatos. '),
('LIB000006', 'De profundis', 1, '3.25', 'AUT004', 'EDI001', 1, 'De profundis es la epístola que Oscar Wilde escribió para su compañero, Lord Alfred Douglas en la prisión de Reading en marzo de 1897, dos meses antes de que cumpliera su sentencia, la cual fue impuesta por el delito de sodomía.'),
('LIB000007', 'La Balada de la Cárcel de Reading ', 3, '2.25', 'AUT004', 'EDI001', 2, 'La Balada de la Cárcel de Reading es un poema escrito por Oscar Wilde durante su exilio en Berneval o Dieppe, Francia. Fue escrito tras su liberación de la prisión de Reading en torno al 19 de mayo de 1897. El poema es una de las baladas más representativas tanto del autor como de la literatura.'),
('LIB000008', 'Algebra Vectorial. Cuadernos de catedra', 20, '15.50', 'AUT006', 'EDI002', 6, 'Cuadernos de cátedra sobre matrices y vectores para las carreras de la facultad de ingeniería de la Universidad Don Bosco.'),
('LIB000009', 'Calculo diferencial. Cuadernos de cátedra', 5, '16.00', 'AUT006', 'EDI002', 6, 'Libro de calculo diferencial para los estudiantes de ingeniería de la Universidad Don Bosco. Abarca desde introducción a las funciones hasta aplicaciones de la derivada.'),
('LIB000010', 'Cálculo integral. Cuadernos de cátedra.', 50, '15.50', 'AUT006', 'EDI002', 6, 'Libro de calculo integral para los estudiantes de ingeniería de la Universidad Don Bosco. Abarca desde integrales definidas hasta aplicaciones de las integrales.'),
('LIB000011', 'HIBERNATE. PERSISTENCIA DE OBJETOS EN JEE', 2, '25.96', 'AUT007', 'EDI004', 4, 'Este libro ofrece, además de una introducción al framework y a la persistencia de datos en Java, un recorrido por las distintas maneras de interactuar con una base de datos relacional, empezando desde ejemplos sencillos a escenarios más complejos de mapeos. También cubre otros aspectos como el lenguaje HQL que nos permite un control más preciso de las consultas a la base de datos'),
('LIB000012', 'DESARROLLO DE APLICACIONES CON EL FRAMEWORK SPRING', 3, '20.99', 'AUT007', 'EDI004', 4, 'A través de este libro te introducirás en el framework Spring y en sus conceptos clave como la inversión de control. Partiendo de ejemplos simples irás descubriendo las distintas facetas de este framework con especial énfasis en el desarrollo de aplicaciones web y sin perder de vista la integración con Hibernate.'),
('LIB000015', 'Algebra', 50, '23.50', 'AUT008', 'EDI006', 6, 'Álgebra​ es un libro del matemático y profesor cubano Aurelio Baldor. La primera edición se produjo el 19 de junio de 1941. El texto de Baldor es el libro más consultado en escuelas y colegios de Latinoamérica.'),
('LIB000016', 'Aritmetica', 50, '26.50', 'AUT008', 'EDI006', 6, ' No hay mejor manera que empezar el estudio de los números o matemáticas elementales que con el libro de aritmética baldor.'),
('LIB000018', '100 años de soledad', 2, '15.00', 'AUT009', 'EDI001', 1, 'Cien años de soledad es una novela del escritor colombiano Gabriel García Márquez, ganador del Premio Nobel de Literatura en 1982. Es considerada una obra maestra de la literatura hispanoamericana y universal, así como una de las obras más traducidas y leídas en español.'),
('LIB000019', 'El coronel no tiene quien le escriba', 3, '3.25', 'AUT009', 'EDI001', 1, 'El coronel no tiene quien le escriba es una novela corta publicada por el escritor colombiano Gabriel García Márquez en 1961. Es una de las más célebres de las escritas por el autor, y su protagonista, un viejo coronel que espera la pensión que nunca llega, es considerado como uno de los personajes más entrañables de la literatura hispanoamericana del siglo XX. Fue incluida en la lista de las 100 mejores novelas en español del siglo XX del periódico español El Mundo.'),
('LIB000020', 'Apuntes de cátedra para una física de equilibrio', 17, '12.00', 'AUT010', 'EDI002', 6, 'Cuaderno de cátedra para el curso de Física Aplicada para los alumnos de la Facultad de Estudios Tecnológicos de la Universidad Don Bosco.'),
('LIB000021', 'La ciudad y los perros 2', 2, '15.00', 'AUT011', 'EDI003', 1, '                                    La ciudad y los perros es la primera novela del escritor peruano Mario Vargas Llosa, Premio Nobel de Literatura 2010. Ganador con el Premio Biblioteca Breve en 1962, fue publicada en octubre de 1963 y ganÃ³ el Premio de la CrÃ­tica EspaÃ±ola.\r\n                                ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`codigo_autor`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`codigo_editorial`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigo_libro`),
  ADD KEY `fk_libro_autor` (`codigo_autor`),
  ADD KEY `fk_libro_editorial` (`codigo_editorial`),
  ADD KEY `fk_libro_genero` (`id_genero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libro_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autores` (`codigo_autor`),
  ADD CONSTRAINT `fk_libro_editorial` FOREIGN KEY (`codigo_editorial`) REFERENCES `editoriales` (`codigo_editorial`),
  ADD CONSTRAINT `fk_libro_genero` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`);
--
-- Base de datos: `persona`
--
CREATE DATABASE IF NOT EXISTS `persona` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `persona`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"TallerDaw\",\"table\":\"score\"},{\"db\":\"TallerDaw\",\"table\":\"usuario\"},{\"db\":\"TallerDaw\",\"table\":\"preguntas\"},{\"db\":\"TallerDaw\",\"table\":\"cuestionario\"},{\"db\":\"TallerDaw\",\"table\":\"administrador\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-11-06 13:53:57', '{\"lang\":\"es\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `Taller`
--
CREATE DATABASE IF NOT EXISTS `Taller` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Taller`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadmin` int(50) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contraseña` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idadmin`, `usuario`, `contraseña`) VALUES
(1, 'root', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `idbitacora` int(50) NOT NULL,
  `idcaso` int(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `avance` int(3) NOT NULL,
  `img` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`idbitacora`, `idcaso`, `titulo`, `contenido`, `avance`, `img`) VALUES
(1, 1, 'mazda primera vez que biene', 'para comenzar al mazada se le retirara el moto y se le colocara un v8', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE `caso` (
  `idcaso` int(50) NOT NULL,
  `idvehiculo` int(50) NOT NULL,
  `idmecanico` int(50) NOT NULL,
  `idgerente` int(50) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `detalle` varchar(1000) NOT NULL,
  `descuento` int(3) DEFAULT NULL,
  `presupuesto` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caso`
--

INSERT INTO `caso` (`idcaso`, `idvehiculo`, `idmecanico`, `idgerente`, `fecha_entrada`, `fecha_salida`, `detalle`, `descuento`, `presupuesto`) VALUES
(1, 1, 1, 1, '2019-02-02', '2019-03-06', 'cambio de motor y restauracion', 0, 1100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(50) NOT NULL,
  `nombreusu` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `telefono2` varchar(8) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `dui` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombreusu`, `contraseña`, `nombre`, `telefono`, `telefono2`, `direccion`, `dui`) VALUES
(1, 'usuario1', '123', 'kevin alonso lobato ibarra', '78315623', NULL, 'camino de los lamento calle 12', '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `idgerente` int(50) NOT NULL,
  `nombreusu` varchar(30) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `telefono2` varchar(8) DEFAULT NULL,
  `dui` varchar(9) NOT NULL,
  `nit` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`idgerente`, `nombreusu`, `contraseña`, `nombre`, `telefono`, `telefono2`, `dui`, `nit`) VALUES
(1, 'gerente1', '123', 'ricardo nilos', '78315623', NULL, '123456789', '12345678901234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `idmecanico` int(50) NOT NULL,
  `nombreusu` varchar(30) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `telefono2` varchar(8) DEFAULT NULL,
  `dui` varchar(9) NOT NULL,
  `nit` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`idmecanico`, `nombreusu`, `contraseña`, `nombre`, `telefono`, `telefono2`, `dui`, `nit`) VALUES
(1, 'mecanico1', '123', 'carlos edenilson pineda', '78315623', NULL, '123456789', '12345678901234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idvehiculo` int(50) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `color` varchar(25) DEFAULT NULL,
  `nchasis` varchar(8) NOT NULL,
  `idcliente` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idvehiculo`, `marca`, `modelo`, `placa`, `color`, `nchasis`, `idcliente`) VALUES
(1, 'Honda', 'Eclipce', 'P012345', 'NEGRO', 'X2C3V451', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`idbitacora`),
  ADD KEY `idcaso` (`idcaso`);

--
-- Indices de la tabla `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`idcaso`),
  ADD KEY `idvehiculo` (`idvehiculo`),
  ADD KEY `idmecanico` (`idmecanico`),
  ADD KEY `idgerente` (`idgerente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `nombreusu` (`nombreusu`),
  ADD UNIQUE KEY `dui` (`dui`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`idgerente`),
  ADD UNIQUE KEY `nombreusu` (`nombreusu`),
  ADD UNIQUE KEY `dui` (`dui`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`idmecanico`),
  ADD UNIQUE KEY `nombreusu` (`nombreusu`),
  ADD UNIQUE KEY `dui` (`dui`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idvehiculo`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD UNIQUE KEY `nchasis` (`nchasis`),
  ADD KEY `idcliente` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idadmin` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `idbitacora` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caso`
--
ALTER TABLE `caso`
  MODIFY `idcaso` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gerente`
--
ALTER TABLE `gerente`
  MODIFY `idgerente` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `idmecanico` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idvehiculo` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`idcaso`) REFERENCES `caso` (`idcaso`);

--
-- Filtros para la tabla `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `caso_ibfk_1` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculo` (`idvehiculo`),
  ADD CONSTRAINT `caso_ibfk_2` FOREIGN KEY (`idmecanico`) REFERENCES `mecanico` (`idmecanico`),
  ADD CONSTRAINT `caso_ibfk_3` FOREIGN KEY (`idgerente`) REFERENCES `gerente` (`idgerente`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);
--
-- Base de datos: `TallerDaw`
--
CREATE DATABASE IF NOT EXISTS `TallerDaw` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `TallerDaw`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `pass` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `pass`) VALUES
(1, 'ricardo', '1234'),
(2, 'alberto', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario`
--

CREATE TABLE `cuestionario` (
  `id` int(11) NOT NULL,
  `codigo_examen` varchar(9) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuestionario`
--

INSERT INTO `cuestionario` (`id`, `codigo_examen`, `id_pregunta`) VALUES
(1, 'EXM01', 4),
(2, 'EXM01', 6),
(3, 'EXM01', 7),
(4, 'EXM01', 8),
(5, 'EXM01', 9),
(6, 'EXM00', 9),
(7, 'COD', 4),
(8, 'COD', 6),
(9, 'COD', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL,
  `respuestaUno` varchar(255) DEFAULT NULL,
  `respuestaDos` varchar(255) DEFAULT NULL,
  `respuestaTres` varchar(255) DEFAULT NULL,
  `respuestaCorrecta` varchar(255) DEFAULT NULL,
  `tiempo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `pregunta`, `respuestaUno`, `respuestaDos`, `respuestaTres`, `respuestaCorrecta`, `tiempo`) VALUES
(4, 'Esta es una', 'asdas', '', '', 'Correcta', 12),
(6, 'Cuanto es dos mas Dos', 'Tres', '', '', 'Cuatro', 0),
(7, 'Otra pregunta', 'Ok', '', '', 'Ninguna', 10),
(8, 'A weno', 'A weno Tres', '', '', 'A weno dos', 23),
(9, 'Capital de el salvador', 'Cojutepeque', '', '', 'San Salvador', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `score`
--

CREATE TABLE `score` (
  `id_score` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `score`
--

INSERT INTO `score` (`id_score`, `id_usuario`, `score`) VALUES
(1, 5, 10),
(2, 4, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `codigo_examen` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `codigo_examen`) VALUES
(1, '', 'EXM01'),
(2, '', 'EXM00'),
(3, '', 'EXM01'),
(4, 'USRlan', 'EXM01'),
(5, 'Ricardo', 'COD');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id_score`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `score`
--
ALTER TABLE `score`
  MODIFY `id_score` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  ADD CONSTRAINT `cuestionario_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`);

--
-- Filtros para la tabla `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
