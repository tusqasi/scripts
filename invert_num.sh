#!/usr/bin/env fish

# check INVERT_NUM

if test -z $INVERT_NUM
    xmodmap ~/scripts/invertedmaps
    set -U INVERT_NUM 1
else
    xmodmap ~/scripts/normalmaps
    set -U INVERT_NUM 0
end
