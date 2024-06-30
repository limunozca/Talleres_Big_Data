##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'ccn' del archivo 'data.csv' para el primer 
##  registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

file="data.csv"

# Leer la primera línea del archivo para obtener el encabezado y los datos del primer registro
line=$(head -n 2 "$file" | tail -n 1)

# Extraer el valor del campo 'ccn' del primer registro
ccn=$(echo "$line" | awk -F',' '{gsub(/"/, "", $1); print $1}')

echo "$ccn"