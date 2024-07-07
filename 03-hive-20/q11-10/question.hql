-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne la primera columna, la cantidad de 
-- elementos en la columna 2 y la cantidad de elementos en la columna 3
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

-- Consulta para contar elementos y guardar resultado en output
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT
    col1,
    size(col2) AS cantidad_col2,
    size(map_keys(col3)) AS cantidad_col3
FROM
    data;


