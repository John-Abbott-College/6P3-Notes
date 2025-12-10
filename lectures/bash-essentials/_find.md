
#### `find`

_This section was adapted from [@PracticalGuideGNU2023]_

Let's begin by looking first at find's general syntax:

`find [STARTING-POINT...] [OPTION...] [EXPRESSION]`

What are these different elements?

| Element               | Description                                                                         | Default           |
| --------------------- | ----------------------------------------------------------------------------------- | ----------------- |
| `[OPTION...]`         | Options are arguments about symlinks and search optimization.                       | None              |
| `[STARTING-POINT...]` | List of directories to search through. The subdirectories are recursively included. | Current directory |
| `[EXPRESSION]`        | List of expressions with their (often required) values.                             | None              |

Nothing is mandatory here: running `find` alone will give you some output.

Here are the different categories of `[EXPRESSION]`. Each of these are queries describing
how to match files, or what action to perform on these files. They’re always prefixed with
a single dash `-` (like `-name` for example).

| Category           | Description                                                                               |
| ------------------ | ----------------------------------------------------------------------------------------- |
| Test expressions   | Most common expressions. They’re used to filtering your files.                            |
| Action expressions | Expressions used to perform an action on each file found.                                 |
| Operators          | Boolean operators to manage the relationships between the different expressions.          |

Let's see an example that demonstrates these categories:

```bash {filename=bash}
find . -name '*.png' -or -perm '664' -delete
```

This will recursively search the current directory for all files that EITHER have a filename ending with
`.png` OR that has the permissions `664`, then will delete those files. (see the course notes on [permissions](/notes/bash-scripting#permissions) for more details on
the meaning of `664` here.)

Let's see what category each of these expressions is:

| Expression          | Category            |
| ------------------- | ------------------- |
| `-name` and `-perm` | Test expressions    |
| `-delete`           | Action expression   |
| `-or`               | Operator expression |

There are, of course, *many* different Test/Action/Operator expressions, and the beauty of
the `find` command is combining each of these types of expressions to create stunningly
efficient file search commands.

I recommend reading/bookmarking the following resources for great explanations and examples of the various uses for the `find` command:

- ["Why is using a shell loop to process text considered bad practice?" on unix.stackexchange](https://unix.stackexchange.com/a/169765)
- ["Why looping over find's output bad practice?" on unix.stackexchange](https://unix.stackexchange.com/questions/321697/why-is-looping-over-finds-output-bad-practice)
