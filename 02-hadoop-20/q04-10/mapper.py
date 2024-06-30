import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3
import sys

def mapper():
    for line in sys.stdin:
        line = line.strip()  # Eliminar espacios en blanco al inicio y al final
        if line:
            fields = line.split()  # Dividir la línea por espacios
            if len(fields) >= 1:
                key = fields[0]  # Primera columna (letra)
                value = 1  # Valor constante para contar
                print(f"{key}\t{value}")  # Emitir clave (letra) y valor (1)

if __name__ == "__main__":
    mapper()
