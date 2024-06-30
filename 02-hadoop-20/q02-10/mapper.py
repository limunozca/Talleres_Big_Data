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
            if len(fields) == 21:
                purpose = fields[3].strip()
                amount = int(fields[4])
                print(f"{purpose}\t{amount}")

if __name__ == "__main__":
    mapper()
