##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'key' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
file="data.csv"
columna=1
dato=$(awk -F',' -v col="$columna" 'END {print $col}' "$file" | tr -d '"')
echo "$dato"
