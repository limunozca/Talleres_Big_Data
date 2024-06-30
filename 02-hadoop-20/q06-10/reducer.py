import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/local/bin/python3

import sys

def reducer():
    current_letter = None
    max_value = -float('inf')
    min_value = float('inf')
    
    for line in sys.stdin:
        line = line.strip()
        if line:
            letter, value_str = line.split('\t')
            value = float(value_str)
            
            if current_letter == letter:
                if value > max_value:
                    max_value = value
                if value < min_value:
                    min_value = value
            else:
                if current_letter:
                    print(f"{current_letter}\t{max_value}\t{min_value}")
                current_letter = letter
                max_value = value
                min_value = value
    
    # Imprimir el último grupo
    if current_letter:
        print(f"{current_letter}\t{max_value}\t{min_value}")

if __name__ == "__main__":
    reducer()
