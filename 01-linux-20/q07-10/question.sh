##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'validthru' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

file="data.csv"
columna=2

# Extrae el valor del campo 'validthru' para el último registro
dato=$(awk -F',' -v col="$columna" 'NR==30 {print $col}' "$file" | tr -d '"')

echo "$dato"