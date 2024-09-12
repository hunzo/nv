#!/bin/bash
# install list
# - Golang
# - Python
# - Python-venv
# - Node Version Manager (nvm)


GO_VERSION=go1.22.6
NVIM_VERSION=v0.10.1
NVM_VERSION=v0.40.0

# -- install golang
curl -OL https://golang.org/dl/$GO_VERSION.linux-amd64.tar.gz

mkdir ~/.sdk
mkdir ~/.go

tar xzvf $GO_VERSION.linux-amd64.tar.gz -C ~/.sdk

sh -c "cat >> ~/.bashrc << 'EOF'
# golang setting
export GOPATH=\$HOME/.go
export GOROOT=\$HOME/.sdk/go
export GOBIN=\$GOPATH
export PATH=\$GOROOT/bin:\$GOBIN:\$PATH
EOF"

rm $GO_VERSION.linux-amd64.tar.gz

# -- set shell .bashrc
sh -c "cat >> ~/.bashrc << 'EOF'
show_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}
export PS1='\u@\h \[\e[32m\]\w \[\e[91m\]\$(show_git_branch)\[\e[00m\]$ '
EOF"

# show_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
# }

# export PS1="\[\e[38;5;214m\]\w \[\e[91m\]\$(show_git_branch)\[\e[m\]\[\033[32m\]❱\[\e[m\] "
# export PS1='\u@\h \[\e[32m\]\w \[\e[91m\]\$(show_git_branch)\[\e[00m\]$ '
# export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\]\[\e[38;5;214m\]\w\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[91m\]\$(show_git_branch)\[\e[00m\]\\$ "

# -- clear old neovim
rm -rf ~/.config/nvim

# optional but recommended
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

sudo rm -rf /usr/bin/nvim*


# -- add .bashrc
sh -c "cat >> ~/.bashrc << EOF
export EDITOR=nvim
alias vim=nvim
set -o vi
EOF"


# -- install neovim
curl -OL https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz

sudo tar xzvf nvim-linux64.tar.gz -C /usr/bin/
sudo ln -s /usr/bin/nvim-linux64/bin/nvim /usr/bin/nvim

rm nvim-linux64.tar.gz


# -- install python-venv
sudo apt install python3-venv -y
sudo apt install unzip -y
sudo apt install build-essential -y

# -- install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash

source ~/.nvm/nvm.sh

source ~/.bashrc

# -- install nodejs
# nvm install --lts
nvm install 18.20.4

# -- install ansible
# sudo apt-add-repository ppa:ansible/ansible
# sudo apt update -y
# sudo apt install ansible -y
