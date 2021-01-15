--CREACION DE TABLAS PARA PROYECTO VERSION 1 "VETERINARAI"
------------CREACION DE LA TABLA CLIENTE DE LA CUAL SE UTILIZARA EL CLIENTE_ID COMO LLAVE FORANEA EN LA TABLA MASCOTA
CREATE TABLE cliente (
	cliente_id NUMBER(10),
	tel_dueño NUMBER(11),
	nombre_dueño VARCHAR2(20),
	ap_paterno VARCHAR2(20),
	ap_materno VARCHAR2(20),
	colonia VARCHAR2(40),
	calle VARCHAR2(40),
	CONSTRAINT pk_cliente PRIMARY KEY (cliente_id)
);
------
------CREACION DE LA TABLA MASCOTA, SE UTILIZARA MASCOTA_ID COMO LLAVE FORANEA PARA LA TABLA MASCOTA_SERVICIO
CREATE TABLE mascota(
	mascota_id NUMBER(10),
	nombre_mascota VARCHAR2(20),
	edad NUMBER(10),
	raza VARCHAR2 (40),
	cliente_id NUMBER(10),
	CONSTRAINT pk_mascota PRIMARY KEY (mascota_id),
	CONSTRAINT fk_mascota_id FOREIGN KEY(cliente_id) REFERENCES cliente(cliente_id) 
);
------------
-----------CREACION DE LA TABLA SERVICIO, SE UTILIZARA SERVICIO_ID COMO LLAVE FORANEA PARA MASCOTA_SERVICIO Y PARA
-----------LA CREACION DE LAS TABLAS INCINERACION, CONSULTA, HOSPITALIZACION Y HABITACION
CREATE TABLE servicio(
	servicio_id NUMBER(10),
	tipo_servicio NUMBER(1),	
	CONSTRAINT pk_servicio PRIMARY KEY (servicio_id)
);
------------
------------CREADAS LAS TABLAS MASCOTA Y SERVICIO, PODEMOS TOMAR LAS LLAVES PRIMARIAS DE CADA UNA PARA UTILIZARLAS 
------------COMO LLAVES FORANEAS EN ESTA TABLA. SIN EMBARGO SE USA COMO LLAVE PRIMARIA MASCOTA_SERVICIO_ID
CREATE TABLE mascota_servicio(
	mascota_servicio_id NUMBER(10),
	servicio_id NUMBER(10),
	mascota_id NUMBER(10),
	CONSTRAINT pk_mascota_servicio PRIMARY KEY (mascota_servicio_id),
	CONSTRAINT fk_mascota_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id),
	CONSTRAINT fk_mascota_servicio1 FOREIGN key (mascota_id) REFERENCES mascota(mascota_id)
);

----------
----------SE CREAN LA TABLA DE EMPLEADO PUES SE NECESITARA PARA PODER CREAR LAS TABLAS DE VETERINARIO Y CUIDADOR 
----------DE LAS CUALES PARA EL SERVICIO DE CONSULTA SE UTILIZARA EMPLEADO_ID COMO LLAVE FOREANEA
CREATE TABLE empleado(
	empleado_id NUMBER(10),
	tipo_empleado VARCHAR2(11),
	calle VARCHAR2(30),
	colonia VARCHAR2(30),
	tel NUMBER (11),
	ap_paterno_emp VARCHAR2(20),
	ap_materno_emp VARCHAR2(20),
	nombre VARCHAR2(20),
	CONSTRAINT pk_empleado PRIMARY KEY (empleado_id)
);
----------
----------CREACION DE LAS TABLAS VETERINARIO Y CUIDADOR A PARTIR DE LA TABLA DE EMPLEADO
----------SE INDICA QUE LA CEDULA PROFESIONAL ES UNICA
CREATE TABLE veterinario(
	empleado_id NUMBER(10),
	cedula_profesional NUMBER(10),
	CONSTRAINT pk_veterinario PRIMARY KEY (empleado_id),
	CONSTRAINT fk_veterinario FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id),
	CONSTRAINT uk_cedula UNIQUE (cedula_profesional)
);

CREATE TABLE cuidador(
	empleado_id NUMBER(10),
	CONSTRAINT pk_cuidador PRIMARY KEY (empleado_id),
	CONSTRAINT fk_cuidador FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);
----------
----------SE CREAN LAS TABLAS DE LOS SERVICIOS DE INCINERACION Y CONSULTA, SE DEJA PARA DESPUES LA DE HOSPITALIZACION
----------PUES SE REQUIERE DE LAS TABLAS CUENTA Y TRATAMIENTO 
CREATE TABLE incineracion(
	servicio_id NUMBER(10),
	clave_uma NUMBER(10),
	costo_inc NUMBER(5,4),
	CONSTRAINT pk_incineracion PRIMARY KEY (servicio_id),
	CONSTRAINT fk_incineracion FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id),
	CONSTRAINT uk_clave_uma UNIQUE (clave_uma)
);

CREATE TABLE consulta(
	servicio_id NUMBER(10),
	diagnostico VARCHAR2(240),
	costo_consulta NUMBER(5,4),
	costo_medicina NUMBER(5,4),
	fecha_consulta DATE ,
	empleado_id NUMBER(10),
	CONSTRAINT pk_consulta PRIMARY KEY (servicio_id),
	CONSTRAINT fk_consulta FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id),
	CONSTRAINT fk_consulta1 FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);
