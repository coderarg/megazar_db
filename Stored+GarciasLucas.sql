##Crear 2 Stored Procedures

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
