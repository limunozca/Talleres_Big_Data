import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
#!/usr/bin/env python3
import sys

def reducer():
    current_key = None
    current_count = 0

    # Leer la entrada estándar línea por línea
    for line in sys.stdin:
        line = line.strip()  # Eliminar espacios en blanco al inicio y al final
        if line:
            key, value = line.split('\t', 1)  # Dividir la línea por la primera aparición de tabulador
            if current_key and current_key != key:
                # Se ha cambiado de clave, imprimir el resultado anterior
                print(f"{current_key},{current_count}")
                current_count = 0
            # Actualizar la clave actual y aumentar el contador
            current_key = key
            current_count += int(value)

    # Imprimir el último resultado
    if current_key:
        print(f"{current_key},{current_count}")

if __name__ == "__main__":
    reducer()
