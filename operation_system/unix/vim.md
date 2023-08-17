# VIM

## Open Files

```bash
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
ctrl+w r #move current window to the right
ctrl+w v #duplicate current window
```

## Open Directories

```bash
o #opens file below cursor horizontally
v #opens file below cursor vertically
i #show more information
s #sort by column under the cursor
r #reverse sort by column under the cursor
D #deletes file
d #creates directory
enter #opens file in current window
```

## File Operation

```bash
:e #open/reload a file
:e! #open/reload a file without asking for saving current one
:w #save content in current file
:q #quit current file
:q! #quit current file without asking for saving
:tabNext    #go to the next opened file in the tab
:tabprevious    #go to the previous opened file in the tab
```

## Movement

```bash
h #left
l #right
j #down
k #up
H #highest to the top in the file
M #highest to the middle in the file
L #highest to the bottom in the file
<number>G # move to the <numbered> line in the file
ctrl+f #one page forward
ctrl+b #one page back
```

### Jumping

```bash
gg #jump to the beginning of the file
G #jump to the end/"ground" of the file
0 #jump to the start of the line
$ #jump to the end of the line
w/W #jump to the beginning of the next "word"
b/B #jump "back" to the beginning of the last word
e/E #jump to the "end" of the next word
```

#### Code Jumping

```bash
% #jump to matching brace
] #jump to the end of the paragraph
[ #jump to the start of the paragraph
( #jump to the start of the sentence
) #jump to the end of the sentence
'' #jump to you last edit
]] #move to the next function
```

## Search

```bash
/foo #searches for "foo" forward
?foo #searches for "foo" backward
n #jumps to next "foo"
N #jumps to next "foo" the other direction
ta #moves "to" "a"
fa #"findes" "a" forward
Fa #"findes" "a" backward
% #jumps to the nearest (), [], {}
:g/pattern/ #show every line matching the regexp
```

## Search and Replace

### All occurrences of <search> with <replace> in file

```bash
#%s -   search in all lines
#/g -   replace all in current line
:%s/<search>/<replace>/g
```

### All occurences of <search> with <replace> in current line (case insensitive)

```bash
#/i -   search <search> in case insensitive mode
:s/<search>/<replace>/gi
```

### All occurences of <search> with <replace> in line 13 up to 23

```bash
:13,23s/<search>/<replace>/g
```

### All occurences of <search> with <replace> by visual selected line limit

```bash
:'<,'>s/<search>/<replace>/g
```

### All occurences of <search> with <replace> for the next 7 lines

```bash
:s/<search>/<replace>/g 7
```

### All occurences of whole world of <search> with <replace>

```bash
#disables partial matches
:s/\<<search>\>/replace
```

### Replace multiple <search> terms with <replace>

```bash
#replaces "foo" and "bar" with "foobar"
:s/\(foo|bar\)/foobar/g
```

### Interactive replacement of <search> with <replace>

```bash
#y  -   replace current and goes to next
#n  -   will not replace current and goes to next
#a  -   replace all highlighted words
#l  -   replace current and terminate
:%s/<search>/<replace>/gc
```

## Help

```bash
:help / #shows help for "/"
```

## Content manipulation

```bash
i #insert before current cursor position
I #insert at beginning of current line
a #append/insert after current cursor position
A #append/insert at the end of the current line
r #replace character under the cursor
R #replace characters under the cursor until you press ESC
s #substitue the chacatter under the cursor and enter insert mode
d #the "delete" command (can be combined with other or move commands)
d/<word> #deletes all text between the cursor and the word <word>
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
```

## Registers - use :help registers

```bash
:registers #presents you all used registers with content inside
"0-"9 #yanked text to numbered register
"a-"z #yanked text replaces current content of register
"A-"Z #yanked text append to the current content of register
" #default register
"+ #system default register
"\* #select/drop register
"\_ #/dev/null
```

## Marking

```bash
v #mark character wise
V #mark line wise
ctrl+v #column wise marking
gv #remark last marked area
```

## Completion - available in insert mode

```bash
ctrl+n #complete a word (forward through choice list)
ctrl+p #complete a word (backward through choice list)
ctrl+x #counts up number below current cursor
```

## Configuration

```bash
#get current argument valur
:set <string: argument>?    #it is the ? at the end
:options+enter #shows available options
:browse set #shows all setable options
```

## Advanced help

* create and edit your .vimrc file (in your home directory).
* combine command with movement commands
    * dG #delete content from current cursor to the end of the file
    * ggVG+y #mark the whole document and yank it into default register
    * mark an area and the command "rx" to replace marked area with "x"

## Shifting

### Command mode

```bash
< #shift to the left
> #shift to the right
3>> #shift three lines right
```

### Insert mode

```bash
ctrl+t #shift to the left
ctrl+d #shift to the right
```

## Plugins

### Vundle

```bash
mkdir -p .vim/bundle/Vundle.vim
cd .vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git .
# install all plugins
vim +PluginInstall +qall
# install all bundle
vim +BundleInstall +qall
```

## Vi style key bindings in the bash

```bash
#per session
set -o vi
#always
echo 'set -o vi' >> ~/.bashrc
```

## Solving issues

### Remove unwanted whitespaces

```bash
:%/\s\+$//e
```

## Links

* [A Vim Guide for Advanced Users](https://thevaluable.dev/vim-advanced/) - 20210227
* http://hea-www.harvard.edu/~fine/Tech/vi.html
* http://www.swaroopch.com/notes/vim/
* http://vimcasts.org/
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
* http://www.rosipov.com/blog/using-vim-for-writing-code/
* http://www.howtogeek.com/115051/become-a-vi-master-by-learning-these-30-key-bindings/
* https://www.cs.swarthmore.edu/help/vim/windows.html
* http://www.techrepublic.com/blog/linux-and-open-source/use-tabs-to-open-multiple-files-in-vim/
* http://vim.wikia.com/wiki/Remove_unwanted_spaces
* https://www.cs.swarthmore.edu/help/vim/selection.html
