# seq - create and print sequence of numbers

## Usage / Examples

```bash
# General
# seq <int: start>
# seq <int: start> <int: end>
# seq <int: start> <int: step_size> <int: end>

# Count up from 1 to x
# Will output 1 2 3 4 5 6 7
seq 7

# Count up from x to y
# Will output 3 4 5
seq 3 5

# Count up from x to y with the step size of z
# Will output 1 4 7
seq 1 3 9

# Print numbers with same width (leading zero)
seq -w 100

# Print numbers in one line with seperator
seq -s"," 5
# simple calculations by passing it into calc
seq -s+ 2 2 10

# Use printf specific format
seq -f "Version Number %.2f" 5

# Create files with seq

touch $(seq -f "file_name%g" 3)
# Also works for removing files
rm $(seq -f "file_name%g" 3)

# Use it in a for loop
for I in $(seq 1 10); do echo "${I}"; done
```

## Links

* [Seq Command - Print a Sequence of Numbers](https://www.putorius.net/seq-command-linux.html) - 2020-05-18
