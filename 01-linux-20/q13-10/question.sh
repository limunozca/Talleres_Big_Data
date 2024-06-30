##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es la 'ciudad (estado)' en la posicion 1 del archivo 'person', si el 
##  archivo se organiza alfabeticamente por el campo 'ssn'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

# Nombre del archivo
file="person"

# Ordenar el archivo por el campo 'ssn' y guardar la salida en un archivo temporal
sort -t ',' -k1 "$file" > sorted_person.csv

# Obtener la ciudad y el estado del primer registro del archivo temporal
city_state=$(head -n 1 sorted_person.csv | awk -F ',' '{print $3}')

# Eliminar comillas dobles si existen alrededor del resultado
city_state=$(echo "$city_state" | sed 's/^"\(.*\)"$/\1/')
# Eliminar comillas dobles si existen alrededor del resultado
city_state=$(echo "$city_state" | sed 's/^"\(.*\)"$/\1/')

# Imprimir el resultado
echo "$city_state"
