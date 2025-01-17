##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantas veces aparece el número 1192 en el segundo grupo de digitos de las 
##  tarjetas de  credito?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash
contador_total=0
digitos="1192"
for archivo in *.txt; do
    contador_archivo=$(grep -Eo "([0-9]{4})\-$digitos\-[0-9]{4}-" "$archivo" | wc -l)
  ((contador_total+=contador_archivo))
done
echo "$contador_total"