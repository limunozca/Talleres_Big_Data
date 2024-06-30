import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
#!/usr/bin/env python3

import sys

def reducer():
    lines = []
    for line in sys.stdin:
        line = line.strip()
        if line:
            lines.append(line)
    
    # Ordenamos las líneas por la segunda columna (considerando que el valor es la segunda parte del split)
    lines.sort(key=lambda x: int(x.split(',')[0]))  # Ordenamos por la segunda columna convertida a entero
    
    for line in lines:
        print(line.split(',', 1)[1])  # Imprimimos solo la parte después de la primera coma

if __name__ == "__main__":
    reducer()
