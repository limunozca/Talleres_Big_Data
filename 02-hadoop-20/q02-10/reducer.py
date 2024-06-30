import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
#!/usr/bin/env python3
import sys

def reducer():
    current_purpose = None
    max_amount = 0

    for line in sys.stdin:
        line = line.strip()
        if line:
            purpose, amount = line.split('\t')
            amount = int(amount)
            if current_purpose == purpose:
                if amount > max_amount:
                    max_amount = amount
            else:
                if current_purpose:
                    print(f"{current_purpose}\t{max_amount}")
                current_purpose = purpose
                max_amount = amount

    if current_purpose:
        print(f"{current_purpose}\t{max_amount}")

if __name__ == "__main__":
    reducer()
