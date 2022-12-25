Mark a place in a document to come back to it later.

*Set a mark*
m + any letter without an already attributed shortcut 

*Go to a mark*
' + the letter attributed to the mark

| Command       | Description                                                      |
| ma            | Set a mark at the current cursor location in the "a" mark buffer |
| 'a            | Go back to the of the "a" mark buffer                            |
| d'a           | Delete from current line to mark buffer "a"                      |
| c'a           | Change from current line to mark buffer "a"                      |
| y'a           | Yank from current line to mark buffer "a"                        |
| :marks        | List all current marks                                           |
| :marks ab     | List marks a, b                                                  |
| :delmarks a   | Delete mark buffer "a"                                           |
| :delmarks a-z | Delete all mark buffers between "a" and "z"                      |
| mA            | Set a mark across all documents opened buffers                   |
| 'A            | Go to a buffer set across all opened buffers                     |

