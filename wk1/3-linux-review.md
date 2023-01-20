# Linux Review

## Basic Tasks

Manipulation of the Raspberry Pi will require familiarity with the following tasks:

1. SSH into a remote machine
	- As a specific user.
	- Using a non standard port.
2. Maintaining system packages with `apt`
	- Update packages.
	- List information about a specific package
3. Manipulating text files and folders with:
	- List: `ls`
	- Copy: `cp`
	- Move: `mv`
	- Remove (recursively and not recursively): `rm`
	- Fire hierarchy with `tree`
4. Create files and folders
	- Create file: `touch`
	- Create folder `mkdir`
5. Edit, save and exit text files from the command line either:
	- `nano`
	- `vim`
6. File and folder access permissions
	- Check user permissions
	- Modify access permissions
7. Controlling tasks and processes:
	- `Ctrl-C`
	- `Ctrl-Z`
	- `jobs`
	- `fg`
	- `bg`
8. Run a Python script from the command line.
9. Inspecting and killing processes with:
	- `pgrep`
	- `pkill`
	- `kill`
10. Moving files from local machine to host and vice-versa.
	- `scp`
11. Appending to a file with redirection
	 - `>`
	 - `>>`
12. Piping command output
	  - `|`
13. Searching for words in text
	  - `grep`
	  - `less`

## Review Exercises

1. A great set of exercises to get started is the game [**Bandit** from *OverTheWire.org*](https://overthewire.org/wargames/bandit/)

	- Try to reach at least level 4

2. Use a Linux machine and come-up with one example for each of the commands above.
	As a Linux box you can use:
	- WSL2 in Windows
	- [JSLinux Terminal](https://bellard.org/jslinux/)
	- [Copy.sh Terminal](https://copy.sh/v86/?profile=linux26)
	- [JS/UIX Terminal](http://www.masswerk.at/jsuix/index.html)