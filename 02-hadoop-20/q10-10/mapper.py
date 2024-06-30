import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3

import sys

def mapper():
    for line_number, line in enumerate(sys.stdin):
        line = line.strip()
        if line:
            parts = line.split('\t')
            if len(parts) == 2:
                letters = parts[1].split(',')
                for letter in letters:
                    print(f"{letter}\t{line_number}")

if __name__ == "__main__":
    mapper()
