#### `cd`

Useful shorthands for `cd` to know:

```bash
# Change to user home directory 
# (usually: /home/username)
$ cd ~

# WSL: Change to Windows mounted directory
$ cd /mnt/c/

# Return to previous directory
$ cd -    # in this case, /home/username
```

#### `ls`

Useful `ls` options:

```bash
-l                     use a long listing format
-a, --all              do not ignore entries starting with .
-d, --directory        list directories themselves, not their contents
-s, --size             print the allocated size of each file, in blocks
-t                     sort by time, newest first; see --time
-h, --human-readable   with -l and -s, print sizes like 1K 234M 2G etc.
    --si               likewise, but use powers of 1000 not 1024
-R, --recursive        list subdirectories recursively
```
