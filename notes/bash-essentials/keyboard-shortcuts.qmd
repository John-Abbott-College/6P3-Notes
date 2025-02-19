_This section was adapted from [@BashKeyboardShortcuts]._

#### Completions

Use `TAB` completion for file/directory names. Type just enough characters to uniquely
identify the item.

For example, to move to a directory `sample1`; Type `cd sam`. Then press `TAB` and
`ENTER`.

#### Moving the cursor

- `Ctrl+a`: Go to the beginning of the line (Home).
- `Ctrl+e`: Go to the End of the line (End).
- `Ctrl+p`: Previous command (Up arrow).
- `Ctrl+n`: Next command (Down arrow).
- `Alt+b`: Back (left) one word.
- `Alt+f`: Forward (right) one word.
- `Ctrl+f`: Forward one character.
- `Ctrl+b`: Backward one character.

#### While using `man` or `command --help | less`

- `k`: Scroll up one line
- `j`: Scroll down one line
- `Ctrl+u`: Page up
- `Ctrl+d`: Page down
- `/`: Begin forward search
- `?`: Begin reverse search
- `n`/`N`: Find next/previous match
- `q`: close the `less` pager

#### Editing

- `Ctrl+L`: Clear the Screen, similar to the clear command.
- `Alt+Del`: Delete the Word before the cursor.
- `Alt+d`: Delete the Word after the cursor.
- `Ctrl+d`: Delete character under the cursor.
- `Ctrl+h`: Delete character before the cursor (Backspace).
- `Ctrl+w`: Cut the Word before the cursor to the clipboard.
- `Ctrl+k`: Cut the Line after the cursor to the clipboard.
- `Ctrl+u`: Cut/delete the Line before the cursor to the clipboard.
- `Alt+t`: Swap current word with previous.
- `Ctrl+t`: Swap the last two characters before the cursor (typo).
- `ctrl+y`: Paste the last thing to be cut (yank).
- `Alt+u`: UPPER capitalize every character from the cursor to the end of the current
    word.
- `Alt+l`: Lower the case of every character from the cursor to the end of the current
    word.
- `Alt+c`: Capitalize the character under the cursor and move to the end of the word.
- `Alt+r`: Cancel the changes and put back the line as it was in the history (revert).
- `ctrl+_`: Undo.

#### Special keys

- `Ctrl+v` tells the terminal to not interpret the following character
    - so `Ctrl+v` `TAB` will display a tab character rather than attempting completion.
    - similarly `Ctrl+v` `ENTER` will display the escape sequence for the Enter key: `^M`

#### History

- `Ctrl+r`: Recall the last command including the specified character(s).
- `Ctrl+p`: Previous command in history (walk back).
- `Ctrl+n`: Next command in history (walk forward).
- `Ctrl+o`: Execute the command found via `Ctrl+r` or `Ctrl+s` `Ctrl+o`
- `Ctrl+g`: Escape from history searching mode.

#### Process Control

- `Ctrl+c`: Interrupt/Kill whatever you are running (SIGINT).
- `Ctrl+l`: Clear the screen.
- `Ctrl+s`: Stop output to the screen (for long running verbose commands). Then use
    PgUp/PgDn for navigation.
- `Ctrl+q`: Allow output to the screen (if previously stopped using command above).
- `Ctrl+d`: Send an EOF marker, unless disabled by an option, this will close the current
    shell (EXIT).
- `Ctrl+z`: Send the signal SIGTSTP to the current task, which suspends it. To return to
    it later enter `fg 'process name'`
