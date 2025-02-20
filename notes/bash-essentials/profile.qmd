Every time you log in to a linux user, the `~/.profile` file is read and executed.

The typical usecases for customizing `~/.profile` are:

- setting environment variables INDEPENDENT of bash instances
    - i.e., these variables will work in sh, zsh, and other shells
- setting environment variables once per session
    - particularly useful for `PATH`, since setting it in `~/.bashrc` will cause it to be
        updated more frequently than useful

Examples of these are shown below:

```bash {filename=~/.profile}
# Add a directory to PATH, checking if that directory is not already in PATH first
if ! [[ "$PATH" =~ "$HOME/bin:" ]]; then
  export PATH="$PATH:$HOME/bin"  # Adds ~/bin to your path
fi

# Source all profile files in ~/.profile.d/
# This is useful for programs like npm, you can put its bashrc/path stuff in here instead.
for script in $HOME/.profile.d/*.sh ; do
	if [ -r "$script" ] ; then
		. "$script"
	fi
done
unset script
# See https://ss64.com/bash/source.html for more info on sourcing
```
