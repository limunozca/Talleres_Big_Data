##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantas tarjetas se vencen en el trimestre Q2 del año?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

# Nombre del archivo temporal de salida
salida="temp"

# Limpiar o crear el archivo de salida
> "$salida"

# Inicializar contador total
contador_total=0

# Expresión regular para buscar el trimestre (Apr, May, Jun) seguido de / y año (dos o cuatro dígitos)
trimestre="(Apr|May|Jun)"

# Iterar sobre todos los archivos .txt en el directorio actual
for archivo in *.txt; do
  # Contar las líneas que coinciden con la expresión regular en el archivo actual
  contador_archivo=$(grep -cE ",\"$trimestre/[0-9]{2,4}\"," "$archivo")

  # Si se encontraron líneas que coinciden, agregarlas al archivo de salida
  if [ "$contador_archivo" -gt 0 ]; then
    grep -E ",\"$trimestre/[0-9]{2,4}\"," "$archivo" >> "$salida"
  fi

  # Incrementar el contador total con el contador del archivo actual
  ((contador_total+=contador_archivo))
done

# Imprimir el contador total de tarjetas que cumplen con el criterio
echo "$contador_total"

# Eliminar el archivo temporal de salida
rm "$salida"