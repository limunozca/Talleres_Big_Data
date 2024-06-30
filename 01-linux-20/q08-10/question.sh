##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'quota' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
file="data.csv"
columna=5

# Extrae el valor del campo 'quota' para el último registro
dato=$(awk -F',' -v col="$columna" 'NR==30 {print $col}' "$file" | tr -d '"')

echo "$dato"