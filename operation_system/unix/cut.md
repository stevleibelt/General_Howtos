# simple example

    echo "BrHallo Welt" | cut -c2- # echos "Hallo Welt"

# get part of content with defining differend separator

    #get first snippet from file where separator is ";"
    cat my_file | cut -f1 -d=;
