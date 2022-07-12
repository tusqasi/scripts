#!/usr/bin/env bash

sudo apt update -y
sudo apt upgrade -y

mkdir clone

# install from list 
sudo apt install curl git wget firefox gparted refind alacritty fish vlc mpv python xdotool flameshot copyq ffmpeg scrcpy tmux -y


# install neovim 0.5<
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim -y 

# In fish
git clone --bare git@github.com:tusqasi/my_all_dot_files.git .cfg

/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi checkout master
fisher install jorgebucaran/nvm.fish
nvm install lts
nvm use lts


# tmux setup
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
.config/tmux/plugins/tpm
