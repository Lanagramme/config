d => delete

:dw => delete word
:dd => delete line

c => change

:cw => change word
:cl => change letter

ZQ => quit without saving
ZZ => quit and save

:100 => go to line 100
100j => go up 100 line (works in visual mode also)

In .vimrc => K above a command => open help for that command

:yy => copy line
:yw => copy word
:yl => copy letter

:p => paste

:%s => substitution
:%s/wordToSubstitute/wordToPlace/ => substitute for the line 
:%s/wordToSubstitute/wordToPlace/g => substitute for the document

:Ex => vim file manager
:e path/to/file => open file
:gf [while overing a path to a file] => open file

xp swap the characte under the cursor to the following one

<c-o> <c-i> moving backward and forward in modification history

:r![command] paste the output of the terminal command in the current file
:!!date paste the current date and time
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
* while overing a word => search for all occurences of that word in the file and select the next one
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
