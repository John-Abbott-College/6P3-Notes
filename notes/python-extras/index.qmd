---
title: "Python extras"
subtitle: |
  Python tips and tricks that there wasn't time to cover explicitly in the course, but are useful to know.
  Logging in Python with the logging module.
  Unit testing in python with pytest.
date: 2025-05-05
execute:
  eval: false
categories: [python]
toc-expand: 2
filters:
  - line-highlight
bibliography: references.bib
nocite: |-
  @*
---

## Overview

These notes cover useful `python` skills, particularly for finalizing your team's project.

## Logging

*These notes were adapted from [@pythonLoggingPythonReal]*

See [this article from Real Python for a complete explanation](https://realpython.com/python-logging/).

Important notes:

- [Instantiating the logger in each file](https://realpython.com/python-logging/#instantiating-your-logger)
- [Formatting log output](https://realpython.com/python-logging/#formatting-the-output)
- [Logging to a file](https://realpython.com/python-logging/#logging-to-a-file)
- [Using handlers to customize format and output](https://realpython.com/python-logging/#using-handlers)

## Unit testing

> These notes were adapted from:
>
> - [@pythonEffectivePythonTesting]
> - [@PytestDocumentation]

There are two main libraries for unit tests in python:

- [unittest](https://docs.python.org/3/library/unittest.html): included in the standard python library
- [pytest](https://docs.pytest.org/en/stable/): a very popular third party library for writing unit tests in python

I've used both before, and they're both great. In this course, we'll be using `pytest`.
There's a few reasons for that, which mostly aren't that important, but in general,
compared to `unittest`, `pytest` requires far less **boilerplate** code to accomplish the same things.
For example:

::: {.panel-tabset}

## `unittest`

To create one unit test that always passes, and one that always fails, using `unittest`:

```python {filename=unittest}
from unittest import TestCase

class TryTesting(TestCase):
    def test_always_passes(self):
        self.assertTrue(True)

    def test_always_fails(self):
        self.assertTrue(False)
```

The following steps were necessary:

- Import the `TestCase` class from `unittest`
- Create `TryTesting`, a subclass of `TestCase`
- Write a method in `TryTesting` for each test
- Use one of the `self.assert` methods from `unittest.TestCase` to make assertions

This boilerplate code is required for every single test.

## `pytest`

To create one unit test that always passes, and one that always fails, using `pytest`:

```python {filename=pytest}
def test_always_passes():
    assert True

def test_always_fails():
    assert False
```

The following steps were necessary:

- define functions beginning with the name `test_`
- use Python’s built-in `assert` keyword directly

Much less boilerplate code required!

:::

### Installing `pytest`

In your [virtual environment](/notes/python-package-management#virtual-environments),
use `pip` to install `pytest`:

```shell
$ pip install pytest
```

### Creating and running tests

Create a new file called `test_sample.py`, containing a function, and a test:

```python {filename=test_sample.py}
def func(x):
    return x + 1


def test_answer():
    assert func(3) == 5
```

Run the test:

```shell
$ pytest
```

See [pytest: Getting Started](https://docs.pytest.org/en/stable/getting-started.html#get-started) documentation for more details.

See [my example_system unit tests](https://github.com/420-6A6-6P3-W25/final-project-upstream/tree/main/iot_subsystems/tests/example_system) for examles relevant to our project.

### Dependency injection with `pytest` fixutres

`pytest` is designed to follow a variant of the "functional" testing paradigm called Arrange-Act-Assert:

- **Arrange**, or set up, the conditions for the test
- **Act** by calling some function or method
- **Assert** that some end condition is true

`pytest` enables the creation of [fixtures](), that is, test objects, that can be used across tests
to simplify the **Arrange** step:

```python {filename=fixture_demo.py}
import pytest

# This annotation marks the function as a fixture generator
@pytest.fixture
def example_fixture():
    return 1

# Make tests use that fixture by providing the name as a parameter of the test function:
def test_with_fixture(example_fixture):
    assert example_fixture == 1
```

You can see how I use fixtures in the [example_system conftest.py](https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/tests/example_system/conftest.py)
files of the sample test code in the final-project-upstream.

#### `conftest.py`

You'll notice in the [example_system tests](https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/tests/example_system/conftest.py)
that I define fixtures in files named `conftest.py`:

```{r}
#| source-line-numbers: "2,4"
final-project-upstream/iot_subsystems/tests/example_system/
├── conftest.py
├── integration
│   ├── conftest.py
│   ├── __init__.py
│   └── test_system.py
└── unit
    ├── __init__.py
    ├── test_aht20.py
    └── test_fan.py
```

This is a pytest convention for sharing fixtures across multiple test files, allowing you to keep your
test files concise and to avoid needing to recreate dependencies. This is very useful for our project,
where we have many custom classes we are creating and mocking.

You can see more about `conftest.py` in the
[pytest documentation](https://docs.pytest.org/en/stable/reference/fixtures.html#conftest-py-sharing-fixtures-across-multiple-files)

### using `pytest` on asynchronous code

In our final project, there are quite a few [asynchronous](/notes/async-python) functions to test.

See the [example_system.py unit tests](https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/tests/example_system/integration/test_system.py#L61)
from the [final-project-upstream](https://github.com/420-6A6-6P3-W25/final-project-upstream/) code for an example.

### using `logot` to test logs

`pytest` does include a fixture called `caplog` for testing if logs were written.

I found that the 3rd party package `logot` was much simpler to use.

See the [example_system.py unit tests](https://github.com/420-6A6-6P3-W25/final-project-upstream/blob/main/iot_subsystems/tests/example_system/integration/test_system.py#L62)
from the [final-project-upstream](https://github.com/420-6A6-6P3-W25/final-project-upstream/) code for an example:

- [Installing `logot`](https://logot.readthedocs.io/stable/installing.html)
  - [Ensure `logot` is compatible with `pytest`](https://logot.readthedocs.io/stable/installing.html#installing-package-extras)
- [Basics of using `logot`](https://logot.readthedocs.io/stable/index.html)
- [Using `logot` with `pytest](https://logot.readthedocs.io/stable/using-pytest.html)
- [Using `logot` on asynchronous tests](https://logot.readthedocs.io/stable/index.html#testing-asynchronous-code)
- [Using "message matching" to match log messages with placeholders](https://logot.readthedocs.io/stable/log-message-matching.html)

### Further `pytest` reference

I found the following documentation really useful when I was making the `example_system/` starter code tests:

- [How to use `pytest` on the command line, choosing which files to test](https://docs.pytest.org/en/stable/how-to/usage.html)
- [Conventions for Python test discovery: file, module, class and function names](https://docs.pytest.org/en/stable/explanation/goodpractices.html#conventions-for-python-test-discovery)
- [Best practises for test file structure layout](https://docs.pytest.org/en/stable/explanation/goodpractices.html#tests-outside-application-code)
- [How to use fixtures](https://docs.pytest.org/en/stable/how-to/fixtures.html)
    - [More explanation of what fixtures are](https://docs.pytest.org/en/stable/explanation/fixtures.html)
    - [More detailed reference for fixtures](https://docs.pytest.org/en/stable/reference/fixtures.html#fixtures)
- [How to adjust the behavior of mock test classes using "monkeypatch"](https://docs.pytest.org/en/stable/how-to/monkeypatch.html)
