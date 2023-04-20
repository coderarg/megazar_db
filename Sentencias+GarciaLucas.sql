USE mysql;
SELECT * FROM user;
SELECT * FROM user.lectura@localhost;

#Crear el usuario 'lectura' con dominio 'localhost'
CREATE USER 'lectura'@'localhost';
#Concede el permiso para realizar consultas SELECT al usuario 'lectura' con dominio 'localhost' (solo lectura)
GRANT SELECT ON *.* TO 'lectura'@'localhost';
#Crear el usuario 'admin' con dominio 'localhost'
CREATE USER 'admin'@'localhost';
#Concede el permiso para realizar consultas SELECT, INSERT y UPDATE al usuario 'admin' con dominio 'localhost' (lectura, insersión de datos y actualización)
GRANT SELECT, INSERT, UPDATE ON *.* TO 'admin'@'localhost';

SELECT * 
FROM mysql.user 
WHERE user LIKE 'lectura%';

SELECT * 
FROM mysql.user 
WHERE user LIKE 'admin%';