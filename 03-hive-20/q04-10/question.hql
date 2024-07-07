-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne los valores únicos de la columna `t0.c5` 
-- (ordenados). 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
-- crear tabla
DROP TABLE IF EXISTS tbl0;
DROP TABLE IF EXISTS tbl_filtered;
DROP TABLE IF EXISTS tbl_processed;

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

LOAD DATA LOCAL INPATH 'tbl0.csv' OVERWRITE INTO TABLE tbl0;

CREATE TABLE tbl_processed (
    c0 INT,
    c1 STRING,
    c2 INT,
    c3 DATE,
    c4_processed STRING,
    c5 STRING
);

INSERT INTO TABLE tbl_processed
SELECT 
    c0,
    c1,
    c2,
    c3,
    c4_processed,
    c5
FROM tbl0
LATERAL VIEW explode(split(c4, ':')) exploded_table AS c4_processed;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT DISTINCT c4_processed FROM tbl_processed ORDER BY c4_processed ASC;