#### `sort`

_The following section was adapted from [@CLITextProcessing]_

The `sort` command provides a wide variety of features. In addition to
[lexicographic](https://en.wikipedia.org/wiki/Lexicographic_order) ordering, it supports
various numerical formats. You can also sort based on particular columns. And there are
nifty features like merging already sorted input, debugging, determining whether the input
is already sorted and so on.

By default, `sort` orders the input in ascending order:

```bash {filename=bash}
$ cat greeting.txt
Hi there
Have a nice day

# extract and sort space separated words
$ <greeting.txt tr ' ' '\n' | sort
a
day
Have
Hi
nice
there
```

##### Dictionary sort

The `-d` option will consider only alphabets, numbers and blanks for sorting. Space and tab characters are considered as blanks, but this would also depend on the locale.

```bash {filename=bash}
$ printf '(banana)\n{cherry}\n[apple]' | LC_ALL=C sort -d
[apple]
(banana)
{cherry}
```

##### Reversed order

The `-r` option will reverse the output order. Note that this doesn't change how sort performs comparisons, only the output is reversed. You'll see an example later where this distinction becomes clearer.

```bash {filename=bash}
$ printf 'peace\nrest\nquiet' | sort -r
rest
quiet
peace
```

##### Numeric sort

The `sort` command provides various options to work with numeric formats. For most cases, the `-n` option is enough. Here's an example:

```bash {filename=bash}
# lexicographic ordering isn't suited for numbers
$ printf '20\n2\n3\n111\n314' | sort
111
2
20
3
314

# -n helps in this case
$ printf '20\n2\n3\n111\n314' | sort -n
2
3
20
111
314
```
