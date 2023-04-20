SET SQL_SAFE_UPDATES=0;

START TRANSACTION;

SELECT * FROM compras;

DELETE
FROM compras
WHERE id_compra > 45;

##ROLLBACK;
COMMIT;


START TRANSACTION;

SELECT * FROM categorias;

INSERT INTO categorias (id_categoria, cat_nombre) VALUES
( 10 , 'juevos de mesa'),
( 11, 'tazas'),
( 12, 'ropa'),
( 13, 'camping');
SAVEPOINT categorias_nuevas_1;

INSERT INTO categorias (id_categoria, cat_nombre) VALUES
(14, 'juguetes'),
(15, 'ropa blanca'),
(16, 'decoración exterior'),
(17, 'zapatillas');

SAVEPOINT categorias_nuevas_2;

#RELEASE SAVEPOINT categorias_nuevas_1;

ROLLBACK TO SAVEPOINT categorias_nuevas_1;
