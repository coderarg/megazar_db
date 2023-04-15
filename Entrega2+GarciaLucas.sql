#################################################################################
###########################   ENTREGA DE PROYECTO 2   ###########################
#################################################################################

   ######   ##    #   #######   #####    ######    #######       #           ####
   #        # #   #      #      #    #   #        #             # #         #    #
   ####     #  #  #      #      #####    ####     #    ###     #####           ##
   #        #   # #      #      #   #    #        #      #    #     #        ##
   ######   #    ##      #      #    #   ######    #######   #       #      #######

/********************************************************************************	
###########################   SCRIPT CREATE TABLES   ###########################
********************************************************************************/

CREATE schema megazar;
USE megazar;

CREATE TABLE clientes (
id_cliente			INT 		NOT NULL AUTO_INCREMENT,
c_cuit_cuil 		VARCHAR(50) NOT NULL,
c_nombres 			VARCHAR(50) NOT NULL,
c_apellidos 		VARCHAR(50) NOT NULL,
c_email 			VARCHAR(50) NOT NULL,
c_telefono			VARCHAR(50),
c_celular			VARCHAR(50) NOT NULL,
c_direccion			VARCHAR(100),
c_provincia			VARCHAR(50) NOT NULL,
c_pais				VARCHAR(50) NOT NULL,
c_comentario		VARCHAR(1000),
c_conversion		BOOLEAN 	NOT NULL,
c_fecha_contacto 	DATETIME 	NOT NULL,
PRIMARY KEY (id_cliente));

CREATE TABLE proveedores (
id_proveedor		INT 		NOT NULL AUTO_INCREMENT,
prov_cuit_cuil		VARCHAR(50) NOT NULL,
prov_nombre			VARCHAR(50) NOT NULL,
prov_telefono		VARCHAR(50),
prov_celular		VARCHAR(50) NOT NULL,
prov_email			VARCHAR(50),
prov_direccion		VARCHAR(100),
prov_provincia		VARCHAR(50) NOT NULL,
prov_pais			VARCHAR(50) NOT NULL,
PRIMARY KEY (id_proveedor));

CREATE TABLE categorias (
id_categoria		INT 		NOT NULL AUTO_INCREMENT,
cat_nombre			VARCHAR(50) NOT NULL,
PRIMARY KEY (id_categoria));

CREATE TABLE productos (
id_producto			INT 		NOT NULL AUTO_INCREMENT,
p_codigo			VARCHAR(50) NOT NULL,
p_nombre			VARCHAR(200) NOT NULL,
id_categoria		INT 		NOT NULL,
id_proveedor		INT 		NOT NULL,
PRIMARY KEY (id_producto),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor));

CREATE TABLE ventas (
id_venta			INT			NOT NULL AUTO_INCREMENT,
id_cliente			INT			NOT NULL,
id_producto			INT			NOT NULL,
id_categoria		INT			NOT NULL,
v_cantidad			INT			NOT NULL,
v_precio_u			FLOAT		NOT NULL,
v_descuento			FLOAT		NOT NULL,
v_precio_t			FLOAT		NOT NULL,
v_fecha				DATETIME	NOT NULL,
v_codigo_factura	VARCHAR(50) NOT NULL,
PRIMARY KEY (id_venta),
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria));

CREATE TABLE compras (
id_compra			INT			NOT NULL AUTO_INCREMENT,
id_proveedor		INT			NOT NULL,
id_producto			INT			NOT NULL,
id_categoria		INT			NOT NULL,
com_cantidad		INT			NOT NULL,
com_precio_u		FLOAT		NOT NULL,
com_descuento		FLOAT		NOT NULL,
com_precio_t		FLOAT		NOT NULL,
com_fecha			DATETIME	NOT NULL,
com_codigo_factura	VARCHAR(50) NOT NULL,
PRIMARY KEY (id_compra),
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria));



/********************************************************************************
#######################   SCRIPT INSERT DATA INTO TABLES   ######################
********************************************************************************/

