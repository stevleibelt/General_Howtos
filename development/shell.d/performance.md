# file handling

Keep in mind that each echo into a file needs to opens a file, puts content into it and close filehandler.
Most times, it is better to collect the content and write it once into a file (or do it in chunks).

    while [ $foo -lt 1 ]
    do
            echo "example text for bad performance" >> $FILE
            foo=$foo-1
    done

    while [ $foo -lt 1 ]
    do
            echo "example text for better performance"
            foo=$foo-1
    done > $FILE

# loops

Call only whats needed inside a loop. 
Nothing changes/harmse the "calculate date" command? Move it outside of the loop.

# pipes

Need a lot of piped commands to reach your goal? Try to search for an easier aproach.

# internal command instead of process calls

Try to use shell internal commands as often as needed. For external commands, the shell needs to create a new subprocess for each call.

# avoid usless call of commands

As mention before, a external process costs resources. Try to use them only as needed. Try to avoid cat is a good start.

# prevent sed/awk for parsing the entire file if not needed

    sed -n '1,2p' file  #reads each line but prints only line one and two
    sed '2q'    #prints the first two lines and the quits

# use and or or condition wisely

Put the condition with the highes chance of failure (returning false) at the beginning of the and condition.
Put the condition with the lowest chance of failure (returning true) at the beginning of the or condition.


# links

* http://www.theunixschool.com/2012/06/10-tips-to-improve-performance-of-shell.html
