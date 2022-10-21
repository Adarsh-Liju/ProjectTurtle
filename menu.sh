#!/bin/sh
# User can change this version
export PYTHON_MAJOR=3
# step 1 - Downloading prerequisites
# curl -client URL, is a command line tool that developers use to transfer data to and from a server
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
    source "$HOME/.cargo/env"

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
# Installing Python
python_build()
{
  # Installation of python3
  sudo apt install -y python3-dev python3-venv python3-pip
  # To check the version
  python$PYTHON_MAJOR -V

}
python_pip()
{
  sudo apt install -y python3-pip
  # To check the version
  pip$PYTHON_MAJOR -V

}


pip_req()
{
  pip3 install -r requirements.txt
}

# volta is a javascript tool manager 
volta_install()
{
    curl https://get.volta.sh | bash
    volta install node 
    volta install yarn 
    volta install npm
}

docker_prereq()
{
  sudo apt install gnome-terminal
  sudo apt remove docker-desktop
  rm -r $HOME/.docker/desktop
  sudo rm /usr/local/bin/com.docker.cli
  sudo apt purge docker-desktop
}
docker_install()
{
  docker_prereq()
  sudo apt-get update
  sudo apt-get install ./docker-desktop-<version>-<arch>.deb
  echo "docker version"
  docker compose version
  docker version
  echo "would you like to open docker on start? (Y/N)"
  read -r DOCKER_STARTUP
  case $DOCKER_STARTUP in 
    
      Y)
        systemctl --user enable docker-desktop
        ;;
      N)
        ;;
  esac

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

echo "Do you wish to install Node.js , npm , yarn (Y/N)"
read -r NPM_CHOICE
case $NPM_CHOICE in

  Y) echo "Installing Node.js , npm , yarn :-)"
    volta_install
     ;;
  N) echo "Skipping Node.js , npm , yarn"
     ;;
esac

echo "Do you wish to install Docker (Y/N)"
read -r DOCKER_CHOICE
case $DOCKER_CHOICE in

  Y) echo "Installing Docker :-)"
    docker_install
     ;;
  N) echo "Skipping Docker"
     ;;
esac
