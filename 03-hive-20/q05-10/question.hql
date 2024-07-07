-- 
-- Pregunta
-- ===========================================================================
--
-- Realice una consulta que compute la cantidad de veces que aparece cada valor 
-- de la columna `t0.c5`  por año.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS tbl0;
DROP TABLE IF EXISTS tbl0_processed;

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

CREATE TABLE tbl0_processed (
    c0 INT,
    c1 STRING,
    c2 INT,
    c3 DATE,
    c4_processed STRING,
    c5 STRING
);

INSERT INTO TABLE tbl0_processed
SELECT c0, c1, c2, c3, c4_processed, c5
FROM tbl0
LATERAL VIEW explode(split(c4, ':')) exploded_table AS c4_processed;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT YEAR(c3) AS year, c4_processed, COUNT(*) AS count
FROM tbl0_processed
GROUP BY YEAR(c3), c4_processed
ORDER BY year, c4_processed;