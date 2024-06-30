import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/local/bin/python3

import sys

def reducer():
    current_letter = None
    total_sum = 0.0
    count = 0
    
    for line in sys.stdin:
        line = line.strip()
        if line:
            parts = line.split('\t')
            if len(parts) == 3:
                letter = parts[0]
                value = float(parts[1])
                increment = int(parts[2])
                
                if current_letter is None:
                    current_letter = letter
                
                if letter != current_letter:
                    # Calcular el promedio y emitir resultado para la letra anterior
                    if count > 0:
                        average = total_sum / count
                        print(f"{current_letter}\t{total_sum}\t{average}")
                    
                    # Reiniciar para la nueva letra
                    current_letter = letter
                    total_sum = 0.0
                    count = 0
                
                # Acumular suma y contar ocurrencias
                total_sum += value * increment
                count += increment
    
    # Imprimir el resultado para la última letra
    if current_letter is not None:
        if count > 0:
            average = total_sum / count
            print(f"{current_letter}\t{total_sum}\t{average}")

if __name__ == "__main__":
    reducer()