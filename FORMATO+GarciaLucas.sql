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

