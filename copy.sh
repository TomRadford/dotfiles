#!/bin/zsh

echo "Copying Configuration Files..."
# Copying zshrc and p10k.zsh file from current directory to home:
cp .zshrc $HOME/.zshrc
# cp .zshrc $HOME/.p10k.zsh
# Copying .config folder from current directory to home:
cp -r .config $HOME/.config