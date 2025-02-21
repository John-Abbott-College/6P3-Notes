
_This section was adapted from [@IllustratedRedirectionTutorial2023]_

### Output Redirection `n> file`

`>` is probably the simplest redirection.

`echo foo > file`

the `>` file after the command alters the file descriptors belonging to the command echo.
It changes the file descriptor 1 (> file is the same as 1>file) so that it points to the
file file. They will look like:

```
                  ---       +-----------------------+
standard input   ( 0 ) ---->| /dev/pts/5            |
                  ---       +-----------------------+

                  ---       +-----------------------+
standard output  ( 1 ) ---->| file                  |
                  ---       +-----------------------+

                  ---       +-----------------------+
standard error   ( 2 ) ---->| /dev/pts/5            |
                  ---       +-----------------------+
```

Now characters written by our command, echo, that are sent to the standard output, i.e.,
the file descriptor 1, end up in the file named file.

In the same way, `command 2> file` will change the standard error and will make it point
to file. For example, `command 2> /dev/null` will *delete* all errors outputted by
`command`:

```
                  ---       +-----------------------+
standard input   ( 0 ) ---->| /dev/pts/5            |
                  ---       +-----------------------+

                  ---       +-----------------------+
standard output  ( 1 ) ---->| /dev/pts/5            |
                  ---       +-----------------------+

                  ---       +-----------------------+
standard error   ( 2 ) ---->| /dev/null             |
                  ---       +-----------------------+
```

### Input Redirection `n< file`

When you run a command using `command < file`, it changes the file descriptor `0` so that it
looks like:

```
                  ---       +-----------------------+
standard input   ( 0 ) <----| file                  |
                  ---       +-----------------------+

                  ---       +-----------------------+
standard output  ( 1 ) ---->| /dev/pts/5            |
                  ---       +-----------------------+

                  ---       +-----------------------+
standard error   ( 2 ) ---->| /dev/pts/5            |
                  ---       +-----------------------+
```

If the command reads from stdin, it now will read from file and not from the console.

### Pipes `|`

What does this `|` do? Among other things, it connects the standard output of the command on
the left to the standard input of the command on the right. That is, it creates a special
file, a pipe, which is opened as a write destination for the left command, and as a read
source for the right command.

```
command:   echo foo               |                cat

 ---       +--------------+               ---       +--------------+
( 0 ) ---->| /dev/pts/5   |     ------>  ( 0 ) ---->|pipe (read)   |
 ---       +--------------+    /          ---       +--------------+
                              /
 ---       +--------------+  /            ---       +--------------+
( 1 ) ---->| pipe (write) | /            ( 1 ) ---->| /dev/pts     |
 ---       +--------------+               ---       +--------------+

 ---       +--------------+               ---       +--------------+
( 2 ) ---->| /dev/pts/5   |              ( 2 ) ---->| /dev/pts/    |
 ---       +--------------+               ---       +--------------+
```

This is possible because the redirections are set up by the shell before the commands are
executed, and the commands inherit the file descriptors.
