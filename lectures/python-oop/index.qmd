---
title: Python OOP
subtitle: Basics of Object Oriented Programming in Python.
date: 2025-04-04
categories: [python]
bibliography: references.bib
nocite: |-
  @*
---

## Overview

- Explanation of how OOP works in Python
- Type annotations for Python variables, functions, and classes
- Inheritance, interfaces
- Enums

## OOP in Python

*These notes have been adapted from
<https://realpython.com/python3-object-oriented-programming/> with few modifications.*

Object-oriented programming is a
[programming paradigm](http://en.wikipedia.org/wiki/Programming_paradigm) that provides a
means of structuring programs so that properties and behaviors are bundled into individual
**objects**.

### How to define a class in python

In python, you define a class by using the `class` keyword followed by a name and a colon.
Then you declare a **constructor** function that is *always* called `__init__()` to declare
which attributes each instance of the class should have:

```python {filename=python}
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
```

Once the class is defined, you can create instances of it:

```bash {filename=PyInterpreter}
>>> bob = Person("Bob", 102)
>>> print(bob.name)
Bob
>>> print(bob.age)
102
```

### Classes vs Instances

A `class` is a **blueprint**. It doesn't actually contain any data.
The `Person` class specifies that a name and an age are necessary for defining a person, but it
doesn't contain the name or age of any specific person.

While the class is the blueprint, an **instance** is an *object* that's built from a class
and contains real data. An instance of the `Person` class is not a blueprint anymore. It's an
actual person with a name, like Bob, who's 102 years old.

### Instance Methods

**Instance methods** are functions that you define inside a class and can only call on an
instance of that class. Just like `__init__()`, an instance method always takes `self` as
its first parameter.

Let's add a few methods to the `Person` class from the previous example:

```python {filename=Python}
class Person:

    def __init__(self, name, age):
        self.name = name
        self.age = age

    # Instance method
    def description(self):
        return f"{self.name} is {self.age} years old"

    # Another instance method
    def speak(self, sound):
        return f"{self.name} says {sound}"
```

This `Person` class has two instance methods:

1. **`description`** returns a string displaying the name and age of the person.
1. **`speak`** has one parameter called `sound` and returns a string containing the
    person's name and the sound that the person makes.

```bash {filename=PyInterpreter}
>>> miles = Person("Miles", 4)

>>> miles.description()
'Miles is 4 years old'

>>> miles.speak("Woof Woof")
'Miles says Woof Woof'

>>> miles.speak("Bow Wow")
'Miles says Bow Wow'
```

### Dunder methods

In the editor window, change the name of the `Dog` class's `.description()` method to
`.__str__()`:

```python {filename=Python}
class Dog:
    # ...

    def __str__(self):
        return f"{self.name} is {self.age} years old"
```

Methods like `.__init__()` and `.__str__()` are called **dunder methods** because they
begin and end with [double underscores](https://realpython.com/python-double-underscore/).
There are many dunder methods that you can use to customize classes in Python.
[Understanding dunder methods](https://realpython.com/python-classes/#special-methods-and-protocols)
is an important part of mastering object-oriented programming in Python.

> **Note:** Check out
> [When Should You Use `.__repr__()` vs `.__str__()` in Python?](https://realpython.com/python-repr-vs-str/)
> to learn more about `.__str__()` and its cousin `.__repr__()`.

### How Do You Inherit From Another Class in Python?

[Inheritance](https://realpython.com/inheritance-composition-python/) is the process by
which one class takes on the attributes and methods of another. Newly formed classes are
called **child classes**, and the classes that you derive child classes from are called
**parent classes**.

You inherit from a parent class by creating a new class and putting the name of the parent
class into parentheses:

```python {filename=Python}
class Parent:
    hair_color = "brown"


class Child(Parent):
    pass
```

In this minimal example, the child class `Child` inherits from the parent class `Parent`.
Because child classes take on the attributes and methods of parent classes,
`Child.hair_color` is also `"brown"` without your explicitly defining that.

Child classes can **override** or **extend** the attributes and methods of parent classes. In
other words, child classes inherit all of the parent's attributes and methods but can also
specify attributes and methods that are unique to themselves:

```python {filename=Python}
class Parent:
    speaks = ["English"]


class Child(Parent):
    def __init__(self):
        super().__init__()
        self.speaks.append("German")
```

## Typings

_This section adapted from https://docs.python.org/3/library/typing.html and
https://mypy.readthedocs.io/en/stable/cheat_sheet_py3.html_

This section is a quick cheat sheet showing how to use type annotations for various common
types in Python.

::: {.callout-note}
The Python runtime does not enforce function and variable type
annotations. They can be used by third party tools such as type checkers, IDEs, linters,
etc.
:::

### Variables

Basics:

```python
# This is how you declare the type of a variable
age: int = 1

# You don't need to initialize a variable to annotate it
a: int  # Ok (no value at runtime until assigned)

# Doing so can be useful in conditional branches
child: bool
if age < 18:
    child = True
else:
    child = False
```

Useful built-in types:

```python
# the common basic "primitive" types in Python
x: int = 1
x: float = 1.0
x: bool = True
x: str = "test"
x: bytes = b"test"

# Collections (Python 3.9+)
x: list[int] = [1]
x: set[int] = {6, 7}

# For mappings, we need the types of both keys and values
x: dict[str, float] = {"field": 2.0}  # Python 3.9+

# For tuples of fixed size, we specify the types of all the elements
x: tuple[int, str, float] = (3, "yes", 7.5)  # Python 3.9+

# For tuples of variable size, we use one type and ellipsis
x: tuple[int, ...] = (1, 2, 3)  # Python 3.9+
```

### Functions

```python
from typing import Callable, Iterator, Union, Optional


# This is how you annotate a function definition
def stringify(num: int) -> str:
    return str(num)


# And here's how you specify multiple arguments
def plus(num1: int, num2: int) -> int:
    return num1 + num2


# If a function does not return a value, use None as the return type
# Default value for an argument goes after the type annotation
def show(value: str, excitement: int = 10) -> None:
    print(value + "!" * excitement)


# Note that arguments without a type are dynamically typed (treated as Any)
# and that functions without any annotations are not checked
def untyped(x):
    x.anything() + 1 + "string"  # no errors


# You can of course split a function annotation over multiple lines
def send_email(
    address: Union[str, list[str]],
    sender: str,
    cc: Optional[list[str]],
    bcc: Optional[list[str]],
    subject: str = "",
    body: Optional[list[str]] = None,
) -> bool: ...
```

### Classes

Here's an example of typings with a custom defined class:

```python
class BankAccount:
    # The "__init__" constructor method doesn't return anything, so it gets return
    # type "None" just like any other method that doesn't return anything
    def __init__(self, account_name: str, initial_balance: int = 0) -> None:
        # mypy will infer the correct types for these instance variables
        # based on the types of the parameters.
        self.account_name = account_name
        self.balance = initial_balance

    # For instance methods, omit type for "self"
    def deposit(self, amount: int) -> None:
        self.balance += amount

    def withdraw(self, amount: int) -> None:
        self.balance -= amount


# User-defined classes are valid as types in annotations
account: BankAccount = BankAccount("Alice", 400)


def transfer(src: BankAccount, dst: BankAccount, amount: int) -> None:
    src.withdraw(amount)
    dst.deposit(amount)


# Functions that accept BankAccount also accept any subclass of BankAccount!
class AuditedBankAccount(BankAccount):
    # You can optionally declare instance variables in the class body
    audit_log: list[str]

    def __init__(self, account_name: str, initial_balance: int = 0) -> None:
        super().__init__(account_name, initial_balance)
        self.audit_log: list[str] = []

    def deposit(self, amount: int) -> None:
        self.audit_log.append(f"Deposited {amount}")
        self.balance += amount

    def withdraw(self, amount: int) -> None:
        self.audit_log.append(f"Withdrew {amount}")
        self.balance -= amount


audited = AuditedBankAccount("Bob", 300)
transfer(audited, account, 100)  # type checks!
```
