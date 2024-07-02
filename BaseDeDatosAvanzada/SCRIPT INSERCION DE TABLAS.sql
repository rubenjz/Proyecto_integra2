INSERT INTO db_integrador2.armas (tipo_arma, arma)
SELECT DISTINCT tipo_arma, arma
FROM db_integrador2.detenidos1
WHERE tipo_arma IS NOT NULL AND arma IS NOT NULL;

INSERT INTO db_integrador2.cantones (nombre_canton, codigo_canton)
SELECT DISTINCT canton, codigo_canton
FROM db_integrador2.detenidos1
WHERE canton IS NOT NULL AND codigo_canton IS NOT NULL;

INSERT INTO db_integrador2.circuitos (nombre_circuito, codigo_circuito, nombre_subcircuito, codigo_subcircuito)
SELECT DISTINCT nombre_circuito, codigo_circuito, nombre_subcircuito, codigo_subcircuito
FROM db_integrador2.detenidos1
WHERE nombre_circuito IS NOT NULL AND codigo_circuito IS NOT NULL AND nombre_subcircuito IS NOT NULL AND codigo_subcircuito IS NOT NULL;

INSERT INTO db_integrador2.lugares (lugar, tipo_lugar)
SELECT DISTINCT lugar, tipo_lugar
FROM db_integrador2.detenidos1
WHERE lugar IS NOT NULL AND tipo_lugar IS NOT NULL;

INSERT INTO db_integrador2.personasgeneral (sexo, nacionalidad, estado_civil, nivel_de_instruccion)
SELECT DISTINCT sexo, nacionalidad, estado_civil, nivel_de_instruccion
FROM db_integrador2.detenidos1
WHERE sexo IS NOT NULL AND nacionalidad IS NOT NULL AND estado_civil IS NOT NULL AND nivel_de_instruccion IS NOT NULL;

INSERT INTO db_integrador2.personas (edad, autoidentificacion_etnica, estatus_migratorio, genero, condicion, movilizacion, personasGeneral_personas_general_id)
SELECT edad, autoidentificacion_etnica, estatus_migratorio, genero, condicion, movilizacion,
    (SELECT personas_general_id FROM db_integrador2.personasgeneral
     WHERE sexo = detenidos1.sexo AND nacionalidad = detenidos1.nacionalidad AND estado_civil = detenidos1.estado_civil AND nivel_de_instruccion = detenidos1.nivel_de_instruccion) AS personasGeneral_personas_general_id
FROM db_integrador2.detenidos1
WHERE edad IS NOT NULL AND autoidentificacion_etnica IS NOT NULL AND estatus_migratorio IS NOT NULL AND genero IS NOT NULL AND condicion IS NOT NULL AND movilizacion IS NOT NULL;

INSERT INTO db_integrador2.distritos (nombre_distrito, codigo_distrito)
SELECT DISTINCT nombre_distrito, codigo_distrito
FROM db_integrador2.detenidos1
WHERE nombre_distrito IS NOT NULL AND codigo_distrito IS NOT NULL;

INSERT INTO db_integrador2.zonas (nombre_zona, nombre_subzona)
SELECT DISTINCT zona, subzona
FROM db_integrador2.detenidos1
WHERE zona IS NOT NULL AND subzona IS NOT NULL;

INSERT INTO db_integrador2.ubi_forma2 (zonas_zona_id, circuitos_circuito_id, distritos_distrito_id)
SELECT
    z.zona_id AS zonas_zona_id,
    c.circuito_id AS circuitos_circuito_id,
    di.distrito_id AS distritos_distrito_id
FROM db_integrador2.detenidos1 d
JOIN db_integrador2.zonas z ON z.nombre_zona = d.zona AND z.nombre_subzona = d.subzona
JOIN db_integrador2.circuitos c ON c.nombre_circuito = d.nombre_circuito AND c.codigo_circuito = d.codigo_circuito
JOIN db_integrador2.distritos di ON di.nombre_distrito = d.nombre_distrito AND di.codigo_distrito = d.codigo_distrito
WHERE d.zona IS NOT NULL AND d.nombre_circuito IS NOT NULL AND d.nombre_distrito IS NOT NULL;

