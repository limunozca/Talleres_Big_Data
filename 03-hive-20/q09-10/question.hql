-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne la columna `tbl0.c1` y el valor 
-- correspondiente de la columna `tbl1.c4` para la columna `tbl0.c2`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS tbl0;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS join_t;

CREATE TABLE tbl0 (
    id STRING,
    letra STRING,
    col3 INT,
    fecha DATE,
    col5 STRING,
    col6 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH "tbl0.csv" OVERWRITE INTO TABLE tbl0;

CREATE TABLE tbl1 (
    id STRING,
    c2 INT,
    c3 STRING,
    c4 STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH "tbl1.csv" OVERWRITE INTO TABLE tbl1;

CREATE TABLE join_t AS
SELECT 
    t0.id,
    t0.letra,
    t1.c4
FROM tbl0 t0
LEFT JOIN tbl1 t1
ON t0.id = t1.id;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT
    id,
    letra,
    REGEXP_EXTRACT(c4, CONCAT(letra, '#(\\d)')) AS letra_y_valor
FROM join_t;