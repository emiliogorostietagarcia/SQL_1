#1.- CREACIÓN DE LA TABLA CURSO
CREATE TABLE Curso(
Curso_id NUMERIC(20,0) NOT NULL,
Nombre VARCHAR(40) NOT NULL,
Instructor_titular VARCHAR(40) NOT NULL,
Instructor_adjunto VARCHAR(40) NULL,
Instructor_auxiliar VARCHAR(40) NULL,
Fecha_inicio DATE NOT NULL,
Fecha_fin DATE NOT NULL,
CONSTRAINT Curso_pk PRIMARY KEY (Curso_id)
);

#2.- SE INSERTAN DATOS
INSERT INTO Curso(Curso_id, Nombre, Instructor_titular, Instructor_adjunto, Instructor_auxiliar, Fecha_inicio, Fecha_fin) VALUES (1,'Algebra' ,'Juan' ,'Pedro', 'Pablo', '27-JAN-2020', '30-APR-2020');
INSERT INTO Curso(Curso_id, Nombre, Instructor_titular, Instructor_adjunto, Instructor_auxiliar, Fecha_inicio, Fecha_fin) VALUES (2,'Calculo' ,'Joaquin' ,'Rosalba', 'Alvaro', '27-JAN-2020', '30-APR-2020');
INSERT INTO Curso(Curso_id, Nombre, Instructor_titular, Instructor_adjunto, Instructor_auxiliar, Fecha_inicio, Fecha_fin) VALUES (3,'Geometria' ,'Isabel' ,'Carlos', 'Uriel', '27-JAN-2020', '30-APR-2020');
INSERT INTO Curso(Curso_id, Nombre, Instructor_titular, Instructor_adjunto, Instructor_auxiliar, Fecha_inicio, Fecha_fin) VALUES (4,'Redes' ,'Natalia' ,'Jose', 'Hector', '27-JAN-2020', '30-APR-2020');
INSERT INTO Curso(Curso_id, Nombre, Instructor_titular, Instructor_adjunto, Instructor_auxiliar, Fecha_inicio, Fecha_fin) VALUES (5,'Graficas' ,'Ignacio' ,'Marco', 'Rodrigo', '27-JAN-2020', '30-APR-2020');

#CAMBIOS PEDIDOS 
#3.-
ALTER TABLE Curso RENAME COLUMN Nombre TO Nombre_curso;
#4.-
ALTER TABLE Curso ADD (Semestre VARCHAR2(20));
#5.-
ALTER TABLE Curso ADD (Calificacion NUMERIC(20));
#6.-
ALTER TABLE Curso DROP COLUMN Fecha_fin; 
#7.-
ALTER TABLE Curso RENAME TO Curso_intersemestral;

#UPDATES PEDIDOS
#8.-
UPDATE Curso_intersemestral SET Calificacion = 10 WHERE Curso_id = 1;
#9.-
UPDATE Curso_intersemestral SET Calificacion = 8.5 WHERE Curso_id = 2;