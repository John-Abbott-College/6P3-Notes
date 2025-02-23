
#### `uniq`

_The following section was adapted from [@CLITextProcessing]_

The `uniq` command identifies similar lines that are adjacent to each other. There are various options to help you filter unique or duplicate lines, count them, group them, etc.

##### Retain single copy of duplicates

This is the default behavior of the `uniq` command. If adjacent lines are the same, only the first copy will be displayed in the output.

```bash {filename=bash}
# only the adjacent lines are compared to determine duplicates
# which is why you get 'red' twice in the output for this input
$ printf 'red\nred\nred\ngreen\nred\nblue\nblue' | uniq
red
green
red
blue
```

You'll need sorted input to make sure all the input lines are considered to determine duplicates. For some cases, sort -u is enough, like the example shown below:

```bash {filename=bash}
# same as sort -u for this case
$ printf 'red\nred\nred\ngreen\nred\nblue\nblue' | sort | uniq
blue
green
red
```

Sometimes though, you may need to sort based on some specific criteria and then identify duplicates based on the entire line contents. Here's an example:

```bash {filename=bash}
# can't use sort -n -u here
$ printf '2 balls\n13 pens\n2 pins\n13 pens\n' | sort -n | uniq
2 balls
2 pins
13 pens
```

##### Duplicates only

The `-d` option will display only the duplicate entries. That is, only if a line is seen more than once.

```bash {filename=bash}
$ cat purchases.txt
coffee
tea
washing powder
coffee
toothpaste
tea
soap
tea

$ sort purchases.txt | uniq -d
coffee
tea
```

To display all the copies of duplicates, use the `-D` option.

```bash {filename=bash}
$ sort purchases.txt | uniq -D
coffee
coffee
tea
tea
tea
```

##### Unique only

The `-u` option will display only the unique entries. That is, only if a line doesn't occur more than once.

```bash {filename=bash}
$ sort purchases.txt | uniq -u
soap
toothpaste
washing powder

# reminder that uniq works based on adjacent lines only
$ printf 'red\nred\nred\ngreen\nred\nblue\nblue' | uniq -u
green
red
```

You can see more examples and explanations here: [@CLITextProcessing].
