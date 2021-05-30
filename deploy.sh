#!/bin/bash
# Half of this file is copied from https://github.com/rexim/dotfiles/blob/master/deploy.sh

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

symlink() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")

    if [ ! -L "$destination" ]; then
        if [ -e "$destination" ]; then
            echo "[ERROR] $destination already exists but it's not a symlink"
	else
	    ln -sv "$filename" "$destination"
	fi
    else
        echo "[INFO]  $destination already symlinked"
    fi
}

echo SCRIPT_DIR is $SCRIPT_DIR
symlink .vimrc
symlink .gitconfig
