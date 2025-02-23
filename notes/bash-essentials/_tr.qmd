
#### `tr`

_The following section was adapted from [@CLITextProcessing]_

`tr` helps you to map one set of characters to another set of characters. Features like
range, repeats, character sets, squeeze, complement, etc makes it a must know text
processing tool.

Here are some examples that map one set of characters to another. As a good practice,
always enclose the sets in single quotes to avoid issues due to shell metacharacters.

```bash {filename=bash}
# 'l' maps to '1', 'e' to '3', 't' to '7' and 's' to '5'
$ echo 'leet speak' | tr 'lets' '1375'
1337 5p3ak

# example with shell metacharacters
$ echo 'apple;banana;cherry' | tr
:
tr: missing operand
Try 'tr --help' for more information.
$ echo 'apple;banana;cherry' | tr ';' ':'
apple:banana:cherry
```

##### Character ranges

You can use `-` between two characters to construct a range (ascending order only).

```bash {filename=bash}
# uppercase to lowercase
$ echo 'HELLO WORLD' | tr 'A-Z' 'a-z'
hello world

# swap case
$ echo 'Hello World' | tr 'a-zA-Z' 'A-Za-z'
hELLO wORLD

# rot13
$ echo 'Hello World' | tr 'a-zA-Z' 'n-za-mN-ZA-M'
Uryyb Jbeyq
$ echo 'Uryyb Jbeyq' | tr 'a-zA-Z' 'n-za-mN-ZA-M'
Hello World
```

##### Deleting characters

Use the `-d` option to specify a set of characters to be deleted.

$ echo '2024-08-12' | tr -d '-'
```bash {filename=bash}
20240812

# delete all punctuation characters
$ s='"Hi", there! How *are* you? All fine here.'
$ echo "$s" | tr -d '[:punct:]'
Hi there How are you All fine here
```

##### Squeezing characters

The `-s` option changes consecutive repeated characters to a single copy of that character.

```bash {filename=bash}
$ echo 'HELLO... hhoowwww aaaaaareeeeee yyouuuu!!' | tr -s 'a-z'
HELLO... how are you!!

# translate and squeeze
$ echo 'hhoowwww aaaaaareeeeee yyouuuu!!' | tr -s 'a-z' 'A-Z'
HOW ARE YOU!!

# delete and squeeze
$ echo 'hhoowwww aaaaaareeeeee yyouuuu!!' | tr -sd '!' 'a-z'
how are you

# squeeze other than lowercase alphabets
$ echo 'apple    noon     banana!!!!!' | tr -cs 'a-z'
apple noon banana!
```

You can see more examples and explanations here: [@CLITextProcessing].
