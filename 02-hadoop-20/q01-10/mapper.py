import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
#!/usr/bin/env python3
import sys

def mapper():
    # Input comes from standard input (stdin)
    for line in sys.stdin:
        line = line.strip()
        if line:
            # Split the line into fields
            fields = line.split(',')
            
            if len(fields) == 21:  # Ensure all expected fields are present
                credit_history = fields[2].strip()
                print(f"{credit_history}\t1")

if __name__ == "__main__":
    mapper()
