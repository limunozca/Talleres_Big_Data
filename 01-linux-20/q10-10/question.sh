##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantos registros tiene el archivo 'data.csv'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash
registros=$(wc -l < data.csv)
echo "$registros"