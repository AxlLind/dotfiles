#!/bin/bash
set -euo pipefail

cd "$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

set -x
mkdir -p ~/.vim/colors
cp .vim/colors/* ~/.vim/colors
cp .bashrc ~
cp .vimrc ~
cp .global.gitignore ~
