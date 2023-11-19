# Tee

## Read standard input and writes it to the standard output (console) and a dedicated file

#usage 

```bash
tee [OPTION] [FILE]
```

### Examples

```bash
#output matches for <my pattern> and also writes this into the file found_my_pattern_in_my_file.log
cat <my_file> | grep '<my pattern>' | tee found_my_pattern_in_my_file.log
```

```bash
#pass output to another command
cat <my file> | tee <my file backup> | grep '<my pattern>' > <my other file>
```

```bash
#write to multiple files
ls | tee <file name one> <file name two> <...>
```

### Options

| short | long | description |
| --- | --- | --- |
| -a | --append | append to file not overwrite it |
| -i | --ignore-interrupts | ignore interrupt signals |

