##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantos registros hay en el archivo 'person' para city = 'New York (New York)'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
#!/bin/bash

contador=$(grep -c 'New York (New York)' person)
echo "$contador"