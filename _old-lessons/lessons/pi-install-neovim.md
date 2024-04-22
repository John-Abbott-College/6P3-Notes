# Install NeoVim on RPI

```bash
# Install `snapd` on system.
sudo apt update
sudo apt install snapd
sudo reboot
```

```bash
# Install the `core` snap of `snapd`
sudo snap install core
```

```bash
# Install neovim stable
sudo snap install nvim --classic
```

```bash
# Create alias for snap nvim
echo "alias nvim=/snap/bin/nvim" > ~/.bash_aliases
```

```bash
# Install xclip for clipboard support with ssh graphical session `-Y`
sudo apt install xclip
```

## Install AstroNVIM

After installing the snap for nvim:

```bash
# Install a Nerd Fonts (FiraCode)
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip

# Font installation according to Debian's docs: https://wiki.debian.org/Fonts
# Move to systam-wide font folder
sudo mv *.ttf /usr/local/share/fonts/
# update the font cache
fc-cache
```

```bash
# Follow AstroNvim install instructions: https://astronvim.github.io/#%EF%B8%8F-installation

# Make a backup of your current nvim folder
mv ~/.config/nvim ~/.config/nvim.bak
# Clean neovim folders (Optional but recommended)
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
# Clone the repository
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

## Install Node 

Installing node is not required but will improve compatibility with modern nvim features:

```bash
# Install Node.js using nvm according to https://github.com/nvm-sh/nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# source .bashrc to pickup env variables
source ~/.bashrc
# install the latest version of node
nvm install node
```

```bash
# Install Tree-sitter CLI
npm install tree-sitter-cli
```
