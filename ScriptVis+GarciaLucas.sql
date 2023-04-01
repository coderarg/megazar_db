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

#2. Ganancia por unidad de los productos vendidos: Diferencia entre precio real de compra y de venta

SELECT p.id_producto,
p.p_nombre,
cv.precio_compra_unidad,
cv.precio_venta_unidad
FROM productos p
LEFT JOIN(
	SELECT a.id_producto,
    
    #traemos el precio por unidad con descuentos de proveedor aplicados
    SUM(com_precio_t),
    SUM(com_cantidad)
    
    FROM compras a
    LEFT JOIN (
		SELECT id_producto,
        SUM(v_cantidad) cantidad_vendida,
		SUM(v_precio_t) monto_total_vendido,
        (SUM(v_precio_t) / SUM(v_cantidad)) precio_producto
		FROM ventas
		GROUP BY id_producto) b
    ON a.id_producto = b.id_producto) cv
ON p.id_producto = cv.id_producto;













SELECT p.id_producto id,
p.p_nombre nombre,
SUM(v_cantidad) cantidad,
SUM(v_precio_t) monto_total
FROM ventas v
LEFT JOIN
	(SELECT id_producto,
    p_nombre
    FROM productos) p
ON v.id_producto = p.id_producto
GROUP BY p.id_producto
ORDER BY cantidad DESC, monto_total DESC;

#3. Vista de mejores ganancias según la categoría.

#4. Vista de clientes que más compran

