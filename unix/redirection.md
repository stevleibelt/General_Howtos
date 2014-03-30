# redirection is the talk abot the three musketeers STDIN (0), STDOUT (1), STDERR (2)
# > - redirect STDIN
## put content from myFile to yourFile (overwrite existing content)

cat myFile > yourFile

# >> - redirect STDIN
## append content from myFile to yourFile

cat myFile >> yourFile

# < - redirect STDOUT
## sort input of myFile by using 'sort' and redirecting content of myFile to sort

sort < myFile

# write content in myFile by using a 'herefile'

cat > myFile << EOC
This is the content i will append to the file 'myFile'.

It is done that way. By using '<<' I am redirecting the STDIN in append mode to cat.
cat itself is redirecting the STDOUT to the file 'myFile'.
EOC

# redirect STDERR to STDOUT to a file

find / -name '*' -print >& ~/findAllWithStdoutAndStderr

# redirect STDERR by using numbered file handlers (not present in all shells)

find / -name '*' -print 2> ~/findAllWithStderr 1> ~/findAllWithStdout

## note: this is the general notation. Meaning when you are using "<" you are using "<0" for real as well as ">" is "1>".
