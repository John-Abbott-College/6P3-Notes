# Intro to Python for Developers

This is a brief introduction to Python for current developers.

If you need to setup your environment for Python, see Python Dev Environment.

## Resources & References

These notes were summarized from the resources below. Visit them for more details:
- [The Python Tutorial](https://docs.python.org/3/tutorial/), from docs.python.org
- [Dive into Python 3](https://diveintopython3.problemsolving.io/) by Mark Pligrim
-  [Python 3's f-Strings: An Improved String Formatting Syntax (Guide)](https://realpython.com/python-f-strings/#python-f-strings-the-pesky-details) by realpython.com
- [How To Code in Python](https://www.digitalocean.com/community/tutorial_series/how-to-code-in-python-3) by digitalocean.com

If you feel comfortable with Python and just need a "refresher", start with [Learn Python in 10 minutes](https://www.stavros.io/tutorials/python/) by Stavros Korokithakis.


## Getting Help

You can get A TON of help directly from the interpreter by using:  `help(<object>)`,  `dir(<object>)` and `<object>._doc_`

`help(<object>)` will give you the "manual" available on the object.

```python
>>> myvar = 3   # an int
>>> help(myvar)

Class int(object)
 |  int([x]) -> integer
 |  int(x, base=10) -> integer
 |  
 |  Convert a number or string to an integer, or return 0 if no arguments
 |  are given.  If x is a number, return x.__int__().  For floating point
 |  numbers, this truncates towards zero.
 |  
 |  If x is not a number or if base is given, then x must be a string,
 |  bytes, or bytearray instance representing an integer literal in the
 |  given base.  The literal can be preceded by '+' or '-' and be surrounded
 |  by whitespace.  The base defaults to 10.  Valid bases are 0 and 2-36.
 |  Base 0 means to interpret the base from the string as an integer literal.
 |  >>> int('0b100', base=0)
 |  4
 |  
 |  Built-in subclasses:
 |      bool
 |  
 |  Methods defined here:
 |  
 |  __abs__(self, /)
 |      abs(self)

 ... all the other methods available ... 

```

`dir(<object>)` lists all of the object's methods:

```py
>>> dir(myvar)
['__abs__', '__add__', '__and__', '__bool__', '__ceil__', '__class__', '__delattr__', '__dir__', '__divmod__', '__doc__', '__eq__', '__float__', '__floor__', '__floordiv__', '__format__', '__ge__', '__getattribute__', '__getnewargs__', '__gt__', '__hash__', '__index__', '__init__', '__init_subclass__', '__int__', '__invert__', '__le__', '__lshift__', '__lt__', '__mod__', '__mul__', '__ne__', '__neg__', '__new__', '__or__', '__pos__', '__pow__', '__radd__', '__rand__', '__rdivmod__', '__reduce__', '__reduce_ex__', '__repr__', '__rfloordiv__', '__rlshift__', '__rmod__', '__rmul__', '__ror__', '__round__', '__rpow__', '__rrshift__', '__rshift__', '__rsub__', '__rtruediv__', '__rxor__', '__setattr__', '__sizeof__', '__str__', '__sub__', '__subclasshook__', '__truediv__', '__trunc__', '__xor__', 'as_integer_ratio', 'bit_count', 'bit_length', 'conjugate', 'denominator', 'from_bytes', 'imag', 'numerator', 'real', 'to_bytes']
```

The method `<object>.__doc__`  (notice the double underscore) will show you the documentation string (aka. Docstring) from the function, method, class or module:

```py
>>> print(myvar.__doc__)

int([x]) -> integer
int(x, base=10) -> integer

Convert a number or string to an integer, or return 0 if no arguments
are given.  If x is a number, return x.__int__().  For floating point
numbers, this truncates towards zero.

If x is not a number or if base is given, then x must be a string,
bytes, or bytearray instance representing an integer literal in the
given base.  The literal can be preceded by '+' or '-' and be surrounded
by whitespace.  The base defaults to 10.  Valid bases are 0 and 2-36.
Base 0 means to interpret the base from the string as an integer literal.

```


## Data-types
>**Python is a weakly typed language**, like JavaScript, you don't need to specify variable types.

To check the type of a variable `var`, use `type(var)`.

```py
>>> age=22
>>> type(age)
<class 'int'>

>>> name='Mauricio'
>>> type(name)
<class 'str'>
```

Alternatively, use the function `isinstance(a, B)`. This will compare if object `a` is an instance of class `B` .

```python
>>> isinstance(age, int)
True

>>> isinstance(name, float)
False
```


### Numbers
Can be of type `integer`, `float`, or `complex`.

When a binary arithmetic operator has operands of different numeric types, the following rule applies:

- The operand with the “narrower” type is widened to that of the other
	(from narrower to wider: `integer` < `float` < `complex`)

See the [official docs on Numeric Types](https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex) for:

- list of numeric operations
- list of `math` operations (`math.truc(x)`, `round(x[,n]`, `math.floor(x)`, `math.ceil(x)`)

See [docs on Bitwise Operations on Integers](https://docs.python.org/3/library/stdtypes.html#bitwise-operations-on-integer-types)


Notes:
- In a **Boolean context**:
	- zero values are false
	- non-zero values are true


### Strings: `str`

String are **immutable sequences of Unicode**.

Use single or double quotes. Triple quoted string can span multiple lines: 

```py
>>> program='Computer Science'

>>> course="Connected Objects"

>>> description="""An introduction to IoT
and Microsoft Azure using 
Python and a Raspberry Pi"""

>>> description
'An introduction to IoT\nand Microsoft Azure using \nPython and a Raspberry Pi'

>>> print(description)
An introduction to IoT
and Microsoft Azure using 
Python and a Raspberry Pi
```


The character `\` can be used to escape quotes and `\n` for new line:

```py
>>> sentence='Don\'t cut my string'
>>> sentence
"don't cut my string"

>>> print('C:\win32\new')
C:\win32\game
ew
```

To avoid interpreting special characters such as `\` , use raw strings by adding `r` before the first quote:

```py
>>> print(r'C:\win32\new')
C:\win32\new
```


Strings can be indexed. Since there is no separate character type; a character is simply a string of size one:

```py
>>> word = 'Python'
>>> word[0]  # character in position 0
'P'
```

Strings can also be **sliced**, however, since they are immutable, this **will produce a new string**.

```py
>>> word[2:5]  # characters from position 2 (included) to 5 (excluded)
'tho'

>>> word[:2]   # character from the beginning to position 2 (excluded)
'Py'
```

Mixing operators between numbers and strings is not supported:

```py
# ERROR!
>>> one = 1
>>> two = 2
>>> hello = "hello"

>>> print(one + two + hello)

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for +: 'int' and 'str'

```


#### String Methods

Since a string is a sequence of Unicode, it implements all of the [Common Sequence Operations](https://docs.python.org/3/library/stdtypes.html#typesseq-common).   

See the docs for a list of supported [String methods](https://docs.python.org/3/library/stdtypes.html#string-methods).


#### String formatting

There are currently two main ways of formatting strings: `str.format()` and f-strings.

> **F-strings are recommended** if using Python 3.6 or above. Some advantages:
> - Simpler syntax (similar to other modern languages)
> - Faster performance than  `str.format()` ()

F-strings are also called Formatted string literals. See [docs for details](https://docs.python.org/3/reference/lexical_analysis.html#f-strings).

To write an f-string, simple add a `f` or `F` in front of the string:

```py
>>> name = "Eric"
>>> age = 74
>>> f"Hello, {name}. You are {age}."
'Hello, Eric. You are 74.'

```

It is also possible to evaluate expressions or call functions inside an f-string:

```py
name = "Eric Idle"
>>> f"{name.lower()} is funny."
'eric idle is funny.'

```

See [Python 3's f-Strings: An Improved String Formatting Syntax (Guide)](https://realpython.com/python-f-strings/#python-f-strings-the-pesky-details) to learn more about f-strings and other string formatting approaches.

See docs for other advanced methods available in [Custom String Formatting](https://docs.python.org/3/library/string.html#custom-string-formatting)


#### Reading User Input

The built-in `input` function reads input from keyboard.

Notes:

-  It  **always** returns the data as a **string**
-   Format: `variable = input(prompt)`
	-    _prompt_ is typically a string instructing user to enter a value
    -   Does not automatically display a space after the prompt


### Sequence Types: `list`, `tuple`, `range`
There are three basic sequence types: **lists, tuples, and range objects**.
These are further divided into **Mutable** and **Immutable**.


#### Common Sequence Operations
[Common Sequence Operations](https://docs.python.org/3/library/stdtypes.html#typesseq-common) (official docs) lists all the operations supported by most sequences.


#### Mutable Sequence Operations
[Mutable Sequence Operations](https://docs.python.org/3/library/stdtypes.html#typesseq-mutable) (official docs) lists  all operations supported by mutable sequences.


#### Lists: "JS arrays"
Lists in Python are the equivalent of arrays in JS.
They are **mutable sequences**.

See the official Docs for [a summary of all List methods](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists).

```py
>>> a_list = ['example', True, 3.1416, 123]
[example', True, 3.1416, 123]

>>> a_list[-1]
123

>>> a_list.append(False)
[example', True, 3.1416, 123, False]

>>> 'example' in a_list
True

>>> a_list.index(123)
3
```

Notes on lists:

- Enclosed by square brackets.
- Lists are objects created from a Class.
- can store different data-types.
- can expand and shrink as required.
- negative index accesses items from the end (counting backwards).
- slicing a list creates a new list.
- list concatenation creates a new list in memory.


#### Tuples: immutable lists

Tuples are like Lists, however, **they are immutable**.

See docs for [Tuple data type](https://docs.python.org/3/library/stdtypes.html#tuples) and additional notes on [Tuples and Sequences](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences).

```py
>>> a_tuple = ('example', True, 3.1416, 123)
('example', True, 3.1416, 123)

>>> a_tuple[-1]
123

>>> a_tuple.append(False)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'tuple' object has no attribute 'append'

>>> 'example' in a_tuple
True

>>> a_tuple.index(123)
3
```

Notes:

- Created with brackets
- Ordered and searchable by index.
- Slice a tuple to create a new one.
- Search for an element in a Tuple with the operator `in` or the method `.index(target)`
- Tuples are **faster than lists**.
- Creates "write-protected" sequences.
- Tuples are immutable but they can contain mutable objects


### Dictionaries: mapping keys to objects
Python Dictionaries are **mutable objects** similar to JavaScript Objects.

A unique and unordered key is mapped to an arbitrary object.

See official docs for a [list of dictionary operations](https://docs.python.org/3/library/stdtypes.html#dict).

```py
>>> a_dict = {'server': 'db.jac.qc.ca', 'database': 'mysql', 'users': 62}
{'server': 'db.jac.qc.ca', 'database': 'mysql'}

>>> a_dict['server']
'db.jac.qc.ca'

>>> a_dict['database']='postgresql'
{'server': 'db.jac.qc.ca', 'database': 'postgresql', 'users': 62}

```

Notes:
- Dictionaries preserve insertion order.
- There are many ways to create dictionaries.
	- See [additional notes on Dictonaries](https://docs.python.org/3/tutorial/datastructures.html#dictionaries) from official documentation.


### Optional Typings
It is possible to declare variable types in Python.

This will help you with:
- Linting
- Type casting
- Type checking
- IntelliSence
- Some libraries like FastAPI can automatically create APIs based on Typings.

To inform Python of your data types:

```py
def function(name: str, age: int, valid: bool) -> bool:
```

See [Python Type Checking (Guide)](https://realpython.com/python-type-checking/) from realpython.com for more.

## Control Flow: if, for, range()

### If statements
If statements work similarly as other languages:
```py
>>> x = int(input("Please enter an integer: "))
Please enter an integer: 42

>>> if x < 0:
	    x = 0
	    print('Negative changed to zero')
	elif x == 0:
	    print('Zero')
	elif x == 1:
	    print('Single')
	else:
	    print('More')

More
```


### for ... in
The iteration loop `for in` works similarly as other languages:

```py
>>> words = ['cat', 'window', 'dog']

>>> for w in words:
	    print(w, len(w))

cat 3
window 6
dog 3
```


### break & continue

The `break` and `continue` statements work just like other languages.

`break` will break out of the inner-most loop iteration:

```py
>>> words = ['cat', 'window', 'dog']

>>> for w in words:
	    if w=='window':
			break
		print(w, len(w))

cat 3
```

`continue` will skip the loop iteration into the next iteration:

```py
>>> words = ['cat', 'window', 'dog']

>>> for w in words:
	    if w=='window':
			continue
		print(w, len(w))

cat 3
dog 3
```


### range() -> for loop

Python does not have a "traditional" for loop. Instead, it uses the `for in` combined with the `range()` function. 

The `range()` function returns an iterable arithmetic progression (a sequence of numbers).

```py
>>> list(range(5))
[0, 1, 2, 3, 4]
```

Note: To "see" the range we need to create a `list` from the iterable range. Otherwise, the range is not "expanded" until you iterate over it. See [The range() Function](https://docs.python.org/3/tutorial/controlflow.html#the-range-function) in the docs for details.

In order to create a for loop:

```py
>>> for i in range(5):
		print(i)

0
1
2
3
4
```

To iterate over the indices of a sequence:

```py
>>> a = ['Mary', 'had', 'a', 'little', 'lamb']
>>> for i in range(len(a)):
        print(i, a[i])

0 Mary
1 had
2 a
3 little
4 lamb
```


## Functions

Minimal definition of a function:

```py
def function():
	pass
```

Note: `pass` is used as a set of empty `{}` to satisfy the compiler.

With arguments and a return statement:

```py
def addition(a, b):
	return a + b
```


#### Optional arguments

Functions can take optional arguments by specifying their default values:
```py
def play_game(game, players=1):
	if players == 1:
		print(f'Playing {game} by myself')
	else:
		print(f'{game} is a lot more fun with more people')		
```

Above, the argument `game` is mandatory, however, if `players` is not provided, the default value of 1 will be used.


### Keyword & Positional Arguments

It's possible to identify arguments being passed to a function according to:
- the order in which they appear in the function call (positional arguments) or
- by specifying the argument's name

See the docs under [Keyword Arguments](https://docs.python.org/3/tutorial/controlflow.html#keyword-arguments) for more info.

Some notes:

- Positional arguments must always come before keyword arguments.
- All the keyword arguments passed must match one of the arguments accepted by the function.
- When a final formal parameter of the form `**name` is present, it receives a dictionary containing all keyword arguments except for those corresponding to a formal parameter.
- A formal parameter of the form `*name`  receives a tuple containing the positional arguments beyond the formal parameter list. (`*name` must occur before `**name`.)


## Classes

Below is the most basic class declaration that does not implements any methods or attributes:

```py
class Person:
	pass
```

The word `pass` is like an empty set of curly braces `{}` in other languages. It's there just to make it syntactically correct.


### `__init__()` constructor & instance attributes

A class that receives initialisation values should have a `__init__()` method. It is called immediately after the class is instantiated. Think of it as the "constructor".

```py
class Person:
	def __init__(self, name):
		self.name=name
```

> `self` is the first argument and **is mandatory**.
> It's a referee to the current class instance.

`self.name` inside the `__init__()` method is defining an instance attribute called `name`.


### Class methods

Similarly to the "special constructor" method `__init__()`, other methods can be defined inside the class:

```py
class Person:
	def __init__(self, name):
		self.name=name

	def greet(self):
		print(f"Greetings, my name is {self.name}.")
```

`self` must be passed to the method declaration. This is done so that the method has a reference to the class instance.


### Class instantiation

Call the class with the arguments specified by `__init__()`, except for `self`, which is added automatically by Python.

```py
class Person:
	def __init__(self, name):
		self.name=name

me=Person("Jimmy")
```


### Class inheritance

A new class can inherit from a parent class by including the parent class in its declaration:

```py
class Person:
	def __init__(self, name):
		self.name=name

class Student(Person):
	def __init__(self, name, student_number):
		self.student_number= student_number
		super().__init__(name)
```

Notes:
- Student class inherits from the Person class.
- Student class implements its own `__init__()` constructor with the added attribute `student_number`
- Once the Student's `__init__()` constructor is done, it calls its parent's constructor with `super().__init__(name)`
- The `super()` keyword gives a child class access to its parent's methods after this method has been overwritten.


## Exercises
1. Write a program which repeatedly reads numbers until the user enters “done”. Once “done” is entered, print out the total, count, and average of the numbers. If the user enters anything other than a number, detect their mistake using try and except and print an error message and skip to the next number.

```
Enter a number: 4
Enter a number: 5
Enter a number: bad data
Invalid input
Enter a number: 7
Enter a number: done
16 3 5.333333333333333
```
*(Exercise from [python for everybody](https://www.py4e.com/))*

2. Using the provided Vehicle class, create two vehicles called car1 and car2. Set car1 to be a red convertible worth $60,000.00 with a name of Fer, and car2 to be a blue van named Jump worth $10,000.00. Complete the missing `desc_str` so that the final output for car1 is "Fer is a red convertible worth $60000.0"

```python
class Vehicle:
    name = ""
    kind = "hatchback"
    color = ""
    value = 100.00

    def description(self):
       desc_str = ???   # missing description string
       return desc_str

# Missing object instantiation


# Once you are done, test your code with:

print(car1.description())
print(car2.description())
```
*(Exercise from [learnpython.org](https://www.learnpython.org/))*


