# Python Projects & Import Statements

For programmers coming from other languages, how to organize your project files and how to import modules and classes can be confusing.

## Modules vs Packages

Let's clarify the terminology and distinction between a module vs a package.

*(Notes taken from [The Joy of Packaging, Making a Python Package](https://python-packaging-tutorial.readthedocs.io/en/2018/setup_py.html))*

### Modules

A module usually corresponds to a single file: `something.py`
A python “module” is a single namespace, with a collection of values:

-   functions
-   constants
-   class definitions

### Packages

A “package” is essentially a module, except it can have other modules (and indeed other packages) inside it.

A package usually corresponds to a directory with a file in it called `__init__.py` and any number of python files or **other package directories**:

```sh
a_package
	__init__.py
	module_a.py
	a_sub_package
		__init__.py
	module_b.py
```

`__init__.py` can be empty or it can have arbitrary code.

The code will be run when the package is imported (just like a module).

Modules inside packages are not automatically imported. So, with the above structure:

```sh
import a_package
```

will run the code in `a_package/__init__.py`

Any names defined in the `__init__.py` will be available in: `a_package.a_name`


## Project Structure

There's no single way to do it. Below is a recommendation from RealPython.com on Python Application Layouts for [Application with Internal Packages](https://realpython.com/python-application-layouts/#application-with-internal-packages):

```sh
helloworld/
│
├── docs/
│   ├── hello.md
│   └── world.md
│
├── helloworld/
│   ├── __init__.py
│   ├── main_entry.py
│   ├── hello/
│   │   ├── __init__.py
│   │   ├── hello.py
│   │   └── helpers.py
│   │
│   └── world/
│       ├── __init__.py
│       ├── helpers.py
│       └── world.py
│
├── data/
│   ├── input.csv
│   └── output.xlsx
│
├── tests/
│   ├── hello
│   │   ├── helpers_tests.py
│   │   └── hello_tests.py
│   │
│   └── world/
│       ├── helpers_tests.py
│       └── world_tests.py
│
├── .gitignore
├── LICENSE
└── README.md
```


## Relative Import Statements

*(Taken from StackOverflow discussion [Relative imports in Python 3](https://stackoverflow.com/questions/16981921/relative-imports-in-python-3),  by [Aya](https://stackoverflow.com/users/172176/aya))*

Consider the project layout below:

```python
main.py
mypackage/
    __init__.py
    mymodule.py
    myothermodule.py
```

In `mymodule.py` :

```python
# Exported function
def get_temperature():
    return 23.45

if __name__ == '__main__':
    print(get_temperature())
```

In `myothermodule.py` :

```python
from .mymodule import get_temperature

# Exported function
def announce_weather():
    return f"Outside temperature is {get_temperature()}"

if __name__ == '__main__':
    announce_weather()
```

In `main.py` :

```python
from mypackage.myothermodule import announce_weather

def main():
    print(announce_weather())

if __name__ == '__main__':
    main()
```

This works when running  `main.py` or `mypackage/mymodule.py`, but fails with `mypackage/myothermodule.py`, due to the relative import:

```python
from .mymodule import as_int
```

```
Exception has occurred: ImportError
attempted relative import with no known parent package
```


**Solution**

When running `myothermodule.py` as a stand-alone script, run Python using the `-m` option to run the file as a module.
This will execute all the `__init__.py` files and load the module dependency.

```python
python3 -m mypackage.myothermodule
```



## References

**More on Modules and Packages:**
- [Python Modules and Packages – An Introduction](https://realpython.com/python-modules-packages/) by RealPython.com

**Project Structures**
- [Packaging a python library](https://blog.ionelmc.ro/2014/05/25/python-packaging/) by ionel's codelog.

**Relative Imports**
- [Relative imports for the billionth time](https://stackoverflow.com/questions/14132789/relative-imports-for-the-billionth-time/14132912#14132912) in StackOverlow
- [Relative imports in Python 3](https://stackoverflow.com/questions/16981921/relative-imports-in-python-3) in StackOverlow
- [The import system](https://docs.python.org/3/reference/import.html#package-relative-imports) in Python.org docs.
- [Modules: Packages](https://docs.python.org/3/tutorial/modules.html#packages) in Python.org docs.