-----------------
-----------------SE CREA LA TABLA TRATAMIENTO DE LA CUAL SE UTILIZARA TRATAMIENTO_ID COMO LLAVE FORANEA PARA LAS TABLAS
-----------------PREESCRIBE_TRATAMIENTO Y HOSPITALIZACION
CREATE TABLE tratamiento(
	tratamiento_id NUMBER(10),
	numtrat NUMBER(10),
	costo_tratamiento NUMBER(7),
	CONSTRAINT pk_tratamiento PRIMARY KEY (tratamiento_id)
);
-----------------
----------------- SE CREA LA TABLA PRESCRIBE_TRATAMIENTO CON TRATAMIENTO_ID COMO LLAVE FORANEA
----------------- Y DE ESTA MISMA TABLA SE USA LA LLAVE PRIMARIA EN LA CREACION DE LA TABLA MEDICAMENTO.
CREATE TABLE prescribe_tratamiento(
	prescribe_tratamiento_id NUMBER(10),
	indicaciones VARCHAR2(240),
	tratamiento_id NUMBER(10),
	CONSTRAINT pk_pres_trat PRIMARY KEY (prescribe_tratamiento_id),
	CONSTRAINT fk_pres_trat FOREIGN KEY (tratamiento_id) REFERENCES tratamiento(tratamiento_id)
);
-----------------
-----------------SE CREA LA TABLA MEDICAMENTO CON LA LLAVE FORANEA NECESITADA, DE LA TABLA ANTERIORN
CREATE TABLE medicamento(
	medicamento_id NUMBER(10),
	prescribe_tratamiento_id NUMBER(10),
	nombre_med VARCHAR2(20),
	precio_med NUMBER(7),
	CONSTRAINT pk_medicamento PRIMARY KEY (medicamento_id),
	CONSTRAINT fk_medicamento FOREIGN KEY (prescribe_tratamiento_id) REFERENCES prescribe_tratamiento(prescribe_tratamiento_id)	
);
----------------
----------------SE CREA LA TABLA CUENTA PARA UTILIZAR LA LLAVE PRIMARIA EN EL SERVICIO DE HOSPITALIZACION
----------------
CREATE TABLE cuenta(
	numero_cuenta_id  NUMBER(10),
	num_pagos NUMBER(10),
	frecuencia NUMBER(10),
	total NUMBER (10),
	CONSTRAINT pk_cuenta PRIMARY KEY (numero_cuenta_id)
);
----------------
----------------SE CREA LA TABLA DE HOSPITALIZACION USANDO LAS LLAVES FORANEAS CREADAS CON LAS TABLAS ANTERIORMENTE 
----------------Y LA LLAVE PRIMARIA DE LA TABLA SERVICIO
----------------
CREATE TABLE hospitalizacion(
	servicio_id NUMBER(10),
	fecha_ingreso DATE,
	fecha_alta DATE,
	costo_hosp NUMBER(5,4),
	diagnostico_hosp VARCHAR2(240),
	numero_cuenta_id NUMBER(10),
	tratamiento_id NUMBER(10),
	CONSTRAINT pk_hospital PRIMARY KEY (servicio_id),
	CONSTRAINT fk_hospital FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id),
	CONSTRAINT fk_hospital1 FOREIGN KEY (tratamiento_id) REFERENCES tratamiento(tratamiento_id),
	CONSTRAINT fk_hospital2 FOREIGN KEY (numero_cuenta_id) REFERENCES cuenta(numero_cuenta_id)
);
--------------
--------------SE CREA LA TABLA HABITACION A PARTIR DE LA TABLA HOSPITALIZACION USANDO COMO LLAVE FORANEASERVICIO_ID
--------------
CREATE TABLE habitacion(
	habitacion_id NUMBER(10),
	especie VARCHAR2(20),
	servicio_id NUMBER(10),
	CONSTRAINT pk_habitacion PRIMARY KEY (habitacion_id),
	CONSTRAINT fk_habitacion FOREIGN KEY (servicio_id) REFERENCES servicio(servicio_id)
);
------------
-----------SE CREA LA TABLA JAULA Y SE UTILIZAN LAS LLAVES FORANEAS DE LAS TABLAS HABITACION Y CUIDADOR 
-----------DE LAS CUALES SE UTILIZAN EMPLEADO_ID Y HABITACION_ID 
-----------
CREATE TABLE jaula(
	jaula_id NUMBER(10),
	habitacion_id NUMBER(10),
	empleado_id NUMBER(10),
	CONSTRAINT pk_jaula PRIMARY KEY (jaula_id),
	CONSTRAINT fk_jaula FOREIGN KEY (habitacion_id) REFERENCES habitacion(habitacion_id),
	CONSTRAINT fk_jaula1 FOREIGN KEY (empleado_id) REFERENCES cuidador(empleado_id)
);
--------
--------SE CREA LA TABLA PAGO CON LA LLAVE FORANEA DE LA TABLA CUENTA
--------
CREATE TABLE pago(
	numpago_id NUMBER(10),
	numero_cuenta_id NUMBER(10),
	estado VARCHAR2(20),
	fecha_realizacion DATE,
	CONSTRAINT pk_numpago PRIMARY KEY (numpago_id),
	CONSTRAINT fk_numpago FOREIGN KEY (numero_cuenta_id) REFERENCES cuenta(numero_cuenta_id)
);
