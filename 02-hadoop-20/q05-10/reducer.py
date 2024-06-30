import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
#!/usr/local/bin/python3

import sys

def reducer():
    current_month = None
    current_count = 0
    
    for line in sys.stdin:
        line = line.strip()
        month, count = line.split('\t', 1)
        count = int(count)
        
        if current_month == month:
            current_count += count
        else:
            if current_month:
                print(f"{current_month}\t{current_count}")
            current_month = month
            current_count = count
    
    # Imprimir el último mes
    if current_month:
        print(f"{current_month}\t{current_count}")

if __name__ == "__main__":
    reducer()
