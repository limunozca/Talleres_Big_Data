##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'validthru' del archivo 'data.csv' para 
##  el registro 2?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

file="data.csv"
registro=3

validthru=$(awk -F',' -v row="$registro" 'NR==row {gsub(/"/, "", $2); print $2}' "$file")

echo "$validthru"