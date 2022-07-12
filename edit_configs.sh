#!/usr/bin/env bash
set -e

qtile_dir=~/.config/qtile
nvim_dir=~/.config/nvim
zsh_dir=~/.config/zsh
fish_dir=~/.config/fish
awesome_dir=~/.config/awesome
scripts_dir=~/scripts
export previewer=batcat
if  command -v bat &> /dev/null; then
    export previewer="bat"
fi
case $1 in
    s | S)
    /bin/ls $scripts_dir -1 |fzf -m --preview="$previewer --color=always $scripts_dir{}" |xargs -I{} echo $scripts_dir/{}| xargs nvim -c "set autochdir"
	;;
    * )
	 { 
	   find $nvim_dir -maxdepth 3 -name "*.lua" ;
	   find $nvim_dir -maxdepth 2 -name "*.vim" ;
	   find $qtile_dir -maxdepth 2 -name "*.py" ;
	   find $zsh_dir -maxdepth 1 ;
	   find $fish_dir -maxdepth 1 -name "*.fish" ;
	   echo "/home/tusqasi/.config/alacritty/alacritty.yml" ;
	   echo "/home/tusqasi/.config/tmux/tmux.conf" ;
	 } |
 	 cut -d/ -f5- |
	 fzf -m --preview="$previewer --color=always ~/.config/{}" |xargs -I{} echo ~/.config/{} |xargs nvim -c "set autochdir"
	;;
esac