INSERT INTO clientes (id_cliente, c_cuit_cuil, c_nombres, c_apellidos, c_email, c_telefono, c_celular, c_direccion, c_provincia, c_pais, c_comentario, c_conversion, c_fecha_contacto ) VALUES
('1', '20994242486', 'Fabiola', 'Fernandez', 'fabiolafernandez@gmail.com', '48381456', '1150625547', 'Independencia 466, Y4600AFJ San Salvador de Jujuy, Jujuy', 'Jujuy', 'Argentina', 'Lorem ipsum dolor sit amet consectetur', '0', '2022-06-11 17:48:09 '),
('2', '20302308972', 'Gustavo', 'García', 'gustavogarcia@gmail.com', '42607446', '1145559889', 'Agustín Alvarez 353, M5500BAX Capital, Mendoza', 'Mendoza', 'Argentina', 'Ratione, eveniet? Nihil possimus, soluta m', '1', '2022-01-05 06:32:41 '),
('3', '20132280430', 'Hebe', 'Pérez', 'hebeperez@gmail.com', '47468499', '1110695531', 'Juramento 2208-2102, C1428DNJ CABA', 'Buenos Aires', 'Argentina', 'Consequuntur eaque, praesenti', '0', '2022-11-24 12:56:30 '),
('4', '20751204792', 'José', 'Gonzalez', 'josegonzalez@gmail.com', '46634111', '1154126743', 'Guillermo Reyna 2921, Córdoba', 'Córdoba', 'Argentina', 'Distinctio laborum esse aspernatur', '0', '2022-08-09 21:05:02 '),
('5', '20521558829', 'María', 'Akerman', 'mariaakerman@gmail.com', '44394169', '1186248481', 'BGS, Ayacucho 1031, B1602 Florida, Provincia de Buenos Aires', 'Buenos Aires', 'Argentina', 'Harum pariatur soluta odio', '1', '2022-04-17 15:28:54 '),
('6', '20820840564', 'Jesús', 'Rojas', 'jesusrojas@gmail.com', '48867228', '1124651758', 'Milenio de Polonia 3241, S3002 Santa Fe', 'Santa Fé', 'Argentina', 'ciatis eum eaque aliquid', '0', '2022-09-20 07:11:13 '),
('7', '20582386374', 'Pablo', 'Balsamo', 'pablobalsamo@gmail.com', '43264343', '1178452478', 'Agustín Garzón 2899, X5006GGI Córdoba', 'Córdoba', 'Argentina', 'Non voluptas magnam, nulla ipsum esse', '1', '2022-01-01 00:00:00 '),
('8', '20947952508', 'Ezequiel', 'Trujillo', 'ezequieltrujillo@gmail.com', '47948353', '1118999249', 'Rondeau 3953, C1262ACG CABA', 'Buenos Aires', 'Argentina', 'dolor aliquid pariatur aperiam nemo quibusdam', '1', '2022-03-08 08:44:19 '),
('9', '20206154972', 'Clara', 'Spinetto', 'claraspinetto@gmail.com', '49230647', '1155126672', 'Almte. Zar 874, Z9050AFL Puerto Deseado, Santa Cruz', 'Santa Cruz', 'Argentina', 'qui laboriosam debitis pariatur recusandae', '0', '2022-07-30 18:39:37 '),
('10', '20500636175', 'Franco', 'Cáseres', 'francocaseres@gmail.com', '46794169', '1146161930', 'El Picaflor 750, San Salvador de Jujuy, Jujuy', 'Jujuy', 'Argentina', 'possimus, soluta maiores laboriosam nemo', '1', '2022-05-19 23:59:59 '),
('11', '20708558784', 'Celeste', 'Bianco', 'celestebianco@gmail.com', '41261418', '1189625063', '3 de Febrero 322, Rosario del Tala, Entre Ríos', 'Entre Ríos', 'Argentina', 'culpa possimus asperiores omnis', '0', '2022-12-22 11:27:08 '),
('12', '20673290122', 'Sofía', 'Alcorta', 'sofiaalcorta@gmail.com', '41179437', '1135196142', 'Av. San Martín 1456, Salta', 'Salta', 'Argentina', 'aperiam nemo quibusdam accusamus iste rerum?', '1', '2022-02-14 19:13:45 '),
('13', '20593800673', 'Isabel', 'Linares', 'isabellinares@gmail.com', '47910813', '1132046198', '25 de Mayo 208, E3260 Concepción del Uruguay, Entre Ríos', 'Entre Ríos', 'Argentina', 'magnam, nulla ipsum esse est facilis suscipit ', '1', '2022-02-10 05:36:22 '),
('14', '20206017638', 'Agustín', 'Villalobos', 'agustinvillalobos@gmail.com', '43036226', '1123701028', 'Portela 440, C1406 CABA', 'Buenos Aires', 'Argentina', 'accusantium nisi voluptatem porro officia nulla', '0', '2022-10-05 14:22:59 '),
('15', '20292707921', 'Sebastián', 'Gascón', 'sebastiangascon@gmail.com', '41922445', '1132982739', 'G. Pizarro 1646, Salta', 'Salta', 'Argentina', 'Laborum perferendis ipsam sequi, ullam obcaecati', '1', '2022-05-28 10:06:36 '),
('16', '20862408889', 'Marta', 'Chacón', 'martachacon@gmail.com', '46054998', '1111166788', 'Dr. Luis Beláustegui 802, C1416CXH CABA', 'Buenos Aires', 'Argentina', 'aliquid modi ad cum minus libero quaerat', '1', '2022-04-01 16:40:12 '),
('17', '20299615234', 'Lucía', 'Beneite', 'luciabeneite@gmail.com', '43506899', '1123400742', 'Sta. Teresita 1610, E3260 Concepción del Uruguay, Entre Ríos', 'Entre Ríos', 'Argentina', 'mollitia dolorem, doloribus vero minima ratione  ', '0', '2022-08-11 02:18:47 '),
('18', '20674109926', 'Carla', 'Azuero', 'carlaazuero@gmail.com', '44030424', '1153313087', 'Baigorria 501, M5521KJG, Mendoza', 'Mendoza', 'Argentina', 'pariatur aperiam nemo ', '0', '2022-12-31 23:59:59 '),
('19', '20735532977', 'Carlos', 'Chourio', 'carloschourio@gmail.com', '41709390', '1173874846', 'Aviador Kingsley 2267, X5011CMG Córdoba', 'Córdoba', 'Argentina', 'possimus, soluta maiores laboriosam nemo', '0', '2022-07-17 08:33:58 '),
('20', '20523284213', 'Patricia', 'Figueroa', 'patriciafigueroa@gmail.com', '42153057', '1144467610', 'Rivadavia 1199, Salta', 'Salta', 'Argentina', 'culpa possimus asperiores omnis', '0', '2022-06-24 21:01:05 '),
('21', '20290244374', 'Ermenegildo', 'Lobo', 'ermenegildolobo@gmail.com', '45728529', '1136372504', 'Dr. Luis S Zurueta 408, Y4600 San Salvador, Jujuy', 'Jujuy', 'Argentina', 'aperiam nemo quibusdam accusamus iste rerum?', '1', '2022-03-15 12:09:44 '),
('22', '20304322588', 'Oscar', 'Maldonado', 'oscarmaldonado@gmail.com', '45440035', '1135844548', 'Juncal 430, B1722 Merlo, Provincia de Buenos Aires', 'Buenos Aires', 'Argentina', 'magnam, nulla ipsum esse est facilis suscipit ', '1', '2022-09-14 03:54:28 '),
('23', '20494541147', 'Fernando', 'Rubio', 'fernandorubio@gmail.com', '46326303', '1184574794', 'Av. Entre Ríos 758, Salta', 'Salta', 'Argentina', 'accusantium nisi voluptatem porro officia nulla', '0', '2023-01-20 15:47:30 '),
('24', '20921043567', 'Julián', 'Cardoso', 'juliancardoso@gmail.com', '40116675', '1166470409', 'Ancón 4772, González Catán, Provincia de Buenos Aires', 'Buenos Aires', 'Argentina', 'Laborum perferendis ipsam sequi, ullam obcaecati', '0', '2022-03-26 11:22:48 '),
('25', '20696077341', 'Alejandrina', 'Mateos', 'alejandrinamateos@gmail.com', '45832442', '1172572069', 'Almte. Guillermo Brown 135, Paraná, Entre Ríos', 'Entre Ríos', 'Argentina', 'aliquid modi ad cum minus libero quaerat', '1', '2022-08-04 06:55:51 '),
('26', '20493806540', 'Alejo', 'Brunno', 'alejobrunno@gmail.com', '42480420', '1176018534', 'Belgrano 248, X5000JQF Córdoba', 'Córdoba', 'Argentina', 'Distinctio laborum esse aspernatur', '0', '2022-04-10 00:37:16 '),
('27', '20737859513', 'Agustina', 'Leira', 'agustinaleira@gmail.com', '45976812', '1130401963', 'Pres. Juan Domingo Perón 358, B1878 Quilmes, Provincia de Buenos Aires', 'Buenos Aires', 'Argentina', 'Harum pariatur soluta odio', '1', '2022-10-30 19:18:24 '),
('28', '20776832308', 'Tina', 'Vargas', 'tinavargas@gmail.com', '45345366', '1103683718', 'Ejército del Nte. 1152, San Salvador de Jujuy, Jujuy', 'Jujuy', 'Argentina', 'ciatis eum eaque aliquid', '0', '2022-06-03 09:48:57 '),
('29', '20251740827', 'Pamela', 'Mamakian', 'pamelamamakian@gmail.com', '49439291', '1107291442', 'Salta 537, M5570 San Martín, Mendoza', 'Mendoza', 'Argentina', 'Non voluptas magnam, nulla ipsum esse', '1', '2022-04-08 13:37:01 '),
('30', '20434654859', 'Belén', 'Gamallo', 'belengamallo@gmail.com', '41627383', '1167906576', 'Lavaisse 1698, S3004 Santa Fe', 'Santa Fé', 'Argentina', 'Distinctio laborum esse aspernatur', '0', '2022-12-11 08:02:39 '),
('31', '20316617372', 'Alexis', 'Botero', 'alexisbotero@gmail.com', '45565263', '1116440080', 'Int. Manuel Quindimil 532, B1824 Lanús, Provincia de Buenos Aires', 'Buenos Aires', 'Argentina', 'Harum pariatur soluta odio', '0', '2022-01-31 20:29:14 '),
('32', '20435017442', 'Gastón', 'Chizabas', 'gastonchizabas@gmail.com', '43063109', '1152410031', 'ARA, Gdor. Mayer 57, Z9400ARA Río Gallegos, Santa Cruz', 'Santa Cruz', 'Argentina', 'ciatis eum eaque aliquid', '1', '2022-07-09 16:59:28 '),
('33', '20945955361', 'Rubén', 'Cárdenas', 'rubencardenas@gmail.com', '43270116', '1144323626', 'Belgrano 5277, B1653 Villa Ballester, Provincia de Buenos Aires', 'Buenos Aires', 'Argentina', 'Non voluptas magnam, nulla ipsum esse', '1', '2022-11-05 04:51:53 '),
('34', '20321761667', 'Adriana', 'Barraza', 'adrianabarraza@gmail.com', '47543153', '1117651933', 'Libertad 1001, Y4600EZU San Salvador de Jujuy, Jujuy', 'Jujuy', 'Argentina', 'dolor aliquid pariatur aperiam nemo quibusdam', '0', '2022-05-08 22:13:47 '),
('35', '20771136279', 'Sol', 'Forcado', 'solforcado@gmail.com', '42694215', '1123219870', 'Nicolás Avellaneda 502, M5500EUV Mendoza', 'Mendoza', 'Argentina', 'qui laboriosam debitis pariatur recusandae', '0', '2022-05-08 11:13:47 ');

