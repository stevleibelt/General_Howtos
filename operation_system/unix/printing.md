# convert/prepare files for printing

    pr $file

# produce $k columns of output

    pr -k $file

# add header

    pr -h "my header" $file

# print a file

    lp or lpr

# use not the default printer

    lpr -d$printername

# print $n copies

    lp -n$numberOfCopies
    lpr -$numberOfCopies
