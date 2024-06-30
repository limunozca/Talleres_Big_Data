import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/local/bin/python3

import sys

def mapper():
    for line in sys.stdin:
        line = line.strip()
        components = line.split()
        if len(components) == 3:
            date = components[1]
            month = date.split('-')[1]
            print(f"{month}\t1")

if __name__ == "__main__":
    mapper()