#Verificación
SELECT *
FROM clientes;


INSERT INTO proveedores (id_proveedor, prov_cuit_cuil, prov_nombre, prov_telefono, prov_celular, prov_email, prov_direccion, prov_provincia, prov_pais ) VALUES
('1', '30177254933', 'El Gran Pez SRL', '1184738991', '1100098271', 'info@elgranpezsrl.com', 'Lavalle 2133, C1051 CABA', 'Buenos Aires', 'Argentina '),
('2', '30646444626', 'Plásticos y Más SRL', '1107134733', '1138699778', 'info@plásticosymássrl.com', 'Viamonte 2265, C1056 CABA', 'Buenos Aires', 'Argentina '),
('3', '30927087299', 'Lola Mayorista', '1129475483', '1177490603', 'contacto@lolamayorista.com', 'Jose Alico 1150, 1770 Aldo Bonzi, Buenos Aires Province, Argentina', 'Buenos Aires', 'Argentina '),
('4', '30681156390', 'Design Cups', '1120917450', '1165232629', 'info@designcups.com', 'Tucumán 2541, C1052 CABA', 'Buenos Aires', 'Argentina '),
('5', '30831708216', 'Bazar Mayorista', '1156945129', '1159934670', 'contacto@bazarmayorista.com', 'Lavalle 2020, C1051 ABF, Buenos Aires', 'Buenos Aires', 'Argentina '),
('6', '30859037191', 'Puerto 5', '1115382191', '1160001262', 'info@puerto5.com', 'Tte. Gral. Juan Domingo Perón 2378, C1040 AAL, Buenos Aires', 'Buenos Aires', 'Argentina '),
('7', '30412759394', 'Buenos Aires Bazar', '1125065206', '1152182759', 'info@buenosairesbazar.com', 'Av. Rivadavia 3940, C1204AAR CABA', 'Buenos Aires', 'Argentina '),
('8', '30709705193', 'Diverthia', '1107973031', '1172985984', 'info@diverthia.com', 'Av. Corrientes 2115 1ER PISO, C1045 CABA', 'Buenos Aires', 'Argentina '),
('9', '30782350783', 'MajuOnce', '1166039941', '1157035517', 'contacto@majuonce.com', 'Valentín Gómez 2715, C1028AAH Once, Buenos Aires', 'Buenos Aires', 'Argentina '),
('10', '30891896410', 'El Paso', '1162708507', '1159463640', 'info@elpaso.com', 'Pasteur 360, C1028 CABA', 'Buenos Aires', 'Argentina '),
('11', '30126205305', 'Novopack', '1180640270', '1183142675', 'info@novopack.com', 'Joaquín V. González 1080, C1407 CZT, Buenos Aires', 'Buenos Aires', 'Argentina '),
('12', '30767490895', 'Soifer Hermanos', '1101594905', '1153350817', 'info@soiferhermanos.com', 'Bahía Blanca 1445, C1407 ACA, Buenos Aires', 'Buenos Aires', 'Argentina '),
('13', '30787599807', 'Hiperpack', '1155109892', '1158808206', 'contacto@hiperpack.com', ' Larrea 415, C1030 AAI, Buenos Aires', 'Buenos Aires', 'Argentina '),
('14', '30963351183', 'Horizonte', '1123412622', '1110774173', 'contacto@horizonte.com', 'Sarmiento 2426, C1044 AAN, Buenos Aires', 'Buenos Aires', 'Argentina '),
('15', '30394943237', 'Antonio', '1149616815', '1185857615', 'contacto@antonio.com', 'Av. Jujuy 1220, C1247ABN CABA', 'Buenos Aires', 'Argentina '),
('16', '30478113034', 'Guru-Kirpa', '1145515006', '1165374484', 'info@guru-kirpa.com', 'Sarmiento 2446, C1040AAB CABA', 'Buenos Aires', 'Argentina '),
('17', '30240004488', 'El Rey', '1109783921', '1172756232', 'info@elrey.com', 'Larrea 238, C1030AAF CABA', 'Buenos Aires', 'Argentina '),
('18', '30386435560', 'Redlimp', '1190610767', '1180732640', 'info@redlimp.com', 'Tte. Gral. Juan Domingo Perón 2699, C1884 Once, Buenos Aires', 'Buenos Aires', 'Argentina '),
('19', '30416797108', 'Leo', '1160010359', '1187748162', 'contacto@leo.com', 'Lima 267, C1073 CABA', 'Buenos Aires', 'Argentina '),
('20', '30996236044', 'Laura', '1153046584', '1116529058', 'info@laura.com', 'Larrea 251, C1030 AAE, Buenos Aires', 'Buenos Aires', 'Argentina ');

