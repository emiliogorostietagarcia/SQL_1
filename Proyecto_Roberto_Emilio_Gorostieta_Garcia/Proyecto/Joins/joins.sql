#1.-
SELECT c.tratamiento, c.prescribe_tratamiento
FROM tratamiento c 
INNER JOIN prescribe_tratamiento p ON c.tratamiento_id = c.prescribe_tratamiento_id;

#2.-
SELECT c.mascota, c.cliente
FROM mascota c 
INNER JOIN cliente p ON c.cliente_id = c.mascota_id;

#3.-
SELECT c.veterinario, c.consulta
FROM veterinario c 
INNER JOIN consulta p ON c.veterinario_id= c.consulta_id;

#4.-
SELECT c.cuenta, c.pago
FROM cuenta c 
INNER JOIN pago p ON c.cuenta_id = c.pago_id;

