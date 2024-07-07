-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- Crear tabla

DROP TABLE IF EXISTS data;

CREATE TABLE IF NOT EXISTS data (
    c1 STRING,
    c2 STRING,
    c3 INT
)

ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t' -- Delimitado por tabulador
STORED AS TEXTFILE;

-- Cargar datos
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

SELECT c1, COUNT(*) AS cantidad FROM data GROUP BY c1;