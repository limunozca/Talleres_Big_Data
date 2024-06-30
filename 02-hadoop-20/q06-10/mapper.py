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
            components = line.split()
            if len(components) == 3:
                letter = components[0]
                value = float(components[2])
                print(f"{letter}\t{value}")

if __name__ == "__main__":
    mapper()
