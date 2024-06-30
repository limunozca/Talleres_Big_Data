##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es la cantidad maxima de tarjetas que tiene un banco?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

# Variable para almacenar la cantidad máxima de tarjetas
max_tarjetas=0

# Iterar sobre cada línea del archivo demo.csv
while IFS=',' read -r ccn validthru key pin quota; do
    # Extraer los primeros cuatro dígitos del número de tarjeta (CCN) como identificador del banco
    banco=$(echo "$ccn" | cut -d'-' -f1)

    # Contar cuántas veces aparece este banco en el archivo demo.csv
    cantidad_tarjetas=$(grep -c "^${banco}-" demo.csv)

    # Actualizar la cantidad máxima de tarjetas si encontramos un número mayor
    if (( cantidad_tarjetas > max_tarjetas )); then
        max_tarjetas=$cantidad_tarjetas
    fi
done < demo.csv

# Imprimir la cantidad máxima de tarjetas encontrada
echo "$max_tarjetas"