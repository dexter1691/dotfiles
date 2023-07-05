#!/usr/bin/env bash

# The URL of the Anaconda distribution.
# This link may change over time, so be sure to check the official download page.
ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh"

# Update the package lists for upgrades and new package installations
sudo apt update

# Install Packages.
sudo apt install -y zsh tmux fzf

# Make Zsh the default shell
sudo chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # zsh-autosuggestions
# install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# install zsh-fzf-history-search
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search

# Git clone dotfiles project
cp ../.zshrc ~/
cp ../.tmux.conf ~/
cp ../.bash_profile ~/
cp ../.condarc ~/

# Download the Anaconda bash script
wget $ANACONDA_URL -O anaconda.sh

# Make the Anaconda bash script executable
chmod +x anaconda.sh

# Run the Anaconda Installer
# The -b flag means to run in batch mode, so you don't have to manually answer the prompts
./anaconda.sh -b

# Optional: Remove the installer shell script
rm anaconda.sh

# Add Anaconda to PATH (assumes .zshrc exists)
echo "export PATH=\"$HOME/anaconda3/bin:\$PATH\"" >> ~/.zshrc