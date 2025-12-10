
#### `head` and `tail`

_The following section was adapted from [@CLITextProcessing]_

`head` and `tail`, or a combination of both, are used to extract text content that you
know is at the beginning, end, or specific line number of a file.

##### Leading and trailing lines

Consider this sample file, with line numbers prefixed for convenience.

```bash {filename=bash}
$ cat sample.txt
 1) Hello World
 2) 
 3) Hi there
 4) How are you
 5) 
 6) Just do-it
 7) Believe it
 8) 
 9) banana
10) papaya
11) mango
12) 
13) Much ado about nothing
14) He he he
15) Adios amigo
```

By default, `head` and `tail` will display the first and last 10 lines respectively.

```bash {filename=bash}
$ head sample.txt
 1) Hello World
 2) 
 3) Hi there
 4) How are you
 5) 
 6) Just do-it
 7) Believe it
 8) 
 9) banana
10) papaya

$ tail sample.txt
 6) Just do-it
 7) Believe it
 8) 
 9) banana
10) papaya
11) mango
12) 
13) Much ado about nothing
14) He he he
15) Adios amigo
```

Note: If there are less than 10 lines in the input, only those lines will be displayed.

You can use the `-nN` option to customize the number of lines:

```bash {filename=bash}
# first three lines
# space between -n and N is optional
$ head -n3 sample.txt
 1) Hello World
 2) 
 3) Hi there

# last two lines
$ tail -n2 sample.txt
14) He he he
15) Adios amigo
```

##### Excluding N lines

By using a "subtraction" style syntax, like `head -n -N`, you can invert the selection --
that is, get all the input lines EXCEPT the last `-N` lines in the case of `head`, or the
first `-N` lines in the case of `tail`.

```bash {filename=bash}
# except the last 11 lines
$ head -n -11 sample.txt
 1) Hello World
 2) 
 3) Hi there
 4) How are you

# except the first 11 lines
$ tail -n -11 sample.txt
12) 
13) Much ado about nothing
14) He he he
15) Adios amigo
```

You can see more examples and explanation at [@CLITextProcessing].