#Verificación
SELECT *
FROM proveedores;


INSERT INTO categorias (id_categoria, cat_nombre) VALUES
('1','cocina'),
('2','vajilla'),
('3','herramientas'),
('4','decoracion'),
('5','deportes'),
('6','libreria'),
('7','juegos');

#Verificación
SELECT *
FROM categorias;


INSERT INTO productos (id_producto, p_codigo, p_nombre, id_categoria, id_proveedor) VALUES
('1', '8461', 'Lupa Plegable Luz 10 Led Manicura Pedicura Multifunción', '3', '6'),
('2', '5268', 'Pack 6 Velas Led Con Llama Con Movimiento Realistas (10cm)', '4', '18'),
('3', '5885', 'Set 10 Bowls Cocina Acero Inoxidable Ensaladera 21 Cm', '1', '17'),
('4', '3703', 'Cuchillo Hacha Hachuela Carnicero Chef Estilo Asiático', '1', '17'),
('5', '6272', 'Plato Rectangular Curvo Diseño Bandeja Picada Cerámica', '2', '8'),
('6', '6438', 'Set 6 Bandeja Rectangular Heladera Pollería Carnicería', '1', '3'),
('7', '6216', 'Tijera Para Peluquería Canina Esquilar Ovejas Animales', '3', '19'),
('8', '1579', 'Set 3 Cuchillos Acero Mas Pelapapa Filo Cerámico Regalo', '1', '18'),
('9', '6992', 'Set 100 Luces Led Lluvia Navidad Guirnalda Navideña A Pila', '4', '4'),
('10', '8601', '100 Luces Arroz Navidad Led Guirnalda X2 unidades', '4', '13'),
('11', '1541', 'Seca Limpia Vidrios Rasqueta Plástica Mango Corto ', '3', '15'),
('12', '5224', 'Chuchillo Navaja Mariposa Practica Sin Filo Tornasol', '5', '18'),
('13', '5338', 'Cafetera Prensa Francesa de Embolo Vidrio y Acero Inoxidable', '1', '15'),
('14', '6948', 'Cafetera Italiana Moka Expresso 3 Pocillos Aluminio Pulida', '1', '6'),
('15', '6821', 'Pinza Ferretería Artesano 4,5 Pulgadas Alicate', '3', '13'),
('16', '9998', 'Humidificador Difusor Usb Diseño Reno Hogar Turquesa', '4', '10'),
('17', '3892', 'Juego Llaves Torx Tramper 9 Piezas Largas', '3', '14'),
('18', '5038', 'Funda De Gel Para Asiento De Bicicleta Spinning Gel', '5', '9'),
('19', '6177', 'Mazo Poker Cartas Doradas Baraja Naipes Dolar', '7', '14'),
('20', '7089', 'Mochila Bolso Agua Hidratación Portátil Camping Ciclismo', '5', '12'),
('21', '8919', 'Kit Buceo Snorkel Pata Rana Antiparras Infantil', '5', '8'),
('22', '5037', 'Casco Reforzado Bici Roller Monopatin Colores Niños', '5', '6'),
('23', '3879', 'Botella Aluminio Deportiva 500ml Agua Gym Metalica', '5', '11'),
('24', '1348', 'Set Sushi X 4 Pzas Plato Cerámica Palito Chino Porta Salsa', '2', '4'),
('25', '3965', 'Set X 2 Aceitera Vinagrera Vidrio Pico Vertedor Tapa', '1', '18'),
('26', '3011', 'Budinera Molde Silicona Horno Repostería', '1', '15'),
('27', '3775', 'Set X10 Cubo Anti Stress Fidget Spinner Cube Ansiedad', '7', '20'),
('28', '9042', 'Set 8 Espatulas Uso Artístico Metálicas', '3', '10'),
('29', '3618', 'Kit Natación Gorro Gorra Silicona Antiparras', '5', '7'),
('30', '1821', 'Jenga 36 Piezas Madera Torre Apilable', '7', '9'),
('31', '8944', 'Soldaditos Plástico Bolsa X 45 Pzas', '7', '14'),
('32', '6176', 'Tijera Podar Curva 8 Pulgadas Jardinería', '3', '4'),
('33', '7634', 'Tabla De Picar Pleglable Flexible Cocina Verdura', '1', '12'),
('34', '2018', 'Set Cubiertos Tenedor Cuchara Navaja Camping', '5', '19'),
('35', '1698', 'Juego Domino 28 Piezas De Colores Estuche Metalico', '7', '12'),
('36', '3687', 'Pinza Multifunción Led 6 Funciones', '3', '4'),
('37', '2310', 'Pack 6 Velas Led Con Llama Con Movimiento Realistas (7.5cm)', '4', '8'),
('38', '4936', 'Pack 8 Velas Led Con Llama Con Movimiento Realistas (7.5cm)', '4', '12'),
('39', '5968', 'Cartuchera PowerRangers Rojo con Negro 25 cm', '6', '12'),
('40', '5747', 'Ajedrez Plegable Magnetico Tablero Pvc Imantado', '7', '12');

