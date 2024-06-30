import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3

import sys

def mapper():
    for line in sys.stdin:
        line = line.strip()
        if line:
            parts = line.split()
            if len(parts) == 3:
                letter = parts[0]
                date = parts[1]
                value = parts[2]
                # Emitir letra como clave y fecha + valor como valor
                print(f"{letter}\t{date}\t{value}")

if __name__ == "__main__":
    mapper()
