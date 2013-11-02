# open files
vim -o #open files in horizontally tiled
vim -O #open files in vertically tiled
vim -p #open files in tabs

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
c #the "change" command (can be combined with "w" or with "c")
C #like "c" but for the whole line
o #"open" a new line below current cursor
O #"open" a new line above current cursor
: #enter command mode
! #enter shell filter mode