#Verificación
SELECT *
FROM productos;


INSERT INTO ventas (id_venta, id_cliente, id_producto, id_categoria, v_cantidad, v_precio_u, v_descuento, v_precio_t, v_fecha, v_codigo_factura) VALUES
('1', '7', '39', '6', '2', '2300', '0', '4600', '2022-01-01 00:00:00', 'V-2022001'),
('2', '7', '8', '1', '9', '12000', '5400', '102600', '2022-01-01 00:00:00', 'V-2022001'),
('3', '7', '1', '3', '6', '7000', '2100', '39900', '2022-01-01 00:00:00', 'V-2022001'),
('4', '2', '11', '3', '3', '1200', '0', '3600', '2022-01-05 06:32:41', 'V-2022002'),
('5', '2', '39', '6', '9', '2300', '1035', '19665', '2022-01-05 06:32:41', 'V-2022002'),
('6', '2', '24', '2', '6', '6000', '1800', '34200', '2022-01-05 06:32:41', 'V-2022002'),
('7', '13', '21', '5', '8', '3300', '1320', '25080', '2022-02-10 05:36:22', 'V-2022003'),
('8', '13', '1', '3', '3', '7000', '1050', '19950', '2022-02-10 05:36:22', 'V-2022003'),
('9', '12', '35', '7', '3', '3400', '0', '10200', '2022-02-14 19:13:45', 'V-2022004'),
('10', '12', '38', '4', '7', '3300', '1155', '21945', '2022-02-14 19:13:45', 'V-2022004'),
('11', '8', '18', '5', '5', '2000', '0', '10000', '2022-03-08 08:44:19', 'V-2022005'),
('12', '8', '27', '7', '10', '1000', '0', '10000', '2022-03-08 08:44:19', 'V-2022005'),
('13', '8', '33', '1', '9', '800', '0', '7200', '2022-03-08 08:44:19', 'V-2022005'),
('14', '21', '10', '4', '5', '1500', '0', '7500', '2022-03-15 12:09:44', 'V-2022006'),
('15', '16', '12', '5', '4', '5600', '1120', '21280', '2022-04-01 16:40:12', 'V-2022007'),
('16', '16', '39', '6', '5', '2300', '0', '11500', '2022-04-01 16:40:12', 'V-2022007'),
('17', '29', '32', '3', '7', '6500', '2275', '43225', '2022-04-08 13:37:01', 'V-2022008'),
('18', '5', '25', '1', '4', '1500', '0', '6000', '2022-04-17 15:28:54', 'V-2022009'),
('19', '10', '25', '1', '2', '1500', '0', '3000', '2022-05-19 23:59:59', 'V-2022010'),
('20', '10', '7', '3', '5', '3500', '875', '16625', '2022-05-19 23:59:59', 'V-2022010'),
('21', '15', '2', '4', '10', '2000', '1000', '19000', '2022-05-28 10:06:36', 'V-2022011'),
('22', '15', '26', '1', '9', '800', '0', '7200', '2022-05-28 10:06:36', 'V-2022011'),
('23', '15', '39', '6', '10', '2300', '1150', '21850', '2022-05-28 10:06:36', 'V-2022011'),
('24', '15', '37', '4', '8', '2700', '1080', '20520', '2022-05-28 10:06:36', 'V-2022011'),
('25', '32', '23', '5', '8', '1200', '0', '9600', '2022-07-09 16:59:28', 'V-2022012'),
('26', '32', '12', '5', '7', '5600', '1960', '37240', '2022-07-09 16:59:28', 'V-2022012'),
('27', '25', '14', '1', '3', '11000', '1650', '31350', '2022-08-04 06:55:51', 'V-2022013'),
('28', '22', '11', '3', '6', '1200', '0', '7200', '2022-09-14 03:54:28', 'V-2022014'),
('29', '27', '12', '5', '5', '5600', '1400', '26600', '2022-10-30 19:18:24', 'V-2022015'),
('30', '27', '22', '5', '3', '1700', '0', '5100', '2022-10-30 19:18:24', 'V-2022015'),
('31', '27', '8', '1', '10', '12000', '6000', '114000', '2022-10-30 19:18:24', 'V-2022015'),
('32', '27', '16', '4', '2', '1100', '0', '2200', '2022-10-30 19:18:24', 'V-2022015'),
('33', '33', '24', '2', '5', '6000', '1500', '28500', '2022-11-05 04:51:53', 'V-2022016'),
('34', '33', '13', '1', '10', '8000', '4000', '76000', '2022-11-05 04:51:53', 'V-2022016'),
('35', '33', '11', '3', '10', '1200', '0', '12000', '2022-11-05 04:51:53', 'V-2022016'),
('36', '33', '25', '1', '8', '1500', '0', '12000', '2022-11-05 04:51:53', 'V-2022016');

#Verificación
SELECT *
FROM ventas;


