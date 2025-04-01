#!/usr/bin/env bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

mkdir -p $HOME/.config/tmux
rm $HOME/.config/tmux/tmux.conf
ln -s $DOTFILES/tmux/tmux.conf $HOME/.config/tmux/tmux.conf

mkdir -p $HOME/.local/bin
rm -rf $HOME/.local/bin/t
rm -rf $HOME/.local/bin/battery
ln -s $DOTFILES/scripts/battery.sh $HOME/.local/bin/battery

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

rm -rf $HOME/.config/ghostty
ln -s $DOTFILES/ghostty $HOME/.config/ghostty

rm -rf $HOME/.config/kmonad
ln -s $DOTFILES/kmonad $HOME/.config/kmonad
