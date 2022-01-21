# VS Code Setup

Below are the recommended steps to setup your VS Code for this course.

You can [download VS Code from this link](https://code.visualstudio.com/Download)

## Python Development

### Base Setup
Follow the official guide [Getting Started with Python in VS Code](https://code.visualstudio.com/docs/python/python-tutorial)

The guide covers the following steps:

1. Install the VS Code extension [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) by Microsoft. This extension includes:
		1. IntelliSense: with Pylance
		2. Linting: Pylint (default) and Flake8
		3. Code formatting: autopep (default), black or yapf
		4. Debugging
		5. Testing: Test Explorer or pytest
		6. Jupter Notebooks
		7. Virtual Environment support
	
![](assets/Pasted%20image%2020220121010400.png)

2. Install a Python interpreter (if not already installed).
3. Verify your Python installation.
4. Create a test project with a Hello World Python file.
5. Run the Hello World file from VS Code.
6. Configure and run the integrated debugger.

### Formatting & Linting 
Formatting will not fix your code, however, it will help you write more readable code.

Linting will analyze your code as you save it and tell you about errors before you run the code (remember, Python is an interpreted language, there is no compilation).


#### Formatting w/ autopep8

To help you write consistent Python, make sure the autopep8 code formatter is enabled.

1. Open a Python file and press the code formatting shortcut for your machine:
	**Linux**: Ctrl + Shift + I
	**Window**: Alt + Shift + F
	**macOS**: ⇧⌥F

2. Follow instructions to setup autopep8.

For details, see section "Formatting" of [Editing Python in Visual Studio Code](https://code.visualstudio.com/docs/python/editing)

#### Linting w/ Pylint

Follow the first step "Enable linters" in the guide [Linting Python in Visual Studio Code](https://code.visualstudio.com/docs/python/linting)

To learn more about the benefits of formatting and linting


## Resources

To learn more about the benefits of formatting and linting, see the video below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/P1B0ytn6VPU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

For examples of other VS Code extensions that can improve your dev experience, see the video below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/Z3i04RoI9Fk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