INSERT INTO compras (id_compra, id_proveedor, id_producto, id_categoria, com_cantidad, com_precio_u, com_descuento, com_precio_t, com_fecha, com_codigo_factura) VALUES
('1', '5', '4', '1', '30', '2500', '0', '75000', '2021-10-02 01:23', '2022001'),
('2', '6', '35', '7', '30', '1900', '0', '57000', '2021-10-04 03:05', '2022002'),
('3', '3', '15', '3', '27', '3400', '0', '91800', '2021-10-04 22:15', '2022003'),
('4', '3', '39', '6', '23', '1300', '0', '29900', '2021-10-04 22:15', '2022003'),
('5', '15', '36', '3', '23', '700', '0', '16100', '2021-10-07 16:45', '2022004'),
('6', '8', '25', '1', '24', '800', '0', '19200', '2021-10-08 08:30', '2022005'),
('7', '10', '33', '1', '23', '450', '0', '10350', '2021-10-10 03:00', '2022006'),
('8', '5', '19', '7', '29', '200', '0', '5800', '2021-10-12 13:45', '2022007'),
('9', '2', '3', '1', '22', '1500', '0', '33000', '2021-10-14 04:00', '2022008'),
('10', '11', '20', '5', '28', '3000', '0', '84000', '2021-10-15 20:15', '2022009'),
('11', '4', '6', '1', '26', '3000', '0', '78000', '2021-10-16 11:45', '20220010'),
('12', '7', '37', '4', '24', '1500', '0', '36000', '2021-10-18 02:30', '20220011'),
('13', '6', '18', '5', '23', '1000', '0', '23000', '2021-10-19 22:45', '20220012'),
('14', '14', '34', '5', '29', '1400', '0', '40600', '2021-10-21 13:15', '20220013'),
('15', '19', '1', '3', '26', '3000', '0', '78000', '2021-10-22 05:30', '20220014'),
('16', '20', '14', '1', '21', '6000', '12600', '113400', '2021-10-24 15:45', '20220015'),
('17', '5', '12', '5', '25', '2300', '0', '57500', '2021-10-26 06:00', '20220016'),
('18', '2', '28', '3', '28', '2400', '0', '67200', '2021-10-27 18:30', '20220017'),
('19', '5', '24', '2', '30', '3750', '11250', '101250', '2021-10-29 09:45', '20220018'),
('20', '8', '17', '3', '22', '1500', '0', '33000', '2021-10-30 23:00', '20220019'),
('21', '10', '2', '4', '29', '1000', '0', '29000', '2021-11-01 21:30', '20220020'),
('22', '1', '12', '5', '22', '2300', '0', '50600', '2021-11-02 11:15', '20220021'),
('23', '5', '16', '4', '25', '600', '0', '15000', '2021-11-04 03:30', '20220022'),
('24', '10', '33', '1', '23', '1400', '0', '32200', '2021-11-05 14:00', '20220023'),
('25', '18', '38', '4', '25', '1700', '0', '42500', '2021-11-07 00:30', '20220024'),
('26', '19', '18', '5', '28', '1000', '0', '28000', '2021-11-08 19:45', '20220025'),
('27', '5', '19', '7', '23', '200', '0', '4600', '2021-11-10 08:15', '20220026'),
('28', '8', '7', '3', '27', '1750', '0', '47250', '2021-11-11 22:30', '20220027'),
('29', '8', '40', '7', '24', '3500', '0', '84000', '2021-11-11 22:30', '20220027'),
('30', '6', '29', '5', '21', '1500', '0', '31500', '2021-11-15 06:00', '20220028'),
('31', '20', '27', '7', '26', '700', '0', '18200', '2021-11-16 21:15', '20220029'),
('32', '6', '31', '7', '29', '1700', '0', '49300', '2021-11-18 10:45', '20220030'),
('33', '10', '8', '1', '27', '8000', '21600', '194400', '2021-11-19 22:00', '20220031'),
('34', '16', '24', '2', '30', '3750', '11250', '101250', '2021-11-21 14:30', '20220032'),
('35', '17', '9', '4', '24', '500', '0', '12000', '2021-11-23 06:45', '20220033'),
('36', '19', '21', '5', '26', '1500', '0', '39000', '2021-11-24 20:00', '20220034'),
('37', '5', '5', '2', '25', '2000', '0', '50000', '2021-11-26 09:30', '20220035'),
('38', '18', '3', '1', '25', '1500', '0', '37500', '2021-11-28 01:45', '20220036'),
('39', '19', '31', '7', '28', '1700', '0', '47600', '2021-11-29 16:15', '20220037'),
('40', '20', '26', '1', '25', '450', '0', '11250', '2021-12-01 07:30', '20220038'),
('41', '6', '19', '7', '25', '200', '0', '5000', '2021-12-02 22:00', '20220039'),
('42', '20', '32', '3', '23', '3300', '0', '75900', '2021-12-04 13:15', '20220040'),
('43', '8', '30', '7', '26', '2100', '0', '54600', '2021-12-06 04:30', '20220041'),
('44', '9', '13', '1', '25', '4500', '11250', '101250', '2021-12-07 18:45', '20220042'),
('45', '18', '34', '5', '22', '1400', '0', '30800', '2021-12-09 10:00', '20220043'),
('46', '16', '37', '4', '27', '1500', '0', '40500', '2021-12-11 04:30', '20220044'),
('47', '15', '23', '5', '21', '700', '0', '14700', '2021-12-14 01:15', '20220045'),
('48', '7', '10', '4', '25', '900', '0', '22500', '2021-12-15 18:45', '20220046'),
('49', '1', '22', '5', '23', '800', '0', '18400', '2021-12-18 05:00', '20220047'),
('50', '4', '11', '3', '20', '700', '0', '14000', '2021-12-20 13:30', '20220048');

#Verificación
SELECT *
FROM compras;



/********************************************************************************
#############################   SCRIPT CREATE VIEWS   ###########################
********************************************************************************/

#1. Vista de Stock: Mostrar por cada producto la diferencia entre lo comprado y vendido.

CREATE OR REPLACE VIEW stock AS
	#Traigo la tabla de todos los productos
	SELECT p.id_producto,
	p_nombre producto,
    (cantidad_comprada - cantidad_vendida) stock
	FROM productos p
    #La comparo con una sub consulta que trae 2 tablas (compras y ventas)
	LEFT JOIN
		(SELECT a.id_producto,
		SUM(com_cantidad) cantidad_comprada,
        COALESCE(SUM(b.v_cantidad), '0') cantidad_vendida
		FROM compras a
		LEFT JOIN 
			(SELECT id_producto,
			v_cantidad
			FROM ventas) b
		ON a.id_producto = b.id_producto
		GROUP BY a.id_producto) v
	ON p.id_producto = v.id_producto
	GROUP BY p.id_producto;

#Verificación vista 'stock'
SELECT *
FROM stock;

#2. Ganancia y rentabilidad por unidad de los productos vendidos
#Ganancia: Diferencia entre precio de compra y venta
#Rentabilidad: Relación entre costo y venta

