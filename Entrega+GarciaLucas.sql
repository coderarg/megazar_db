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
p_nombre			VARCHAR(50) NOT NULL,
id_categoria		INT 		NOT NULL,
p_stock				INT 		NOT NULL,
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
