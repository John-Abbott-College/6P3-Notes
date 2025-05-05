---
title: "Python project management"
subtitle: >
  Python modules and packages.
  Python project file structure.
  Managing project dependencies.
  Configuring python project metadata.
  requirements.txt and pyproject.toml.
  Configuring python linters and formatters.
date: 2025-04-04
toc-expand: 2
categories: ["python"]
bibliography: references.bib
nocite: |-
  @*
---

## Overview

Now that we're making larger applications with multiple dependecies from
different sources, as well as multiple modules, code organization starts to be a
noticable problem. Managing a "project" (for now, a directory containing your
source code for a given task) becomes much easier with tools and configuration.

We'll look at:

- Import statements
- Relative imports
- Configuration of python projects

## Modules vs Packages

*Notes adapted from [@MakingPythonPackage]*

For programmers coming from other languages, how to organize your project files
and how to import modules and classes can be confusing.

Let's clarify the terminology and distinction between a module vs a package.

### Modules

A module usually corresponds to a single file: `something.py` A python "module"
is a single namespace, with a collection of values:

- functions
- constants
- class definitions

### Packages

A “package” is essentially a module, except it can have other modules (and
indeed other packages) inside it.

A package usually corresponds to a directory with a file in it called
`__init__.py` and any number of python files or **other package directories**:

```shell
a_package
	__init__.py
	module_a.py
	a_sub_package/
		__init__.py
	module_b.py
```

`__init__.py` can be empty or it can have arbitrary code.

The code will be run when the package is imported (just like a module).

Modules inside packages are not automatically imported. So, with the above
structure:

```sh
import a_package
```

will run the code in `a_package/__init__.py`

Any names defined in the `__init__.py` will be available in: `a_package.a_name`

## Project file structure

There are two conventions for structuring a python project: **flat** layout and **src** layout.

Flat layout is a bit more intuitive, and most small projects use it.
Src layout has a lot of benefits for larger projects.
The two are compared below.

::: {.panel-tabset}

## flat layout

*example adapted from [@SrcLayoutVsa]*

```sh {filename="example flat layout"}
.
├── .gitignore
├── README.md
├── pyproject.toml
├── some_package/
│   ├── __init__.py
│   └── module.py
└── tools/
    └── some_python_script.py
# More directories can be added; tests, data, utilities, etc.
```

The "flat layout" refers to organising a project’s files in a folder or repository,
such that the various configuration files and import packages are all in the top-level directory.

## src layout

*example adapted from [@SrcLayoutVsa]*

```sh {filename="example src layout"}
.
├── .gitignore
├── README.md
├── pyproject.toml
├── src/
│    └── some_package/
│       ├── __init__.py
│       └── module.py
└── tools/
    └── some_python_script.py
# More directories can be added; tests, data, utilities, etc.
```

The "src layout" deviates from the flat layout by moving the code that is intended to be importable
(i.e. `import some_package`, also known as import packages) into a subdirectory.
This subdirectory is typically named `src/`, hence "src layout".

:::

## Project configuration

This section explains configuring the following in a python project:

- **dependencies** through `requirements.txt`
- **linting/formatting** through dotfiles like `ruff.toml`
- **all of the above** with `pyproject.toml`

### Dependencies with `requirements.txt`

