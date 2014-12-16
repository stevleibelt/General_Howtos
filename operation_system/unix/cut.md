# simple example

    echo "BrHallo Welt" | cut -c2- # echos "Hallo Welt"

# get part of content with defining differend separator

    #get first snippet from file where separator is ";"
    cat my_file | cut -f 1 -d ";"

# links

* https://en.wikipedia.org/wiki/Cut_(Unix)
* http://www.computerhope.com/unix/ucut.htm
* http://www.folkstalk.com/2012/02/cut-command-in-unix-linux-examples.html
* http://www.thegeekstuff.com/2013/06/cut-command-examples/
* http://linux.101hacks.com/linux-commands/cut-command-examples/
