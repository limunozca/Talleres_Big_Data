##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'ccn' del archivo 'data.csv' para el 
##  registro 10?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

file="data.csv"
row=11
column=1

# Obtener el valor del campo 'ccn' para el registro 10
ccn=$(awk -v r="$row" -v c="$column" 'NR==r {print $c}' FS=',' "$file")

# Eliminar las comillas dobles
ccn=$(echo "$ccn" | tr -d '"')

# Imprimir el resultado
echo "$ccn"