# enable headless mode

    soffice --headless

# debug

    soffice --headless --backtrace
    strace -f soffice --headless
    strace -f -o strace.out soffice --headless

# pdf

    soffice --headless --convert-to pdf:writer_pdf_Export <file name>

# links

* http://www.openoffice.org/fr/Documentation/How-to/Basic/command%20parameters.htm
