#!/bin/bash
set -euo pipefail

cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

echo 'installing packages...'
sudo apt install -y $(cat packages.txt)

set -x
mkdir -p ~/.vim/colors
cp .vim/colors/snazzy.vim ~/.vim/colors
cp .bashrc ~
cp .vimrc ~
cp .global.gitignore ~

git config --global core.excludesfile ~/.global.gitignore
