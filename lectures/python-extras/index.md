---
title: "Python extras"
subtitle: |
  Python tips and tricks that there wasn't time to cover explicitly in the course, but are useful to know.
  Logging in Python with the logging module.
  Unit testing in python with pytest.
date: 2026-05-10
blogpost: true
category: Python
tags: Python
location: Lecture
---

## Overview

These notes cover useful `python` skills, particularly for finalizing your team's project.

## Logging

The general-purpose console `print()` statement has served us well throughout this course
for making program outut available to `stdout` when running our programs.

It does have some limitations, in particular:

- it is difficult to distinguish between important vs informational vs error messages
- it is difficult to configure whether output should or should not be printed (i.e., to
implement a DEBUG mode)
- it is difficult to modify the format of the print statement universally across your
program.
- it is impossible to control the `print` output of any dependencies you are using
(for this reason, python libraries that use `print` are VERY annoying!)

Luckily, the built-in [`logging`](https://docs.python.org/3/library/logging.html) module
fixes all of these issues, and more. Generally, once you have a program of a certain sophistication
in python, you can entirely replace `print` statements with `logging` statements to better
configure your program's outputs to `stdout` and `stderr`.

### Need-to-know

For our course, the main need-to-know features of the `logging` library are as follows:

- adjusting the Logging Config
- using the correct logger (Logging Hierarchy)
- setting the Log Level
- log to stdout and to a file at the same time (Logging Handlers)
- controlling the format of the logs (Logging Formatters)

You can see an example of how to replace a `print` statement with a `logging` statement
with these three properties below:The output shows the severity level before each message along with root, which is the name the logging module gives to its default logger. This output shows the default format that can be configured to include things like a timestamp or other details.

### Logging Config

`logging` is an old package, with many possible methods for changing its configuration.
The one I will recommend is the `dictConfig` method:

:::{margin}

A great feature of the `dictConfig` method is that it will allow us to optionally
write our config as an external configuration file.

For example, if we stored our logging
configurations in a JSON file:

```python
with open('logging_config.json', 'r') as config_file:
    config = json.load(config_file)
    logging.config.dictConfig(config)
```

:::

```python
import logging
logging.config.dictConfig(config={
    "version": 1, # required boilerplate
    "disable_existing_loggers": False, # recommended boilerplate
    "formatters": {...},    
    "handlers": {...},
    "loggers": {...},
})
```


We will see how to use each of these options in the subsequent sections.

### Logging Hierarchy

All loggers in python are descendants of a "root" logger.

We can quickly see the
difference between using the "root" logger, and using module-level logger, by running
a quick interactive python session:

```sh
$ python
>>> import logging
>>> logging.warning("hello world!") # The root logger, uses the logging module directly
WARNING:root:hello world!
>>> logger = logging.getLogger("app_name") # RECOMMENDED:
                                           # create one shared logger for your entire app
>>> logger.warning("hello world!")
WARNING:app_name:hello world!
```

:::{important}

Note that descendent loggers will inherit the configuration of the root logger.
This sets up an important pattern:

- **Make common configuration changes to the root logger** (`logging.basicConfig`). Then, all
  loggers in your project will inherit these changes.
- **Write logs using module-level loggers** (`logger.<loglevel>(<message>)`). Then, all
logs can be easily traced to their source in code.
:::

### Log Level

There are 5 primary log levels for the various types of messages you may wish to log:

:::{margin}

Why are most logging levels suppressed by default?
And why are errors logged to `stderr`, instead of `stdout`, by default?

There is an [insightful comment on stackoverflow](https://stackoverflow.com/questions/58971197/why-python-logging-writes-to-stderr-by-default#comment104196409_58971197)
that makes a helpful analogy:

> "...logging is not considered to be the output of the program, but kind of like "running
> commentary" the program is doing. Just like a director's commentary is not merged into
> the default audio stream on a DVD, logging too is kept separate from stdout so that it
> does not interfere with the program's output"

:::

:::{list-table} Table adapted from [RealPython](https://realpython.com/python-logging/)
---
header-rows: 1
---
- - Log Level
  - Function
  - Description
- - DEBUG (Suppressed by default)	
  - `logging.debug()` 	
  - Provides detailed information that’s valuable to you as a developer.
- - INFO (Suppressed by default)	
  - `logging.info()` 	
  - Provides general information about what’s going on with your program.
- - WARNING (Visible in STDOUT by default)
  - `logging.warning()` 	
  - Indicates that there’s something you should look into.
- - ERROR (Visible in STDERR by default)
  - `logging.error()` 	
  - Alerts you to an unexpected problem that’s occurred in your program.
- - CRITICAL (Visible in STDERR by default)
  - `logging.critical()` 	
  - Tells you that a serious error has occurred and may have crashed your app.
:::


### Log Handlers

For example:

```json
"handlers": {
    "stderr": {
        "class": "logging.StreamHandler",
        "level": "WARNING",
        "formatter": "simple",
        "stream": "ext://sys.stderr"
    },
    "file": {
        "class": "logging.handlers.RotatingFileHandler",
        "level": "DEBUG",
        "formatter": "detailed",
        "filename": "connected_objects_test.log",
        "maxBytes": 10000,
        "backupCount": 3
    }
},
"loggers": {
    "root": {
        "level": "DEBUG",
        "handlers": [
            "stderr",
            "file"
        ]
    }
}
```

### Log Formatters

For example:

```json
"formatters": {
    "simple": {
        "format": "%(levelname)s: %(message)s"
    },
    "detailed": {
        "format": "[%(levelname)s|%(module)s|L%(lineno)d] %(asctime)s: %(message)s",
        "datefmt": "%Y-%m-%dT%H:%M:%S%z"
    }
},
```

### Example

```python

import logging

logger = logging.getLogger(__name__)

# NOTE: in the test, we put this in a separate file and loaded it using the json module.
logging_config = {
    "version": 1,
    "disable_existing_loggers": false,
    "formatters": {
        "simple": {
            "format": "%(levelname)s: %(message)s"
        },
        "detailed": {
            "format": "[%(levelname)s|%(module)s|L%(lineno)d] %(asctime)s: %(message)s",
            "datefmt": "%Y-%m-%dT%H:%M:%S%z"
        }
    },
    "handlers": {
        "stderr": {
            "class": "logging.StreamHandler",
            "level": "WARNING",
            "formatter": "simple",
            "stream": "ext://sys.stderr"
        },
        "file": {
            "class": "logging.handlers.RotatingFileHandler",
            "level": "DEBUG",
            "formatter": "detailed",
            "filename": "connected_objects_test.log",
            "maxBytes": 10000,
            "backupCount": 3
        }
    },
    "loggers": {
        "root": {
            "level": "DEBUG",
            "handlers": [
                "stderr",
                "file"
            ]
        }
    }
}

def main():
    logging.config.dictConfig(config=logging_config)
    logger.addHandler(logging.StreamHandler(...))

    # Let's get rid of print statements!
    # print("hello world!")

    # Replace them with one of the following:
    logging.debug("hello world!")       # Suppressed by default
    logging.info("hello world!")        # Suppressed by default
    logging.warning("hello world!")     # Lowest level shown by default
    logging.error("hello world!")
    logging.exception("hello world!")
    logging.critical("hello world!")
```

### Reference

The notes above were largely adapted from [this article from realpython.com](https://realpython.com/python-logging/),
in particular:


- [Instantiating the logger in each file](https://realpython.com/python-logging/#instantiating-your-logger)
- [Formatting log output](https://realpython.com/python-logging/#formatting-the-output)
- [Logging to a file](https://realpython.com/python-logging/#logging-to-a-file)
- [Using handlers to customize format and output](https://realpython.com/python-logging/#using-handlers)

This is also a nice video explaining python logging overall:

:::{youtube} 9L77QExPmI0
:::

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

:::: {tab-set}

::: {tab-item} `unittest`

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

:::

::: {tab-item} `pytest`

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

::::

### Installing `pytest`

In your [virtual environment](/lectures/python-package-management/index.md#virtual-environments),
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

`pytest` enables the creation of **fixtures**, that is, test objects, that can be used across tests
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

```text
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

In our final project, there are quite a few [asynchronous](/lectures/async-python/index.md) functions to test.

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
