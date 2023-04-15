#Triggers
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

