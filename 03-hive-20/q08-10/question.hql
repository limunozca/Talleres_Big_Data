-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que para cada valor único de la columna `t0.c2,` 
-- calcule la suma de todos los valores asociados a las claves en la columna 
-- `t0.c6`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
DROP TABLE IF EXISTS tbl0;

CREATE TABLE tbl0 (
    c0 STRING,
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
SELECT
    c1,
    SUM(valor) AS suma
FROM (
    SELECT
        c1,
        CAST(regexp_extract(kv, '#(\\d+)', 1) AS INT) AS valor
    FROM
        tbl0
        LATERAL VIEW explode(split(c5, ':')) tbl_exploded AS kv
) t
GROUP BY
    c1
ORDER BY
    c1;