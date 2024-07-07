-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne para cada valor único de la columna `t0.c2`, 
-- los valores correspondientes de la columna `t0.c1`. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- Eliminar la tabla si existe previamente
DROP TABLE IF EXISTS tbl0;

-- Crear la tabla tbl0 sin nombres de columna especificados
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

-- Cargar los datos desde el archivo CSV a la tabla tbl0
LOAD DATA LOCAL INPATH "tbl0.csv" OVERWRITE INTO TABLE tbl0;

-- Eliminar la tabla de salida si existe previamente
DROP TABLE IF EXISTS output_table;

-- Crear una tabla temporal para almacenar los resultados
CREATE TABLE output_table (
    letter STRING,
    numbers STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- Consulta para obtener los números correspondientes para cada letra en la columna 2
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letter, CONCAT_WS(':', COLLECT_LIST(CAST(c0 AS STRING))) AS numbers
FROM (
    SELECT SUBSTR(c1, 1, 1) AS letter, c0
    FROM tbl0
) t
GROUP BY letter;
