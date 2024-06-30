##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es la 'ciudad (estado)' en la posicion 2 del archivo 'person', si el 
##  archivo se organiza alfabeticamente por el campo 'ssn'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

# Nombre del archivo
file="person"

# Ordenar el archivo por el campo 'ssn' y obtener la ciudad (estado) del segundo registro
city=$(LC_ALL=C sort -t',' -k1,1 "$file" | awk -F',' 'NR==2 {print $3}')

# Eliminar las comillas dobles de la salida si existen
city="${city//\"/}"

# Imprimir la ciudad (estado) exactamente como se espera
echo "$city"
