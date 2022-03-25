# Python Extras

This section explores intermediate level topics in Python that will help us write better IoT applications.

We'll explore:
- __main__ and top-level code environment
- Passing terminal arguments to a script
- Asynchronous programming with `asyncio`

## main & top-level environment

> This section summarizes the official docs: [`__main__`— Top-level code environment](https://docs.python.org/3/library/__main__.html#module-__main__ "__main__: The environment where top-level code is run. Covers command-line interfaces, import-time behavior, and ``__name__ == '__main__'``.") and the Stackoverflow discussion: [What does if __name__ == "__main__": do?](https://stackoverflow.com/questions/419163/what-does-if-name-main-do)


When your script is run by passing it as a command to the Python interpreter:

```python
python myscript.py
```

All of the code that is at indentation level 0 gets executed. This level is called the “top-level” and it imports all other modules that the program needs. The “top-level code” can be considered the _entry point_ to your application.

`__main__` is the name of the environment where top-level code is run.

There is a special built-in variable called `__name__` that is set to the name of the currenly executing module.

However, if a module is being run directly (as in `myscript.py` above), then `__name__` is instead set to the string `"__main__"`.

```python
# myscript.py
print('Variable __name__: ', __name__)
```

```bash
Value of variable __name__: __main__
```

You can test whether your script is being run directly or being imported by something else by testing what `__name__`  evaluates to:

```python
# myscript.py

def main():
	# Start your code

if __name__ == "__main__":
    main()
```


## Passing Script Arguments

It's possible to pass command line arguments to a Python script directly from your shell:

```bash
$ python myscript.py first 2 True
```

The arguments passed are `first`, `2` and `True` . 

### `sys.argv`

The Python `sys` module provides access to these arguments via  `sys.argv`:

- `sys.argv` is a **Python list** of arguments. 

```pyhton
# myscript.py

print(f'Argument List: {sys.argv}')
```

Output:
```bash
$ python myscript.py first 2 True

Argument List: ['myscript.py', 'first', '2', 'True']
```

Notice the following:

- The first element in the list is the name of the script.
- Arguments are available as strings.

Unfortunately, we can't trust that the user will always pass arguments in the correct order and using appropriate data types. We would still need to parse the arguments and make sure they are valid.

Fortunately, there is a built-in module that can help us do that.


### `argparse`

[`argparse`](https://docs.python.org/3.10/library/argparse.html#module-argparse "argparse: Command-line option and argument parsing library.") is a built-in module that  makes it easy to write user-friendly command-line interfaces.

Once the script defines what arguments are required, `argparse` will figure out how to parse those out of [`sys.argv`](https://docs.python.org/3.10/library/sys.html#sys.argv "sys.argv"). The [`argparse`](https://docs.python.org/3.10/library/argparse.html#module-argparse "argparse: Command-line option and argument parsing library.") module also automatically generates help and usage messages, and issues errors when users give the program invalid arguments.

> For a basic tutorial of `argparse`, see [this page](https://docs.python.org/3.10/howto/argparse.html#id1).

In its simplest form, `argparse` must be imported and a parser must be instantiated:

```python
# myscript.py

import argparse
parser = argparse.ArgumentParser()
args = parser.parse_args()
print(args)
```

However, this will generate an error because we must tell argparse what argument flags and what data types to parse.

```bash
$ python myscript.py first 2 True

usage: myscript.py [-h]
myscript.py: error: unrecognized arguments: first 2 True
```

To "teach" `argparse` how to parse an argument we use the command `parser.add_argument()`

```python
# myscript.py
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("word", type=str)
parser.add_argument("number", type=int)
parser.add_argument("toggle", type=bool)

args = parser.parse_args()

print(args)
print(args.word)
print(args.number)
print(args.toggle)
```

```bash
$ python myscript.py first 2 True

Namespace(word='first', number=2, toggle=True)
first
2
True
```

Notice how in the example above, **all arguments were positional**, which makes them  **mandatory**.
In other words, the order in which they are passed determines which variable they were being assigned to.

It's also possible to make arguments optional. In this case, they must be specified with the correct "Flag".


```python
# myscript.py
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("--word", type=str)
parser.add_argument("--number", type=int)
parser.add_argument("--toggle", type=bool)

args = parser.parse_args()

print(args)
print(args.word)
print(args.number)
print(args.toggle)
```

```bash
$ python myscript.py --word first --number 2

Namespace(word='first', number=2, toggle=None)
first
2
None
```

See article [10 tips for passing arguments to Python script](https://www.codeforests.com/2020/10/18/passing-arguments-to-python-script/) for more information.


## `Asyncio`

The library asyncio enables the use of asynchronous programming.

See official API documentation on [Coroutines and Tasks](https://docs.python.org/3/library/asyncio-task.html#asyncio-example-gather) for a great introduction to asyncio.

For an in-depth guide see [Async IO in Python: A Complete Walkthrough](https://realpython.com/async-io-python/) by realpython.com.

The video below also does a great summary:

<iframe width="560" height="315" src="https://www.youtube.com/embed/2IW-ZEui4h4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


