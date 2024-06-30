import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/local/bin/python3

import sys

def get_sort_key(letter, value):
    # Función para obtener la clave de ordenamiento dependiendo de la letra y el valor
    if letter == 'E':
        # Para la letra E, usamos los primeros dos dígitos como entero
        if '.' in value:
            return int(value.split('.')[0][:2])
        else:
            return int(value[:2])
    else:
        # Para las otras letras, usamos el valor completo como entero
        if '.' in value:
            return float(value)
        else:
            return int(value)

def reducer():
    current_letter = None
    lines = []

    for line in sys.stdin:
        line = line.strip()
        if line:
            parts = line.split()
            letter = parts[0]
            date = parts[1]
            value = parts[2]
            
            # Obtener la clave de ordenamiento adecuada según la letra y el valor
            sort_key = get_sort_key(letter, value)
            
            if current_letter is None:
                current_letter = letter
            
            if letter != current_letter:
                # Ordenar las líneas por la clave de ordenamiento obtenida
                sorted_lines = sorted(lines, key=lambda x: get_sort_key(x.split()[0], x.split()[2]))
                for sorted_line in sorted_lines:
                    print(sorted_line)
                lines = []
                current_letter = letter
            
            lines.append(f"{letter}\t{date}\t{value}")
    
    if lines:
        # Ordenar las líneas por la clave de ordenamiento obtenida
        sorted_lines = sorted(lines, key=lambda x: get_sort_key(x.split()[0], x.split()[2]))
        for sorted_line in sorted_lines:
            print(sorted_line)

if __name__ == "__main__":
    reducer()