CREATE OR REPLACE VIEW ganancia_rentabilidad AS
	#Tomo la tabla de productos y la comparo con compra y venta para ver diferencia costo / precios.
	SELECT p.id_producto,
	p.p_nombre,
	costo_producto,
	precio_producto,
	(precio_producto - costo_producto) ganancia,
	(costo_producto / precio_producto) rentabilidad
	FROM productos p
	LEFT JOIN(
		SELECT a.id_producto,
		#traemos el precio por unidad con descuentos de proveedor aplicados
		(SUM(com_precio_t) / SUM(com_cantidad)) costo_producto,
		precio_producto
		FROM compras a
		LEFT JOIN (
			SELECT id_producto,
			(SUM(v_precio_t) / SUM(v_cantidad)) precio_producto
			FROM ventas
			GROUP BY id_producto) b
		ON a.id_producto = b.id_producto
		GROUP BY id_producto) cv
	ON p.id_producto = cv.id_producto
	GROUP BY id_producto
	HAVING ganancia IS NOT NULL OR rentabilidad IS NOT NULL
	ORDER BY rentabilidad ASC; #productos con mayor rentabilidad primero

#Verificación vista 'ganancia_rentabilidad'
SELECT *
FROM ganancia_rentabilidad;

#3. Vista de mayores ganancias totales de los productos vendidos.

#Traigo tabla de productos, compras y ventas.
CREATE OR REPLACE VIEW mayores_ganancias AS
    SELECT p.id_producto,
	p.p_nombre,
    cantidad,
	costo_producto,
	precio_producto,
	((precio_producto - costo_producto)*cantidad) ganancia_total #calculo ganancia total por producto
	FROM productos p
	LEFT JOIN(
		SELECT a.id_producto,
        cantidad,
		#traemos el precio por unidad con descuentos de proveedor aplicados
		(SUM(com_precio_t) / SUM(com_cantidad)) costo_producto,
		precio_producto
		FROM compras a
		LEFT JOIN (
			SELECT id_producto,
            SUM(v_cantidad) cantidad,
			(SUM(v_precio_t) / SUM(v_cantidad)) precio_producto
			FROM ventas
			GROUP BY id_producto) b
		ON a.id_producto = b.id_producto
		GROUP BY id_producto) cv
	ON p.id_producto = cv.id_producto
	GROUP BY id_producto
    HAVING ganancia_total IS NOT null
    ORDER BY ganancia_total DESC;

#Verifico vista 'mayores_ganancias'
SELECT *
FROM mayores_ganancias;

#4. Vista de top 10 clientes que más compran para campaña de e-mail marketing con descuento exclusivo
CREATE OR REPLACE VIEW clientes_top10 AS
	SELECT v.id_cliente,
	CONCAT(c_nombres, ' ', c_apellidos) nombre_completo,
	c_email,
	SUM(v_precio_t) monto_total
	FROM ventas v 
	LEFT JOIN
	clientes c
	ON v.id_cliente = c.id_cliente
	GROUP BY 1
	ORDER BY monto_total DESC
	LIMIT 10;

#Verifico vista 'clientes_top10'
SELECT *
FROM clientes_top10;

#5 Recupero de Inversión. (buscar primer fecha de venta y última fecha de venta. #tomar la diferencia en días y la ganancia bruta generada.
#Mostrar cuantos días se necesita para recuperar la inversión.

CREATE OR REPLACE VIEW recupero_inversion AS
	SELECT COUNT(id_compra) compras_realizadas,
	COUNT(id_venta) ventas_realizadas,
	SUM(com_precio_t) inversion,
	SUM(v_precio_t) ganancia_bruta,
	(SUM(com_precio_t) - SUM(v_precio_t)) no_recuperado,
	datediff(max(v_fecha), max(com_fecha)) tiempo_inversion, ##Diferencia de días desde la última inversión hasta la última venta
	(SUM(v_precio_t) / datediff(max(v_fecha), max(com_fecha))) recupero_por_dia,
	((SUM(com_precio_t) - SUM(v_precio_t)) / (SUM(v_precio_t) / datediff(max(v_fecha), max(com_fecha)))) estimacion_dias_recupero_inversion
	FROM compras c
	LEFT JOIN
	ventas v
	ON c.id_compra = v.id_venta;

#Verificio vista 'recupero_inversion'
SELECT *
FROM recupero_inversion;



/********************************************************************************
###########################   SCRIPT CREATE FUNCTIONS   #########################
********************************************************************************/

##Función que muestra la inversión total entre 2 fechas determinadas
DELIMITER $$
CREATE FUNCTION `inversion_entre_fechas`(fecha1 DATETIME, fecha2 DATETIME) RETURNS int
DETERMINISTIC
BEGIN
	DECLARE inversion INT;
    
	SET inversion = (
		SELECT SUM(com_precio_t)
		FROM compras
		WHERE com_fecha BETWEEN fecha1 AND fecha2);
    
    RETURN COALESCE(inversion, '0');
END $$
DELIMITER ;
##Verifico que funcione la función viendo el monto de las compras de Octubre de 2021
SELECT inversion_entre_fechas('2021-10-01 00:00:00', '2021-10-31 23:59:00') AS inversion;

