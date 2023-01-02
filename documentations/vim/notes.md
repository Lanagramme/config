[Table des matière](../table_of_content.md)

## Movements
**Scroll**
In normal mode
<c-d> scroll down half page
<c-f> scroll down full page
<c-u> scroll up half page
<c-b> scroll up full page

## Actions
d => delete

:dw => delete word
:dd => delete line

d$ || <shift-d> delete from cursor to end of line
d0 => delete from beginning of line to cursor

c => change

cw => change from cursor to end of word
ciw => change word
cl => change letter

s => delete character and enter insert mode 
x => delete chracter

yy => copy line
yw => copy word
yl => copy letter

p => paste

ZQ => quit without saving
ZZ => quit and save

:100 => go to line 100
100j => go up 100 line (works in visual mode also)

In .vimrc => K above a command => open help for that command

:%s => substitution
:%s/wordToSubstitute/wordToPlace/ => substitute for the line 
:%s/wordToSubstitute/wordToPlace/g => substitute for the document

:Ex => vim file manager
:e path/to/file => open file
:gf [while overing a path to a file] => open file

#tabs
:tabedit path/to/file => open file in a new tab
gt => next tab
gT => previous tab
[number]gt => go to tab number [number]

from the command line => nvim -p file file file => open multiple files in tabs

#sessions
:mksession sessionName.vim => save the current session
$ vim -S sessionName.vim => open saved session

______

xp swap the characte under the cursor with the following one

<c-o> <c-i> moving backward and forward in modification history

:r![command] paste the output of the terminal command in the current file
:r!date paste the current date and time
!!sh with the cursor overing a terminal command => paste the output of the command in the current file

:sp path/to/file => open file in a horizontal split
:vs path/to/file => open file in a vertical split

!sort while overing a multiline selection in visual mode => sort selection 
:sav newName.file => save as
:w path => move current file to path

:g/text => find all the lines with the word text
:g/text\word/ => find all lines with the words text and input
:g/^\s*$/d => remofe all blank lines from the document
:noh => remove search highlights
N in search mode => go backward
/Export\+ PATH => search for all occurences of Export PATH
"*" while overing a word => search for all occurences of that word in the file and select the next one
# while overing a word => search for all occurences of that word in the file and select the previous one

% while overing a parenthesis, bracket, etc => go to the corresponding closing character
u => cancyl
<C-r> => redo
<c-n> => autocompletion

v => visual mode, selection by characters 
V => visual mode, selection by lines
<c-v> => visual mode, selection by columns
vi( => visual mode, selection inside parenthesis
vip => visual mode, selection by paragraphs

# indentation (tabulations)
in normal mode => >> indent
	<< unindent
ex: >5j => indent the next five lines

in insert mode => <c-T> => indent
	<c-D> => un indent

in visual block mode
<C-v> + select lines + >

# autocompletion
in insert mode => <c-p> while writing a word
	p => previous maching word
	n => next maching word

# Vim surround

ys you surround
cs change surounnd
ds delete surround

yS surround and create its own line
ySS surround line and create own line

S in visual mode surround highlighted section
gS in visual mode surround highlighted section and delete auto indent

# Add something in the beggining of each line

C-v + select the lines + s-i + esc

# open file which path is under the cursor
gf
