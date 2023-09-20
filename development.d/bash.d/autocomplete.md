# general

* two built in commands are available and used
    * compgen [option] [word] - generates possible completion matches for [word] fitting to provided [option]
        * options (provided by compgen --help)
            * -W    -   wordlist
            * -G    -   globpattern
            * -F    -   function
            * -C    -   command
            * -P    -   prefix
            * -S    -   suffix
            * ...
        * returns true unless no matches could be generated
    * complete [option] [name] - specifies how arguemts to each [name] should be completed
        * options (provided by complete --help)
            * -W    -   wordlist
            * -G    -   globpattern
            * -F    -   function
            * -C    -   command
            * -P    -   prefix
            * -S    -   suffix
            * -D    -   apply options and actions to default command completion
            * -E    -   apply options and actions to empty line
            * ...
        * if no options are supplied, it specifies how specifications are printed in a reusable way
        * if a function is invoked (-F), COMP_LINE, COMP_POINT, COMP_KEY and COMP_TYPE variables are assigned
        * if a shell function is invoked, COMP_WORDS and COMP_CWORD variables are assigned

# examples

## on your system

*  "/etc/bash_completion.d"
* "/usr/share/bash-completion"

## simple one

    ```
    #define a bash function
    _my_example()
    {
        #boilerplate
        #define current word
        local current=${COMP_WORDS[COM_CWORD]}

        #build / fill up / assigne content to the variable COMPREPLY
        #add an array/collection of words ("foo", "bar", "foobar")
        COMPREPLY=( $(compgen -W "foo bar foobar" -- $current) )
    }

    #link this function to the fitting command/binary
    complete -F _my_example my_example.sh
    ```

# where to add own completion

* put them in "~/.bash_completion"

# links

* http://bash-completion.alioth.debian.org/
* https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion.html#Programmable-Completion
* https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#Programmable-Completion-Builtins
* http://www.caliban.org/bash/ 
* http://www.thegeekstuff.com/2013/12/bash-completion-complete/
* http://buddylindsey.com/quick-and-dirty-write-your-own-bash-autocomplete/
* http://www.linuxquestions.org/questions/linux-software-2/how-to-get-tab-auto-complete-in-bash-to-scroll-through-all-possible-choices-755624/
* http://blog.droidzone.in/2013/03/10/add-bash-autocompletion-for-your-own-script/
* https://wiki.archlinux.org/index.php/Bash#Tab_completion
* https://en.wikipedia.org/wiki/Command-line_completion
* http://akrabat.com/php/autocomplete-phing-targets-on-the-command-line/
* https://opensource.com/article/18/3/creating-bash-completion-script
