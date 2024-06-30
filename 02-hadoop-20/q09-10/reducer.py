import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3

import sys

def reducer():
    current_lines = []

    for line in sys.stdin:
        line = line.strip()
        if line:
            parts = line.split("\t")
            if len(parts) == 3:
                letter = parts[0]
                date = parts[1]
                value = int(parts[2])

                current_lines.append((letter, date, value))

    # Ordenar por valor (tercera columna) de menor a mayor
    sorted_lines = sorted(current_lines, key=lambda x: x[2])

    # Imprimir los primeros 6 registros
    for item in sorted_lines[:6]:
        print(f"{item[0]}\t{item[1]}\t{item[2]}")

if __name__ == "__main__":
    reducer()
