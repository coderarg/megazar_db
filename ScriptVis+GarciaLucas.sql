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

#3. Vista de mayores ganancias totales según la categoría de los productos vendidos.

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

#4. Vista de clientes que más compran
#5 Recupero de Inversión. (buscar primer fecha de venta y última fecha de venta. #tomar la diferencia en días y la ganancia bruta generada.
#Mostrar cuantos días se necesita para recuperar la inversión.
