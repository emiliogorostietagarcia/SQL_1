#1.-
ALTER TABLE empleado ADD (edad NUMBER (3), CONSTRAINT chk_edad CHECK (edad>18));

#2.-
ALTER TABLE cuenta ADD (status CHAR(2), CHECK (status IN ('IN' , 'AC')));

#3.-
ALTER TABLE mascota MODIFY (edad VARCHAR2(10));

#4.-
UPDATE empleado SET tel = 'NA' WHERE empleado_id < 100 AND 50 < empleado_id;

#5.-
UPDATE tratamiento SET costo_tratamiento = 2000 WHERE tratamiento_id > 20;

#6.-
DELETE FROM empleado WHERE empleado_id = 78;

#7.-
DELETE FROM empleado WHERE empleado_id = 90;