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
            print(line)

if __name__ == "__main__":
    mapper()
