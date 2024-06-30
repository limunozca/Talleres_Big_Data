import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3

import sys

def reducer():
    current_letter = None
    current_numbers = []

    for line in sys.stdin:
        line = line.strip()
        if line:
            letter, number = line.split("\t")
            
            if current_letter is None:
                current_letter = letter
                current_numbers.append(int(number))
            elif letter == current_letter:
                current_numbers.append(int(number))
            else:
                # Emitir la salida para la letra anterior
                sorted_numbers = sorted(current_numbers)
                print(f"{current_letter}\t{','.join(map(str, sorted_numbers))}")
                current_letter = letter
                current_numbers = [int(number)]

    # Asegurarse de emitir la última salida
    if current_letter is not None:
        sorted_numbers = sorted(current_numbers)
        print(f"{current_letter}\t{','.join(map(str, sorted_numbers))}")

if __name__ == "__main__":
    reducer()