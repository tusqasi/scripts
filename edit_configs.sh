#!/usr/bin/env bash

# This option will stop running the script, on any error
# set -e
alacritty_dir=~/.config/alacritty
nvim_dir=~/.config/nvim
tmux_dir=~/.config/tmux/
zsh_dir=~/.config/zsh
qtile_dir=~/.config/qtile
i3_dir=~/.config/i3
scripts_dir=~/scripts
export previewer=batcat
if  command -v bat &> /dev/null; then
    export previewer="bat"
fi
{
    find $alacritty_dir -type f ;
    find $nvim_dir -maxdepth 3 -name "*.lua" ;
    find $nvim_dir -maxdepth 3 -name "*.vim" ;
    find $tmux_dir -maxdepth 1 -type f ;
    find $zsh_dir -maxdepth 1 -type f;
    find $i3_dir -maxdepth 1 -type f;
    find $scripts_dir -maxdepth 1 -type f;
    echo $HOME/.zshrc;
    echo $HOME/.bashrc;
    # find $fish_dir -maxdepth 1 -name "*.fish" ;
    # find $qtile_dir -maxdepth 2 -name "*.py" ;
} |
    fzf -m --preview="$previewer --color=always {}" |
    xargs -I{} echo {} | while read; do
  if [ $REPLY ]; then
    nvim -c "set autochdir" $REPLY
    exit
  fi
  echo $REPLY
done
