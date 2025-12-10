---
title: "Python package management"
subtitle: |
  How to use install system python packages using apt.
  How to install project python libraries using pip.
  Using virtual environments to manage python dependencies.
date: 2025-03-10
categories: ["python"]
toc-expand: 2
bibliography: references.bib
nocite: |-
  @*
---

## Overview

This lecture looks at the ways to acquire use and install external python
packages.

- Installing system python packages with `apt` on debian
- Creating virtual environments with `venv`
- Installing packages locally with `pip`

## Python on Raspberry Pi

_Note: most of these notes were adapted directly from the Raspberry Pi docs:
[Python on Raspberry Pi](https://www.raspberrypi.com/documentation/computers/os.html#python-on-raspberry-pi)_

Python 3 is installed by default on Raspberry Pi OS, and is used for many
important functions. Interfering with the system Python installation can cause
problems for your operating system, so it's important that if you install
third-party Python libraries, you use the correct package-management tools.

There are two routes to installing libraries into the default `python`
distribution:

- `apt` to install pre-configured system python packages distributed by Debian
- `pip` to install cross-platform packages from <https://pypi.org/>

::: {.callout-note}

Installing packages using `apt` is the preferred method
for using python applications in Raspberry Pi OS / Debian.

Installing packages using `pip` in a **virtual environment** is the preferred method
for installing Python libraries for developing a python project.

:::

## Installing Python packages using `apt`

Packages installed via `apt` are tested, are usually pre-compiled so they
install faster, and are designed for Raspberry Pi OS. They won't break your
system. Installing via this route also means that all required dependencies are
also installed, and a log of installation is maintained by the OS so
installation can be easily rolled back (libraries can be uninstalled) if needed.

You can see a complete list of Python apps maintained by Debian developers on
the stable repositories [here](https://packages.debian.org/stable/python/).
Many, but not all, popular open-source Python packages are maintained for Debian
by professionals and hobbyists alike.

To see an example: you may find yourself wanting to install the Python 3 library
to support the Raspberry Pi
[BuildHAT](https://www.raspberrypi.com/documentation/accessories/build-hat.html)
component. To install this using `apt`, you would:

```bash
$ sudo apt install python3-build-hat
```

If you want to install a Python library called "foobar" you can
use `apt search foobar` to find the exact package name -- partial search matches
are supported, so you don't need to know the whole name in advance. Very useful!

Using `apt` makes installing larger packages, like `numpy` (which has many
native dependencies including a Fortran compiler), _much simpler and more
predictable_ than installing individual packages using Python's own
package-management system.

::: {.callout-note}
In `apt`, Python packages have a consistent naming scheme: you'll
find that the a given package "foobar" is going to be called `python-foobar` or
`python3-foobar` in the `apt` repositories -- this helps distinguish python
packages from other packages on a debian system.
:::

## Installing python packages using `pip`

The goal of operating systems like Debian is to be _stable_, that is, unlikely
to crash due to a poorly tested/implemented program. That does come at a cost of
not always offering the latest versions of packages, nor having a complelely
comprehensive set of the bleeding edge packages that are available.

Many developer depend on packages that are under active development. And, there
are many packages that there are no Debian maintainers for. For cases like these
(and many other cases, as we'll see) it is useful for programming languages like
Python to have an independent packaging manager.

For python, the most commonly used package manager is
[`pip`](https://pip.pypa.io/en/stable/).

> Pip installs packages from the
> [Python Package Index repository (pypi.org)](https://pypi.org/) rather than
> the Debian or any other package repositories.

Even though Raspberry Pi OS comes with `pip` installed, we can't just use it
right away, as we we'll see in the next section.

### `pip` cannot be used to install system-wide python packages

In previous versions of Debian/RaspberryPi OS operating system, it was possible to install
libraries directly, system-wide, using the package installer for Python, `pip`.

You'll find the following sort of command in many tutorials online:

```bash
$ pip install buildhat
```

In newer versions of Raspberry Pi OS, and most other operating systems, this is
disallowed. If you try and install a Python package system-wide you'll receive
an error similar to this:

```shell
$ pip install buildhat
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
  python3-xyz, where xyz is the package you are trying to
  install.

  If you wish to install a non-Debian-packaged Python package,
  create a virtual environment using python3 -m venv path/to/venv.
  Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
  sure you have python3-full installed.

  For more information visit http://rptl.io/venv

note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.
```

This error is generated because you're trying to install a third-party package
into the system Python. A long-standing practical problem for Python users has
been conflicts between OS package managers like `apt` and Python-specific
package management tools like `pip`. These conflicts include both Python-level
API incompatibilities and conflicts over file ownership.

Therefore from _Debian Bookworm_ onwards, packages installed via `pip` must be
installed into a Python virtual environment using `venv`. A virtual environment
is a container where you can safely install third-party modules so they won't
interfere with, or break, your system Python.

## Virtual environments

### How virtual environments solve the `pip` problem

Python [virtual environments](https://docs.python.org/3/library/venv.html) are
folders that we can create in a python project using the [venv](https://docs.python.org/3/library/venv.html) module.

They act as a container that allows you to install python libraries and applications in a folder
separated from your system python packages.

This has the following benefits:

1. **Avoid system pollution**

    - Installing packages to the OS’s global Python will mix them with OS relevant
        packages. This could have unexpected side effects on OS tasks.
    - Because of the reason above, updating OS packages might overwrite or delete global
        Python packages.

1. **Avoid project dependency conflicts**

    - Python projects might require different versions the same external library.

1. **Make projects reproducible in other environments.**

    - Since all dependencies are isolated to a specific project, it is easier to identify
        and document them.
    - Once the dependencies are "locked", the project dependency can be easily reproduced in
        other environments.

### Creating a virtual environment

Inside of the project directory where you want to create virtual environment:

```shell
$ python -m venv .venv
```

Note that the `.venv` argument is the name of your virtual environment.
`.venv` is a popular choice that will be automatically recognized by VSCode.

The `python -m venv .venv` command creates a directory called `.venv`:

```shell
$ ls -la
total 12
drwxr-xr-x  3 user user 4096 Oct  3 14:34 .
drwx------ 20 user user 4096 Oct  3 14:34 ..
drwxr-xr-x  5 user user 4096 Oct  3 14:34 .venv
$
```

### Activating and deactivating a virtual environment

Inside the virtual environment directory is a full Python distribution (use `ls -l` to see the files).
How do we use it?

A nice feature of venvs is that they **must be activated to be used**. This
allows you to maintain many different venvs all over your machine, allowing you
to control the python dependencies for each project independently.

To **activate** your virtual environment and make that version of Python the one
you're currently using, `python -m venv` creates a bash environment script called `activate`
that you can run with the bash command [`source`](/notes/bash-scripting/#function-library-with-source):

```shell
$ source .venv/bin/activate
(.venv) $
```

You'll see that your prompt is now prepended with `(.venv)` to indicate that
you're no longer using the system Python. Instead, you're using the version of
Python contained inside your virtual environment. Any changes you make here
won't cause problems for your system Python; nor will any new modules you
install into your environment.

```shell
(.venv) $ which python
/home/username/my_project/.venv/bin/python
```

You can leave your virtual environment and return to using the system Python by
typing:

```shell
(.venv) $ deactivate
```

...and check for yourself that the shell's `python` has updated by using `which python`.

### Installing venv packages with `pip`

Once a virtual environment is active, **packages installed with `pip` will be local to
that virtual environment.**

For a virtual environment named `.venv`, for example:

```shell
.venv/
│  └── lib/
│    └── python3.X/
│      └── site-packages/
```

For example, installing `gpiozero`:

```shell
# Notice the shell prompt indicates a virtual env is active
$ (.venv) pip install gpiozero
...
$ (.venv) ls -l .venv/lib/python3.11/site-packages/ | grep gpiozero
drwxr-xr-x@    - username 23 Jan 20:48 gpiozero                   # source code
drwxr-xr-x@    - username 23 Jan 20:48 gpiozero-2.0.1.dist-info   # distribution archive
drwxr-xr-x@    - username 23 Jan 20:48 gpiozerocli                # gpiozero comes with an extra python package for cli use
```

### Checking what packages are installed in a .venv

You can use `pip freeze` to get the packages installed in the python environment:

```shell
$ pip freeze
```

This command is useful for a few reasons:

- verifying that the package you attempted to install is the version you expect it to be
- creating a [requirements.txt](/notes/python-project-management#dependencies-with-requirements.txt)
  file from the output of the `pip freeze` command.


### "Re-using" Virtual Environments

If you move or copy a project that uses virtual environments to a different folder, **you must
re-initialize the virtual environment.**

From the [official docs](https://docs.python.org/3/library/venv.html#how-venvs-work):

> Scripts installed in environments contain the absolute paths to their environment’s
> interpreters.

Because of this, **virtual environments are non-portable** -- instead of moving them around,
the better thing is to **make sure you have a method to recreate a virtual environment**.

For example, create a requirements file `requirements.txt`, and invoke `pip install -r requirements.txt`,
to recreate your virtual environment dependencies.

You can see more about managing your projects dependencies in the
[course notes on project configuration](/notes/python-project-management#project-configuration)



## Troubleshooting

Here are a few things to know in case you're having issues using packages you've installed in a virtual environment.

### Check library location

Check the location of where the module was installed with
`pip show <module-name>`:

```shell
(.venv) user@host:~ $ pip show gpiozero

Name: gpiozero
Version: 2.0.1
Summary: A simple interface to GPIO devices with Raspberry Pi
Home-page: https://gpiozero.readthedocs.io/
Author: Ben Nuttall
Author-email: ben@bennuttall.com
License: BSD-3-Clause
Location: /absolute/path/to/.venv/lib/python3.12/site-packages
Requires: colorzero
Required-by:
```

The library location is specified by the `Location` field.

### Check python's library paths

Similarly to Linux, there are environmental variables that determine where
python will look for installed modules/libraries.

See the paths where python is looking for libraries with `sys.path`. They should
look something like:

::: {.panel-tabset}

## venv

```shell
(.venv) pi@raspberrypi:~ $ python

>>> import sys      # Exposes configuration used by the python interpreter.
>>> sys.path        # Lists all paths where interpreter looks for modules.
['', '/usr/lib/python311/site-packages']
```

## system

```shell
pi@raspberrypi:~ $ python

>>> import sys      # Exposes configuration used by the python interpreter.
>>> sys.path        # Lists all paths where interpreter looks for modules.
['', '/usr/lib/python311.zip', '/usr/lib/python3.11', '/usr/lib/python3.11/lib-dynload', '/usr/local/lib/python3.11/dist-packages', '/usr/lib/python3/dist-packages', '/usr/lib/python3.11/dist-packages']
```

:::

If the output of `pip show seeed-python-reterminal` is not in this list, python
will not find it when you import it.

### Using packages that require root permissions

The `venv` pattern is very useful for maintaining packages that do not require
root permissions. This is a feature, not a bug -- that way, you can have many
developers independently install packages on one machine without needing to give
them root permissions.

Sometimes (and particularly, in this couse) the packages we install _require_
root permissions to work. Consider the packages that edit LED `/sys/` files,
like `seeed-python-reterminal` we install in Lab 2. We will run into an issue if
we try to use these packages as normal users:

```shell
(.venv) user@hostname:~/lab2/python $ python ./leds.py
# ... output redacted
<Permissions error>
```

It is unfortunately not fixable by simply using `sudo`:

```shell
(.venv) user@hostname:~/lab2/python $ sudo python ./leds.py
# ... output redacted
<Module seeed-python-terminal not included/available>
```

Why isn't the package available? Well, `sudo` runs `python` _as the root user_.
The root user does not have your `venv` of python in its path. Try the commands
below on your system to see if you understand what I mean.

::: {.panel-tabset}

## normal user

```shell
(.venv)user@host:~ $ which python
/home/user/path/to/.venv/bin/python
```

## sudo user

```shell
(.venv)user@host:~ $ sudo su
(.venv)root@host:~ # which python
/usr/bin/python
```

:::

How to resolve this problem? It is similar to the `sudo echo > file` problem we
saw with Bash. We need to make sure `sudo` is applying to the _correct python
executable_. There are a few ways we can do this, all of which will look
something like this:

```shell
# use absolute path to virtual environment python
(.venv)user@host:~ $ sudo /absolute/path/to/venv/python ./leds.py

# use relative path to virtual environment python
(.venv)user@host:~ $ sudo ./.venv/relative/path/to/venv/python ./leds.py

# use command substitution
(.venv)user@host:~ $ sudo $(shell command for finding where python is installed) ./leds.py
```

Try a few of these options out (will not work if you copy paste! Make sure you
understand the commands)

## Further reading

- Short guide by python.org: [Installing packages using pip and virtual environments](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#installing-packages-using-pip-and-virtual-environments)
- Detailed guide by RealPython.com: [Python Virtual Environments: A Primer](https://realpython.com/python-virtual-environments-a-primer/)
