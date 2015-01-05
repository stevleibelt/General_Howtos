# open files

vim -o #open files in horizontally tiled
vim -O #open files in vertically tiled
vim -p #open files in tabs
:split filenam.e #open "filenam.e" in horizontally tiled
:vsplit filenam.e #open "filenam.e" in vertically tiled
ctrl+w l #window left - move to left window
ctrl+w h #window right - move to right window
ctrl+w k #window up - move to up window
ctrl+w j #window down - move to down window
ctrl+w c #close current window
ctrl+w o #close all windows except current
ctrl+w v #duplicate current window

# open directories

o #opens file below cursor horizontally
v #opens file below cursor vertically
i #show more information
s #sort by column under the cursor
r #reverse sort by column under the cursor
D #deletes file
d #creates directory
enter #opens file in current window

# file operation

:e #open/reload a file
:e! #open/reload a file without asking for saving current one
:w #save content in current file
:q #quit current file
:q! #quit current file without asking for saving

# movement

h #left
l #right
j #down
k #up
ctrl+f #one page forward
ctrl+b #one page back

## jumping

gg #jump to the beginning of the file
G #jump to the end/"ground" of the file
0 #jump to the start of the line
$ #jump to the end of the line
w/W #jump to the beginning of the next "word"
b/B #jump "back" to the beginning of the last word
e/E #jump to the "end" of the next word

### code jumping

% #jump to matching brace
] #jump to the end of the paragraph
[ #jump to the start of the paragraph
( #jump to the start of the sentence
) #jump to the end of the sentence
'' #jump to you last edit
]] #move to the next function

# search

/foo #searches for "foo" forward
?foo #searches for "foo" backward
n #jumps to next "foo"
N #jumps to next "foo" the other direction
ta #moves "to" "a"
fa #"findes" "a"
:g/pattern/ #show every line matching the regexp

# help

:help / #shows help for "/"

# content manipulation

i #insert before current cursor position
I #insert at beginning of current line
a #append/insert after current cursor position
A #append/insert at the end of the current line
r #replace character under the cursor
R #replace characters under the cursor until you press ESC
s #substitue the chacatter under the cursor and enter insert mode
d #the "delete" command (can be combined with other or move commands)
D #like "d" but for the whole line
dd #delete current line
c #the "change" command (can be combined with other or move commands)
C #like "c" but for the whole line
cc #change current line
yy #yank current line
x #removes character under cursor
X #removes character before cursor
o #"open" a new line below current cursor
O #"open" a new line above current cursor
: #enter command mode
! #enter shell filter mode
. #repeat previous command
* #move to the next use of the word under your cursor
# #move to the previous use of the word under your cursor

# registers - use :help registers

:registers #presents you all used registers with content inside
"0-"9 #yanked text to numbered register
"a-"z #yanked text replaces current content of register
"A-"Z #yanked text append to the current content of register
" #default register
"+ #system default register
"\* #select/drop register
"\_ #/dev/null

# marking

v #mark character wise
V #mark line wise
ctrl+v #column wise marking
gv #remark last marked area

# completion - available in insert mode

ctrl+n #complete a word (forward through choice list)
ctrl+p #complete a word (backward through choice list)
ctrl+x #counts up number below current cursor

# configuration

:options+enter #shows available options
:browse set #shows all setable options

# advanced help

* create and edit your .vimrc file (in your home directory).
* combine command with movement commands
    * dG #delete content from current cursor to the end of the file
    * ggVG+y #mark the whole document and yank it into default register
    * mark an area and the command "rx" to replace marked area with "x"

# shifting

## command mode

< #shift to the left
> #shift to the right
3>> #shift three lines right

## insert mode

ctrl+t #shift to the left
ctrl+d #shift to the right

# plugins

## vundle

    ```
    mkdir -p .vim/bundle/Vundle.vim
    cd .vim/bundle/Vundle.vim
    git clone https://github.com/gmarik/Vundle.vim.git .
    vim +PluginInstall +qall
    ```
