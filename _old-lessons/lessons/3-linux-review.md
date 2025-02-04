# Linux Review

The best way to learn is by trying.
If you don't have a Unix shell in your system (Linux or Mac), you can get one using the following:

- [WSL2 in Windows](https://learn.microsoft.com/en-us/windows/wsl/install)
- [JSLinux Terminal](https://bellard.org/jslinux/)
- [Copy.sh Terminal](https://copy.sh/v86/?profile=linux26)
- [JS/UIX Terminal](http://www.masswerk.at/jsuix/index.html)

## Resources & References

These are great references to get up to speed on using a Unix shell:

- [LinuxCommand.org](https://linuxcommand.org/index.php)
	- Short guides on learning bash shell and bash scripting.
	- Links to interactive learning games under "Adventures".
- [A to Z Linux CLI index](https://ss64.com/bash/) by ss64.com
	- If you know which command you are looking for, you will find it here.
- [Top 50+ Linux Commands You MUST Know](https://www.digitalocean.com/community/tutorials/linux-commands) by Digital Ocean
	- Includes examples for the most common commands.
- Bash Online Manual (brief), specially [Basic Shell Features](https://devdocs.io/bash/basic-shell-features)
	- Complete reference with examples.
	- You may treat this as "The Docs"


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

	- Try to reach at least level 5

