_This section was adapted from [@GNUTar135]._

The specific usecases for `tar`/`zip`/`unzip` are similar but vary slightly.

All three tools are used for efficient **storage**, **transfer**, and **backup** of
collections of files, particularly large files via **compression.**

- `tar`:
    - default: create/extract an *uncompressed* archive (`.tar`) of a collection of files
    - with `--gzip/-z`: create/extract a *compressed* archive (`.tar.gz`) of a collection of
        files
    - with `--bzip2/-j`: create/extract a *compressed* archive (`.tar.bz2`) of a collection
        of files
- `zip`:
    - create a compressed collection of files (`.zip`)
- `unzip`:
    - extract a compressed collection of files (`.zip`)

#### Operations

There are two main operations of interest for archiving programs:

- create: create a new archive (`.zip`, `.tar`, `.tar.gz`, `tar.bz2`)
- extract: extract the files of an archive to a directory

Examples of each follow below:

::: {.panel-tabset}

## Create

```bash
# Assume you have a directory called music/ and three folders inside it:
$ tree music
music/
├── blues
│   └── nina-simone
├── folk
│   └── phil-ochs
└── jazz
    └── charles-mingus

# Create an uncompressed archive (.tar) of all three files
$ tar --create --file=collection.tar music

# Creates a compressed archive (.zip, .tar.gz, .tar.bz2)
$ zip -r collection.zip music
$ tar --create --gzip --file=collection.tar.gz music
$ tar --create --bzip2 --file=collection.tar.bz2 music

# tar has shorthand versions of the above parameters
$ tar -c -f collection.tar music
$ tar -c -z -f collection.tar.gz music
$ tar -cjf collection.tar.bz2 music
```

::: {.callout-important .column-margin}

When using `--create` or `-c`, `tar` will **overwrite** current contents of the file named
by `-f`. To add files to an existing archive, you need to use `--append` or `-r`.

:::

## Extract

```bash
# Assume you have the archives from the Create example:
$ tar --list collection.tar
music/
├── blues
│   └── nina-simone
├── folk
│   └── phil-ochs
└── jazz
    └── charles-mingus

# Extract all files from an uncompressed archive (.tar) to the current directory
$ tar --extract --file=collection.tar

# Extract all files from a compressed archive (.zip, .tar.gz, .tar.bz2) to the current directory
$ unzip collection.zip
$ tar --extract --gzip --file=collection.tar.gz
$ tar --extract --bzip2 --file=collection.tar.bz2

# Extract all files from a compressed archive, specifying a different output directory
$ unzip collection.zip -d ~/some-folder
$ tar --extract --gzip --file=collection.tar.gz --directory ~/music
$ tar --extract --bzip2 --file=collection.tar.bz2 --directory /tmp/music

# tar has shorthand versions of the above parameters
$ tar -x -f collection.tar
$ tar -x -z -f collection.tar.gz -C ~/music
$ tar -xjf collection.tar.bz2 -C /tmp/music
```

:::

Each of these operations is **mutually exclusive**, which makes some sense. You cannot
**create** and **extract** an archive at the same time, that doesn't make sense!
