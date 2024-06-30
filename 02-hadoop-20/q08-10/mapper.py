import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/local/bin/python3

import sys

def mapper():
    for line in sys.stdin:
        line = line.strip()
        if line:
            parts = line.split()
            if len(parts) == 3:
                letter = parts[0]
                value = float(parts[2])  # Convertir el valor a flotante
                # Emitir la letra como clave y una tupla (valor, 1) como valor
                print(f"{letter}\t{value}\t1")

if __name__ == "__main__":
    mapper()

