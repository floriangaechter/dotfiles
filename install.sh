#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

mkdir -p $HOME/.config/tmux
rm $HOME/.config/tmux/tmux.conf
ln -s $DOTFILES/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

mkdir -p $HOME/.local/bin
rm -rf $HOME/.local/bin/t
rm -rf $HOME/.local/bin/battery
rm -rf $HOME/.local/bin/ghostty-tmux
ln -s $DOTFILES/scripts/t.sh $HOME/.local/bin/t
ln -s $DOTFILES/scripts/battery.sh $HOME/.local/bin/battery
ln -s $DOTFILES/scripts/ghostty-tmux.sh $HOME/.local/bin/ghostty-tmux

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/ghostty
ln -s $DOTFILES/ghostty $HOME/.config/ghostty
