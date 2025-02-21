Every time you open a new terminal window/tab in the bash shell, the `~/.bashrc` file is
read and executed.

The typical usecases for customising `~/.bashrc` are:

- setting a custom [Command prompt](https://ss64.com/bash/syntax-prompt.html)
- setting various useful `shopts` (shell options)
- setting environment variables/aliases
- sourcing other bash files

Examples of each of these are shown below.

```bash {filename=~/.bashrc}
# Set a prompt like: [username@hostname:~/CurrentWorkingDirectory]$
export PS1='[\u@\h:\w]\$ '
#   Explanation:
#   \u: username
#   \h: hostname
#   \w: the current working directory
#   \$: the character $
#   all other characters are interpreted literally
#   See https://ss64.com/bash/syntax-prompt.html for more examples

# Set useful shell options
shopt -s autocd # auto-appends `cd` to directory, so you can cd to a path without writing `cd`
shopt -s globstar # enables the pattern '**' for recursive file/directory wildcard matching
shopt -s extglob # fancier pattern matching
# See https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html for more options

# Set environment variables/aliases
export EDITOR="nvim" # neovim
export EDITOR="code" # vscode (overwrites previous line)
# See https://ss64.com/bash/export.html for more information

alias ll="ls -l" # create new alias ll for a long list
alias cp="cp -iv" # replace default cp command with interactive/verbose cp
# See https://ss64.com/bash/alias.html for more alias info and examples
# Note that aliases cannot handle complex logic or accept positional parameters
# For that, we would need functions.

# Source all bash files in ~/.bashrc.d/
# This lets you define functions in various shell files in this folder and source them at startup.
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			source "$rc"
		fi
	done
fi
unset rc
# See https://ss64.com/bash/source.html for more info on sourcing
```

#### Ever Wonder Why it’s Called .bashrc?

There are many files that end with the mysterious suffix `rc` like `.bashrc`, `.vimrc`, etc. 
Why is that? It’s a holdover from ancient Unix. Its original meaning was "run commands," but it later became
"run-control." A run-control file is generally some kind of script or configuration file
that prepares an environment for a program to use. In the case of `.bashrc` for example,
it’s a script that prepares a user’s bash shell environment.

