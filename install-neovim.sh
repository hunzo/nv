#!/bin/bash

NEOVIM_VERSION=v0.10.1
curl -OL https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim-linux64.tar.gz

sudo tar xzvf nvim-linux64.tar.gz -C /usr/bin/
sudo ln -s /usr/bin/nvim-linux64/bin/nvim /usr/bin/nvim

rm nvim-linux64.tar.gz

sh -c "cat >> ~/.bashrc << EOF
export EDITOR=nvim
alias vim=nvim
set -o vi
EOF"
