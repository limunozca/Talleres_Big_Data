import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
#!/usr/bin/env python3
import sys

def reducer():
    current_key = None
    current_count = 0

    # Input comes from standard input (stdin)
    for line in sys.stdin:
        line = line.strip()
        if line:
            # Split the line into key and value
            key, value = line.split('\t', 1)
            
            # Convert value to integer
            try:
                count = int(value)
            except ValueError:
                continue
            
            # Aggregate counts for each key
            if current_key == key:
                current_count += count
            else:
                # Output result for previous key
                if current_key:
                    print(f"{current_key}\t{current_count}")
                # Reset for new key
                current_key = key
                current_count = count
    
    # Don't forget to output the last key
    if current_key:
        print(f"{current_key}\t{current_count}")

if __name__ == "__main__":
    reducer()