INSERT INTO db_integrador2.parroquias (nombre_parroquia, codigo_parroquia)
SELECT DISTINCT nombre_parroquia, codigo_parroquia
FROM db_integrador2.detenidos1
WHERE nombre_parroquia IS NOT NULL AND codigo_parroquia IS NOT NULL;

INSERT INTO db_integrador2.provincincias (nombre_provincia, codigo_provincia)
SELECT DISTINCT nombre_provincia, codigo_provincia
FROM db_integrador2.detenidos1
WHERE nombre_provincia IS NOT NULL AND codigo_provincia IS NOT NULL;

INSERT INTO db_integrador2.ubi_forma1 (cantones_canton_id, parroquias_parroquia_id, provincincias_provincia_id)
SELECT
    c.canton_id AS cantones_canton_id,
    p.parroquia_id AS parroquias_parroquia_id,
    v.provincia_id AS provincincias_provincia_id
FROM db_integrador2.detenidos1 d
JOIN db_integrador2.cantones c ON c.nombre_canton = d.canton AND c.codigo_canton = d.codigo_canton
JOIN db_integrador2.parroquias p ON p.nombre_parroquia = d.nombre_parroquia AND p.codigo_parroquia = d.codigo_parroquia
JOIN db_integrador2.provincincias v ON v.nombre_provincia = d.nombre_provincia AND v.codigo_provincia = d.codigo_provincia
WHERE d.canton IS NOT NULL AND d.nombre_parroquia IS NOT NULL AND d.nombre_provincia IS NOT NULL;

INSERT INTO db_integrador2.fechahora (fecha_detencion, hora_detencion)
SELECT DISTINCT fecha_detencion, hora_detencion
FROM db_integrador2.detenidos1
WHERE fecha_detencion IS NOT NULL AND hora_detencion IS NOT NULL;


INSERT INTO db_integrador2.victimasdemuerte (
    area_Hecho, causa_muerte, presunta_motivacion, lugar, fecha_infraccion, tipo_muerte, tipo_arma, zonas_zona_id, personasGeneral_personas_general_id
)
SELECT 
    homicidios.area_del_hecho AS area_Hecho,
    homicidios.tipo_muerte AS causa_muerte,
    homicidios.presunta_motivacion_observacion AS presunta_motivacion,
    homicidios.lugar AS lugar,
    DATE_FORMAT(homicidios.fecha_infraccion, '%Y-%m-%d') AS fecha_infraccion,
    homicidios.tipo_muerte AS tipo_muerte,
    homicidios.tipo_arma AS tipo_arma,
    (SELECT zona_id FROM db_integrador2.zonas 
     WHERE nombre_zona = homicidios.zona 
     AND nombre_subzona = homicidios.subzona) AS zonas_zona_id,
    (SELECT personas_general_id FROM db_integrador2.personasgeneral 
     WHERE sexo = homicidios.sexo 
     AND nacionalidad = homicidios.nacionalidad 
     AND estado_civil = homicidios.estado_civil 
     AND nivel_de_instruccion = homicidios.instruccion) AS personasGeneral_personas_general_id
FROM db_integrador2.homicidios;
ALTER TABLE db_integrador2.victimasdemuerte
MODIFY COLUMN zonas_zona_id INT NULL;
drop table victimasdemuerte;
ALTER TABLE db_integrador2.victimasdemuerte
MODIFY COLUMN personasGeneral_personas_general_id INT NULL;


select * from armas;
select * from cantones;
select * from circuitos;
select * from detenciones;
select * from detenidos1;
select * from distritos;
select * from fechahora;
select * from homicidios;
select * from lugares;
select * from parroquias;
select * from personas;
select * from personasgeneral;
select * from provincincias;
select * from ubi_forma1;
select * from ubi_forma2;
select * from victimasdemuerte;
select * from zonas;
