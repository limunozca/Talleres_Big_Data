-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne unicamente la columna t0.c5 con sus 
-- elementos en mayuscula.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- Eliminar las tablas si existen para un inicio limpio

DROP TABLE IF EXISTS tbl0;
DROP TABLE IF EXISTS tbl0_processed;

-- Crear la tabla original tbl0
CREATE TABLE tbl0 (
    c0 INT,
    c1 STRING,
    c2 INT,
    c3 DATE,
    c4 STRING,
    c5 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH "tbl0.csv" OVERWRITE INTO TABLE tbl0;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT UPPER(c4) AS mayuscula FROM tbl0;