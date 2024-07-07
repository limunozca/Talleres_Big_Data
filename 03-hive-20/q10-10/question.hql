-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- Eliminamos la tabla si existe previamente
DROP TABLE IF EXISTS data;

-- Creamos la tabla 'data' sin definir nombres de columnas
CREATE TABLE data (
    col1 STRING,
    col2 ARRAY<STRING>,
    col3 MAP<STRING, INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
COLLECTION ITEMS TERMINATED BY ','
MAP KEYS TERMINATED BY '#'
STORED AS TEXTFILE;

-- Cargamos los datos desde el archivo 'data.tsv'
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

-- Consulta para contar la cantidad de registros por clave 'aaa' en la columna 3
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT
    key,
    COUNT(*) AS cantidad
FROM (
    SELECT
        key,
        col1
    FROM data
    LATERAL VIEW explode(map_keys(col3)) exploded_keys AS key
) t
GROUP BY key
ORDER BY key;
