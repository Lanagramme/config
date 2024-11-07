[Table des matière](../table_of_content.md)

## Movements
**Scroll**
<c-d> scroll down half page
<c-f> scroll down full page
<c-u> scroll up half page
<c-b> scroll up full page

$: end of line
0: beggining of line
w: next word
b: next word backward
:number => got to line number

## Actions
d => Delete
c => Change/cut
y => copY
p => Paste
. => repeat last action
u => undo last action
<C-r> => undo undo last action

s => delete character and enter insert mode 
x => delete chracter

## Modifiers
i: inside
a: around
number: repeat 
t: up To
f: after
/: find
b: backward
$: to end of line
0: backward to beginning of line

## Nouns
l: letter
h: letter backward
w: word
b: word backward
s: sentence
p: paragraph
double (dd, cc, yy): the whole line
t: tag(html/xml)


## exemples
:dw => delete to end of word
:diw => delete the word
:dd => delete line
:db => delete from beggining of word to cursor

cw => change from cursor to end of word
ciw => change word
cl => change letter


yy => copy line
yw => copy word
yl => copy letter

ZQ => quit without saving
ZZ => quit and save

:100 => go to line 100
100j => go up 100 line (works in visual mode also)

:%s => substitution
:%s/wordToSubstitute/wordToPlace/ => substitute first instance in each line
:%s/wordToSubstitute/wordToPlace/g => substitute all instances

:e path/to/file => open file

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

:r![command] paste the output of the terminal command in the current file
:r!date paste the current date and time
!!sh with the cursor overing a terminal command => paste the output of the command in the current file

:sp path/to/file => open file in a horizontal split
:vsp path/to/file => open file in a vertical split

!sort while overing a multiline selection in visual mode => sort selection 
:w path => write current file to path

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

