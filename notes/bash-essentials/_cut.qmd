
#### `cut`

_The following section was adapted from [@CLITextProcessing]_

By default, cut splits the input content into fields based on the **tab** (`\t`) character. You can
use the `-f` option to select a desired field from each input line. To extract multiple
fields, specify the selections separated by the comma character.

```bash {filename=bash}
# only the second field
$ printf 'apple\tbanana\tcherry\n' | cut -f2
banana

# first and third fields
$ printf 'apple\tbanana\tcherry\n' | cut -f1,3
apple cherry
```

##### Field ranges

You can use the `-` character to specify field ranges. You can skip the starting or ending
range, but not both.

```bash {filename=bash}
# 2nd, 3rd and 4th fields
$ printf 'apple\tbanana\tcherry\tfig\tmango\n' | cut -f2-4
banana cherry fig

# all fields from the start till the 3rd field
$ printf 'apple\tbanana\tcherry\tfig\tmango\n' | cut -f-3
apple banana cherry

# all fields from the 3rd one till the end
$ printf 'apple\tbanana\tcherry\tfig\tmango\n' | cut -f3-
cherry fig mango
```

##### Input Delimiter

Use the `-d` option to change the input delimiter. Only a single byte character is
allowed. By default, the output delimiter will be same as the input delimiter.

```bash {filename=bash}
$ cat scores.csv
Name,Maths,Physics,Chemistry
Ith,100,100,100
Cy,97,98,95
Lin,78,83,80

$ cut -d, -f2,4 scores.csv
Maths,Chemistry
100,100
97,95
78,80

# use quotes if the delimiter is a shell metacharacter
$ echo 'one;two;three;four' | cut -d -f3
cut: option requires an argument -- 'd'
Try 'cut --help' for more information.
-f3: command not found
$ echo 'one;two;three;four' | cut -d';' -f3
three
```

##### Output Delimiter

Use the `--output-delimiter` option to customize the output separator to any string of
your choice. The string is treated literally. Depending on your shell you can use ANSI-C
quoting to allow escape sequences.

```bash {filename=bash}
$ printf 'apple\tbanana\tcherry\n' | cut --output-delimiter=, -f1-
apple,banana,cherry

# example for multicharacter output separator
$ echo 'one;two;three;four' | cut -d';' --output-delimiter=' : ' -f1,3-
one : three : four

# ANSI-C quoting example
# depending on your environment, you can also press Ctrl+v and then the Tab key
$ echo 'one;two;three;four' | cut -d';' --output-delimiter=$'\t' -f1,3-
one three four

# newline as the output field separator
$ echo 'one;two;three;four' | cut -d';' --output-delimiter=$'\n' -f2,4
two
four
```

You can see more examples and explanations here: [@CLITextProcessing].