Project dependencies can be listed in a file for portability. By convention, the file
[`requirements.txt`](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
contains all the dependencies of a project created with a
[virtual environment](/notes/python-package-management/#how-virtual-environments-solve-the-pip-problem).

> This is analogous to `package.json` for Node.Js projects

**To generate** a `requirements.txt` for an existing project:

```shell
$ pip freeze > requirements.txt
```

**To install** packages from a `requirements.txt`:

```
$ pip install -r requirements.txt
```

The content of a `requirements.txt` file is a list of arguments that can be provided to the `pip install` command.
Any syntax that is valid for `pip install` is valid for the `requirements.txt` file:

```python {filename=sample-requirements.txt}
# Install the latest version of gpiozero published on pypi.org
gpiozero

# You can pin the dependency to a specific version published on pypi.org
# This is a good practise to make sure your project doesn't stop working when
# breaking changes are introduced to the package you're depending on.
gpiod==2.3.0

# Some packages aren't kept up to date on pypi.org, but can be installed from git directly
git+https://github.com/Seeed-Studio/Seeed_Python_RPi

# You can have requirements files automatically install the dependencies of other requirements files
# This is a nice way to separate requirements for different purposes.
# Note the `-r` flag to *recursively* install packages listed in the file.
-r other-requirements.txt
```

See [Requirements File Format from the pip documentation](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
for more details.

### Formatting/linting with [ruff](https://docs.astral.sh/ruff/)

There are many [formatters](https://realpython.com/python-code-quality/#code-formatters) and [linters](https://realpython.com/python-code-quality/#code-linters)
for Python (see the links for examples and explanations). 

For Assignment 1, we used [ruff](https://docs.astral.sh/ruff/) to both **format** and **lint** our source code.

To install ruff in a virtual environment:

```shell
(.venv) $ pip install ruff
```

You can customize the behavior of tools like ruff command line arguments,
as well as configuration files. For `ruff`, the file is `ruff.toml`.

See the ruff documentation: ["Configuring Ruff"](https://docs.astral.sh/ruff/configuration/#__tabbed_1_2).


### `pyproject.toml`

For more advanced projects, more advanced configurations than just project dependencies need to be declared:
linters, formatters, the build system for packaging the project, project metadata, and more.

The [`pyproject.toml`](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) file is the
recommended configuration file for packaging python projects. It can replace the functionality of `requirements.txt`.
See [@WritingYourPyprojecttoml] for more detail -- some of the notes below are adapted from it directly.

These notes are adapted from [@CompleteGuidePyprojecttoml2024], a great blogpost explaining the `pyproject.toml` file.

#### Basics

The only required information in the `pyproject.toml` file is the name of your project.
This is entered under a `[project]` field in the `.toml` file.

If/when your project is distributed on <https://pypi.org/>, this field will be the name of the project there.

::: {.column-margin}
Comparison of project names is **case insensitive** and treats runs of underscores, hyphens, and/or periods equivalently.
For example, if you register a project named `cool-stuff`, users will be able to download it or declare a dependency on it
using any of the following spellings: `Cool-Stuff`, `cool.stuff`, `COOL_STUFF`, `CoOl__-.-__sTuFF`
:::

```python {filename=sample-pyproject.toml}
[project]
name = "sample-python-project"
```

The project name must consist of ASCII letters, digits, underscores “_”, hyphens “-” and periods “.”
It must not start or end with an underscore, hyphen or period.

There are many more metadata properties that can be set in the `[project]` section of the config file.
See the [Other project metadata section](#other-project-metadata) for more.

#### Replacing `requirements.txt`

In the assignments, we separated *developer* and *production* dependencies into two different files.
We can replace that functionality with a single file using `pyproject.toml`.

```python {filename=sample-pyproject.toml}
[project]
# project fields go here

# We can replace requirements.txt with the "dependencies" field of the [project] section
dependencies = [
  # Note the comma: "dependencies" has a list-like syntax.
  "gpiozero",
  "gpiod == 2.3.0",
  # Note that the syntax for installing from a repository is slightly different
  # You must specify the package name first, then provide the protocol/url for the repository.
  "seeed-python-rpi @ git+https://github.com/Seeed-Studio/Seeed_Python_RPi"
]

# We can replace requirements-dev.txt with the "optional-dependencies" subfield of the [project] section.
# You can make up your own categories: here, I have made "test", "lint", and "dev" categories.
[project.optional-dependencies]
test = [
    "pytest",
]
lint = [
    "ruff"
]
dev = [
    # Note that the name of the project (sample-python-project) must match exactly for this syntax to work.
    "sample-python-project[test,lint]",
]
```

#### Replacing configuration files e.g. `ruff.toml`

The `pyproject.toml` config file unifies the configuration for most python tooling.

In Assignment 1, we used [ruff](https://docs.astral.sh/ruff/) for linting and formatting.
All of its configuration was placed in a `ruff.toml` file.

We can move that configuration to `pyproject.toml`:

```python {filename=sample-pyproject}
[tool.ruff]
line-length = 120
indent-width = 4
```

There are many other options you can specify, for example, some useful options I use:

```python {filename=sample-pyproject.toml}
[tool.ruff.format]
quote-style = "double"
indent-style = "space"
line-ending = "auto"
docstring-code-format = true

# This specifies the linting issues that ruff will catch when `ruff check` is run
[tool.ruff.lint]
select = [
    "F",   # pyflakes
    "E",   # pycodestyle
    "I",   # isort
    "ANN", # flake8 type annotations
    "RUF", # ruff-specific rules
]

[tool.ruff.lint.pydocstyle]
convention = "google"
```

You can see more options in the [ruff documentation](https://docs.astral.sh/ruff/configuration/).

#### Project metadata

When reading a project on GitHub, you can find out important information about the code from the project README.md

If your code is packaged to be used by others, for instance, by packaging it and publishing it on pypi.org,
the metadata about the project (author, project description, etc.) can be specified in `pyproject.toml`.

See [setting project metadata](https://devsjc.github.io/blog/20240627-the-complete-guide-to-pyproject-toml/#metadata) formore explanation and an example.

The official python documentation also shows examples:

- [Setting project authors](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#authors-maintainers)
- [Setting project license](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license-and-license-files)
- [Setting project version](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#version)
- [A full example](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#a-full-example)

#### Advanced features

Here are a few features you can easily add to your projects, if you have the time or interest!

- [Specifying entrypoints for the project](https://devsjc.github.io/blog/20240627-the-complete-guide-to-pyproject-toml/#entrypoints)
- [Creating executable scripts](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#creating-executable-scripts)
- [Packaging your project for distribution](https://devsjc.github.io/blog/20240627-the-complete-guide-to-pyproject-toml/#packaging-for-distribution)
  - I recommend using [setuptools](https://setuptools.pypa.io/en/latest/userguide/quickstart.html)

## Tips and Tricks

This section has a few tips and tricks for understanding python projects better

### Relative Import Statements

*Adapted from StackOverflow discussion [@ayaAnswerRelativeImports2013]*

There are a few tricky aspects for using `import` statements in python projects.

Consider the project layout below:

```shell
main.py
mypackage/
    __init__.py
    mymodule.py
    myothermodule.py
```

In `mymodule.py` :

```{.python filename=mymodule.py}
# Exported function
def get_temperature():
    return 23.45

if __name__ == '__main__':
    print(get_temperature())
```

In `myothermodule.py` :

```{.python filename=myothermodule.py}
# Relative import using `.` for current directory, `..` for parent directory.
from .mymodule import get_temperature

# Exported function
def announce_weather():
    return f"Outside temperature is {get_temperature()}"

if __name__ == '__main__':
    announce_weather()
```

In `main.py` :

```{.python filename=main.py}
from mypackage.myothermodule import announce_weather

def main():
    print(announce_weather())

if __name__ == '__main__':
    main()
```

This works when running `main.py` or `mypackage/mymodule.py`, but fails with
`mypackage/myothermodule.py`, due to the relative import:

```python
from .mymodule import as_int
```

```
Exception has occurred: ImportError
attempted relative import with no known parent package
```

**Solution**

When running `myothermodule.py` as a stand-alone script, run Python using the
`-m` option to run the file as a module. This will execute all the `__init__.py`
files and load the module dependency.

```python
python -m mypackage.myothermodule

# Note the ".", NOT a "/"
# the following WILL NOT work:
python -m mypackage/myothermodule
```

This will allow you to write modules that contain `main()` functions you can
test separately -- we took advantage of this pattern in Assignment 1.
