# Find

## Find Files By User foo Or bar

find /my/path \( -user foo -o -user bar \) -ls

## Find Files By User foo And Not In Group bar

find /my/path -user foo -not -group bar -ls

## Find Files By User foo And By Size Of Greater Then One MB

find /my/path -user foo -and -size +1M -ls

# Using Locate

## Updates Locate Database

updatedb

## Finds Filename

locate filename
