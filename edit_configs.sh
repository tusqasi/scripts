#!/usr/bin/env bash


qtile_dir=~/.config/qtile
nvim_dir=~/.config/nvim
zsh_dir=~/.config/zsh
scripts_dir=~/scripts/

case $1 in
    s | S)
    /bin/ls $scripts_dir -1 |fzf -m --preview="bat --color=always $scripts_dir{}" |xargs -I{} echo $scripts_dir/{}| xargs nvim -c "set autochdir"
	;;
    * )
	 { 
	   find $zsh_dir -maxdepth 1 -name "*.zsh" ;
	   find $nvim_dir -maxdepth 2 -name "*.vim" | grep --invert-match '%' ;
	   find $qtile_dir -maxdepth 1 -name "*.py" ;
	 } |
 	 cut -d/ -f5- |
	 fzf -m --preview='bat --color=always ~/.config/{}' |xargs -I{} echo ~/.config/{} |xargs nvim -c "set autochdir"
	;;
esac
exit

    c | C)
	/bin/ls $qtile_dir |grep \\.py |fzf -m |xargs  -I {} echo "$qtile_dir/{}" |xargs nvim  -c "set autochdir"
	;;

    z | Z)

	find $zsh_dir -maxdepth 1 -name "*.zsh" |cut -d/ -f'5-' |fzf -m |xargs -I{} echo $zsh_dir/{} | xargs nvim -c "set autochdir"
	;;

    n | N)
	find $nvim_dir -maxdepth 2 -name "*.vim" |grep --invert-match "%" |cut -d/ -f'6-' |fzf -m |xargs -I{} echo $nvim_dir/{} | xargs nvim -c "set autochdir"
	;;
