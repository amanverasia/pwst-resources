#!/bin/bash

# Update and add necessary packages
echo "Installing Packages"
sudo apt update
sudo apt install -y fish terminator gedit python3-pip vim-gtk3 zaproxy

# Setup Rust and Rust tools
echo "Installing Rust and Rust tools"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
~/.cargo/bin/cargo install rustscan
~/.cargo/bin/cargo install feroxbuster

# Setup fonts
mkdir ~/Scripts
cd ~/Scripts
git clone https://github.com/danielmiessler/SecLists
git clone https://github.com/powerline/fonts
cd fonts
chmod +x install.sh
./install.sh
cd ~

# Setup Terminator
mkdir ~/.config/terminator
cp ./terminatorconfig ~/.config/terminator/config

# Setup Shell
curl -kL https://get.oh-my.fish | fish
fish -c "omf install bobthefish && exit"
echo "set -x PATH \$PATH $HOME/.cargo/bin" >> ~/.config/fish/config.fish
echo "Setup is complete! If you wish to use fish, run:\nchsh -s /usr/bin/fish"
