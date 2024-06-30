import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3

import sys

def mapper():
    for line in sys.stdin:
        line = line.strip()
        if line:
            fields = line.split(',')
            if len(fields) == 2:
                key = fields[1].strip()
                print(f"{key},{line}")

if __name__ == "__main__":
    mapper()
