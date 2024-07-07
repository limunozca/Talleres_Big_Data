-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que compute la cantidad de registros por letra de la 
-- columna 2 y clave de la columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `a` en la columna 2 y la clave `aaa` en la 
-- columna 3 es:
--
--     a    aaa    5
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- Eliminar la tabla si existe para evitar conflictos
DROP TABLE IF EXISTS data;

-- Crear la tabla con las columnas definidas según la estructura de datos
CREATE TABLE data (
    col1 STRING,
    col2 ARRAY<STRING>,
    col3 MAP<STRING, INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t' -- El delimitador en data.tsv es un tabulador
COLLECTION ITEMS TERMINATED BY ',' -- Delimitador de elementos de array
MAP KEYS TERMINATED BY '#' -- Delimitador entre clave y valor en el mapa
STORED AS TEXTFILE;

-- Cargar datos desde el archivo data.tsv en la tabla
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE data;

-- Consulta para contar registros por letra de col2 y clave de col3 y guardar resultado en output
-- Consulta para contar registros por letra de col2 y clave de col3 y guardar resultado en output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT
    letra_col2,
    clave_col3,
    COUNT(*) AS cantidad_registros
FROM
    data
LATERAL VIEW explode(col2) lateral_view AS letra_col2
LATERAL VIEW explode(map_keys(col3)) exploded_table AS clave_col3
GROUP BY
    letra_col2,
    clave_col3
ORDER BY
    letra_col2,
    clave_col3;
