#!/bin/sh
# User can change this version
export PYTHON_VERSION=3.7.7
export PYTHON_MAJOR=3

#step 1 - Downloading prerequisites 
#curl -client URL, is a command line tool that developers use to transfer data to and from a server
#Wget is the non-interactive network downloader which is used to download files from the server even when the user has not logged on to the system
#The "cmake" executable is the CMake command-line interface
pre_requisite()
{
    sudo apt install curl wget cmake git
}
    
#This command is used to install rust . It does platform detection, downloads the installer and runs it.
rust_install()
{

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

}
# Updates or refreshes everything . Gets the latest versions of available required software 
update_system()
{
  sudo apt update
  sudo apt upgrade

}
important_lib()
{
  # for apt systems
  # build-essential has gcc compiler 
  # readline is a method that reads each line of string or values from a standard input stream
  # ncurses provides an API, allowing the programmer to write text-based user interface

  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev 
}
# Building Python from Source
python_build()
{
  # Downloading Python
  wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
  tar -xvf Python-$PYTHON_VERSION.tgz
  cd Python-$PYTHON_VERSION
  ./configure --enable-optimizations
  make -j 8
  sudo make altinstall
  # To check the version
  python$PYTHON_MAJOR -V

}

# Pip is a package management system for managing packages written in Python
python_pip()
{
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  /opt/python/${PYTHON_VERSION}/bin/python get-pip.py


}

pip_req()
{
  pip3 install -r requirements.txt
}

# The following 2 codes install node js and node package manager 
node_install()
{
  sudo apt install nodejs
}

npm_install()
{
  curl -qL https://www.npmjs.com/install.sh | sh
}

# volta is a javascript tool manager 
volta_install()
{
    curl https://get.volta.sh | bash
}

update_system
pre_requisite
important_lib
update_system


echo "Do you wish to install Python (Y/N)"
read -r PYTHON_CHOICE
case $PYTHON_CHOICE in

    Y)
    #no need to call functions with brackets in shell ...
        echo "Installing Python and PIP :-)"
        python_build
        python_pip
        ;;
    N)
        echo "Skipping Python Install :-("
        ;;
esac
# esac closes a case statement 
echo "Do you wish to install Rust (Y/N)"
read -r RUST_CHOICE
case $RUST_CHOICE in

  Y)
    echo "Installing Rust and Cargo :-)"
    rust_install
    ;;
  N)
    echo "Skipping Rust and Cargo"
    ;;
esac

echo "Do you wish to install Node.js and npm (Y/N)"
read -r NPM_CHOICE
case $NPM_CHOICE in

  Y) echo "Installing Node.js and npm :-)"
    node_install
    npm_install
     ;;
  N) echo "Skipping Node.js and npm"
     ;;
esac


echo "Do you wish to install Volta (Y/N)"
read -r VOLTA_CHOICE
case $VOLTA_CHOICE in

  Y) echo "Installing Volta :-)"
    volta_install
     ;;
  N) echo "Skipping Volta"
     ;;
esac

