#!/usr/bin/bash

VIMRC_PATH=$1
REQUIRED_DEPENDENCIES=('vim' 'python3-pip')
YCM_DEPENDENCIES=('build-essential' 'cmake' 'vim-nox' 'python3-dev' 'mono-complete' 'golang' 'nodejs' 'default-jdk' 'npm')
PYTHON_DEPENDENCIES=('flake8')

if [ $# -eq 0  ]; then
     echo "Provide the path to the vimrc file as a cmd arg"
     exit 1
fi

echo "Moving vimrc to home directory"
cp $VIMRC_PATH ~/.vimrc

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing Plugins via :PlugInstall"
vim -c :PlugInstall


echo "Installing Vim-Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing required dependencies"
for dep in "${REQUIRED_DEPENDENCIES[@]}";do
     sudo apt install $dep
done

echo "Installing dependencies for Vim YouCompleteMe"
for dep in "${YCM_DEPENDENCIES[@]}";do
     sudo apt install $dep
done

echo "Running YCM Install Script"
YCM_DIR=('~/.vim/plugged/YouCompleteMe')

if [ ! -d "$YCM_DIR" ];then
     echo "${YCM_DIR} doesn't exist"
     exit 1
fi

cd $YCM_DIR
python3 install.py --all

echo "Installing Python Dependencies"
for dep in "${PYTHON_DEPENDENCIES[@]}";do
    pip3 install $dep
done