DELIMITER $$
## Función que devuelve la cantidad de stock de un producto específico.
CREATE FUNCTION `stock_de_producto`(id_del_producto INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE stock VARCHAR(50);
    
	SET stock = (
		SELECT(cantidad_comprada - cantidad_vendida) stock
		FROM productos p
		#La comparo con una sub consulta que trae 2 tablas (compras y ventas)
		LEFT JOIN
			(SELECT a.id_producto,
			SUM(com_cantidad) cantidad_comprada,
			COALESCE(SUM(b.v_cantidad), '0') cantidad_vendida
			FROM compras a
			LEFT JOIN 
				(SELECT id_producto,
				v_cantidad
				FROM ventas) b
			ON a.id_producto = b.id_producto
			GROUP BY a.id_producto) v
		ON p.id_producto = v.id_producto
		GROUP BY p.id_producto
		HAVING p.id_producto = id_del_producto);
    
    RETURN COALESCE(stock, 'Producto No Encontrado');
END $$
DELIMITER ;
##Verifico stock de productos según id
SELECT stock_de_producto(1);
SELECT stock_de_producto(3);
SELECT stock_de_producto(60); #como no existe, me comenta que no se encontró producto



/********************************************************************************
#######################   SCRIPT CREATE STORED PROCEDURES   #####################
********************************************************************************/

#Stored Procedure 1: Ordenar tabla con nombre_de_columna por ASC o DESC)
#Más allá que el ejercicio precisa 2 parámetros, agrego uno para poder seleccionar la tabla que se quiere ordenar.
DELIMITER $$
CREATE PROCEDURE `ordenar_tabla` (IN param_tabla VARCHAR(50), param_columna VARCHAR(50), param_orden VARCHAR(4))
BEGIN
	#Guardo cada parametro en una variable
    SET @tabla = param_tabla;
	SET @columna = param_columna;
    SET @orden = param_orden;
    #En otra variable concateno la query con las variables que tomé de los parámetros
    SET @sql = CONCAT('SELECT * FROM ', @tabla,  ' ORDER BY ', @columna, ' ', @orden);
    #Luego ejecuto la query
    PREPARE ordenar FROM @sql;
    EXECUTE ordenar;
END $$
DELIMITER ;

#Verifico que ordena diferentes tablas, por diferentes columnas, en diferentes órdenes.
CALL ordenar_tabla ('productos', 'p_nombre', 'ASC');
CALL ordenar_tabla ('productos', 'p_codigo', 'ASC');
CALL ordenar_tabla ('compras', 'com_precio_t', 'DESC');

#Stored Procedure 2: Inserta elementos en la tabla categorias
#Si ya existe esa categoria, devuelve id = 0, caso contrario la carga y devuelve el id que se asignó por auto_increment.

DELIMITER $$
CREATE PROCEDURE `insertar_categoria` (IN nom_categoria VARCHAR(50))
BEGIN
	#Declaro una variable donde guardaré si existe o no una categoria con el nombre nom_categoria
	DECLARE existe_categoria INT;
    #Declaro el una variable a la que se le asigna el id según el condicional.
    DECLARE id INT;
    #Si el COUNT(*) da un número quiere decir que existe esa categoria, si dá 0 (cero) entonces no existe esa categoria
    SET existe_categoria = (SELECT COUNT(*) FROM categorias WHERE cat_nombre = nom_categoria);
    IF existe_categoria = 0 THEN
		INSERT INTO categorias (cat_nombre) VALUES (nom_categoria);
        SET id = LAST_INSERT_ID();
    ELSE
		SET id = 0;
    END IF;
	SELECT id;
END $$
DELIMITER ;

CALL insertar_categoria ('una_categoria'); #Cargo una categoría
CALL insertar_categoria ('otra_categoria'); #Cargo otra categoría
CALL insertar_categoria ('una_categoria'); #Acá no carga nada y muestra un 0 en id

#Verifico tabla categorias
SELECT *
FROM categorias;



/********************************************************************************
###########################   SCRIPT CREATE TRIGGERS   #########################
********************************************************************************/

#Tabla para logs
CREATE TABLE log_megazar (
usuario VARCHAR(50) NOT NULL,
operacion VARCHAR(20) NOT NULL,
id_operacion VARCHAR(20) NOT NULL,
fecha_hora DATETIME NOT NULL
);

#1 Realizar un Trigger con AFTER que modifique el stock cada vez que se realiza la venta o compra de un producto.alter
##Ejemplo para compras
DELIMITER $$
CREATE TRIGGER update_stock_compras
AFTER INSERT ON compras
FOR EACH ROW
BEGIN
	DECLARE idCompra INT;
    DECLARE idProducto INT;
    DECLARE stock INT;
    SET idCompra = NEW.id_compra;
    SET idProducto = NEW.id_producto;
    SET stock = NEW.com_cantidad;
    
    ##Sumo stock cuando se compra el producto, comparando el id_producto ingresado con el de la tabla 'productos'
    UPDATE productos 
    SET com_cantidad = com_cantidad + stock 
    WHERE id_producto = idProducto;
    
    ##Como plus, registro en la tabla 'logs_compra_venta' USER() quien carga el producto, operacion: si es 'compra' o 'venta', id_compra y la fecha y hora actual.
    INSERT INTO log_megazar (usuario, operacion, id_operacion, fecha_hora) 
    VALUES (USER(), 'compra', idCompra, NOW());
END $$

##Ejemplo para ventas
CREATE TRIGGER update_stock_ventas
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN

	DECLARE idVenta INT;
    DECLARE idProducto INT;
    DECLARE stock INT;
    SET idVenta = NEW.id_venta;
    SET idProducto = NEW.id_producto;
    SET stock = NEW.v_cantidad;
    ##Igual que el trigger anterior, solo que este resta stock cuando se vende el producto.
    UPDATE productos 
    SET v_cantidad = v_cantidad + stock 
    WHERE id_producto = idProducto;
    
    INSERT INTO log_megazar (usuario, operacion, id_operacion, fecha_hora) 
    VALUES (USER(), 'venta', idVenta, NOW());

END $$
DELIMITER ;


#2 Crear un trigger con BEFORE que verifique que no se ingrese un cliente repetido.
DELIMITER $$
CREATE TRIGGER verificacion_cliente_existente
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
	
    DECLARE cuitCuil INT;
    DECLARE emailCliente VARCHAR(100);
    DECLARE existeCliente INT;
    SET cuitCuil= NEW.c_cuit_cuil;
    SET emailCliente = NEW.c_email;
    SELECT COUNT(*) INTO existeCliente
        FROM clientes
        WHERE c_cuit_cuil = cuitCuil OR c_email = emailCliente;
    
    IF existeCliente > 0 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cliente Existente';
    ELSE
        INSERT INTO clientes (id_cliente, c_cuit_cuil, c_nombres, c_apellidos, c_email, c_telefono, c_celular, c_direccion, c_provincia, c_pais, c_comentario, c_conversion, c_fecha_contacto) 
        VALUES (NEW.id_cliente, NEW.c_cuit_cuil, NEW.c_nombres, NEW.c_apellidos, NEW.c_email, NEW.c_telefono, NEW.c_celular, NEW.c_direccion, NEW.c_provincia, NEW.c_pais, NEW.c_comentario, NEW.c_conversion, NEW.c_fecha_contacto);
    END IF;
    
    INSERT INTO log_megazar (usuario, operacion, id_operacion, fecha_hora) 
    VALUES (USER(), 'nuevo_cliente', NEW.id_cliente, NOW());
    
END $$
DELIMITER ;


