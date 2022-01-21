# Python Setup for VS Code

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

### Formatting w/ autopep8

To help you write consistent Python, make sure the autopep8 code formatter is enabled:

1. Open a Python file and press the code formatting shortcut for your machine:
	**Linux**: Ctrl + Shift + I
	**Window**: Alt + Shift + F
	**macOS**: ⇧⌥F

2. Follow instructions to setup autopep8

### Linting w/ Pylint

Follow the first step "Enable linters" in the guide [Linting Python in Visual Studio Code](https://code.visualstudio.com/docs/python/linting)
