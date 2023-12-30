import sys
import json

def read_ms_values(filename):
    """Reads all properties ending in '_ms' from the given file."""
    values = {}
    with open(filename, 'r') as file:
        data = json.load(file)
    return {k: v for k, v in data.items() if k.endswith('_ms')}

def calculate_percent_change(original_value, new_value):
    """Calculates the percent change from the original value to the new value."""
    return ((new_value - original_value) / original_value) * 100

def main():
    if len(sys.argv) != 3:
        print("Usage: python calc_change.py <file_a.json> <file_b.json>")
        sys.exit(1)

    file_a, file_b, = sys.argv[1], sys.argv[2]

    try:
        values_a = read_ms_values(file_a)
        values_b = read_ms_values(file_b)
        changes = {}

        for key in values_a:
            if key in values_b:
                percent_change = calculate_percent_change(values_a[key], values_b[key])
                changes[key] = f"{'+-'[percent_change < 0]}{abs(percent_change):.2f}% ({values_a[key]} -> {values_b[key]})"

        print(json.dumps(changes, indent=2))
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()