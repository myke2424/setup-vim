#!/bin/bash

VIMRC_PATH=$1
HOME_DIR=$2
DEPENDENCIES=('vim' 'python3-pip' 'build-essential' 'cmake' 'vim-nox' 'python3-dev' 'mono-complete' 'golang' 'nodejs' 'default-jdk' 'npm')
PYTHON_DEPENDENCIES=('flake8')

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update

if [ ! -d "${HOME_DIR}/.vim" ]; then
     mkdir $HOME_DIR/.vim $HOME_DIR/.vim/plugged
fi


if [ $# -eq 0  ]; then
     echo "Provide the the following cmdline args: <vimrc_path> <home_dir>"
     exit 1
fi

echo "Moving vimrc to home directory"
cp $VIMRC_PATH $HOME_DIR/.vimrc

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing Plugins via :PlugInstall"
vim -c :PlugInstall


echo "Installing Vim-Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing dependencies"
for dep in "${DEPENDENCIES[@]}";do
     sudo apt install -y $dep
done

echo "Running YCM Install Script"
YCM_DIR="${HOME_DIR}/.vim/plugged/YouCompleteMe"

if [ ! -d "$YCM_DIR" ]; then
     echo "${YCM_DIR} doesn't exist"
     exit 1
fi

python3 $YCM_DIR/install.py --all

echo "Installing Python Dependencies"
for dep in "${PYTHON_DEPENDENCIES[@]}";do
     pip3 install $dep
done

echo "Sourcing vimrc"
source ~/.vimrc
