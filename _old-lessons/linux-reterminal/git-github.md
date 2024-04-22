# Working w/ Git & GitHub

## Using GitHub from reTerminal

When cloning a private repository to your reTerminal you might get a **Permission denied error**:

**Cloning with SSH**
```bash
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

**Cloning with HTTPS**
```shell
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authenti
cation.
fatal: Authentication failed for 'https://github.com/username/your-repo.git/'
```

This happens because your Pi is not authenticated to GitHub.

Authentication over SSH requires the setup of public/private SSH key.
Authentication over HTTPS requires the setup of OAuth tokens.

> Cloning over SSH is recommended for it's simplicity.
>
> --> Official Guide to [Cloning with SSH URLs](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-ssh-urls)

Authenticating over SSH involves the following steps (with links to official docs):

1. [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).
2. [Add the new SSH key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
3. [Test your new connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection).

