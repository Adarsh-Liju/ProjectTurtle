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

docker_install_repo()
{
  sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  (lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  sudo docker run SUCCESSFULLY INSTALLED
}
docker_install_package()
{
  sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
  ./docker-ce_<version>_<arch>.deb \
  ./docker-ce-cli_<version>_<arch>.deb \
  ./docker-compose-plugin_<version>_<arch>.deb

  sudo docker run SUCCESSFULLY INSTALLED
}
node_install()


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
    curl https://get.volta.sh | bash
}
go_install_snap()
{
  sudo snap install go --classic
}
go_install_apt()
{
  sudo apt update
  sudo apt upgrade

  sudo apt search golang-go
  sudo apt search gccgo-go

  sudo apt install golang-go
}
go_install_binary()
{
  VERSION="1.18.1" # go version
  ARCH="amd64" # go archicture
  curl -O -L "https://golang.org/dl/go${VERSION}.linux-${ARCH}.tar.gz"
  wget -L "https://golang.org/dl/go${VERSION}.linux-${ARCH}.tar.gz"
  ls -l

  curl -sL https://golang.org/dl/ | grep -A 5 -w "go${VERSION}.linux-${ARCH}.tar.gz"

  echo "b3b815f47ababac13810fc6021eb73d65478e0b2db4b09d348eefad9581a2334 *go${VERSION}.linux-${ARCH}.tar.gz" | shasum -a 256 --check

  tar -xf "go${VERSION}.linux-${ARCH}.tar.gz"
  ls -l
  cd go/
  ls -l
  cd ..

  sudo chown -R root:root ./go
  sudo mv -v go /usr/local

  vim ~/.bash_profile
  export GOPATH=$HOME/go
  export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

  source ~/.bash_profile
  go version
}
julia_install()
{
  wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.1-linux-x86_64.tar.gz
  tar zxvf julia-1.8.1-linux-x86_64.tar.gz

  nano ~/.bashrc
    . . .
  export PATH="$PATH:/home/sammy/julia-1.8.1/bin"
  source ~/.bashrc
  julia
}
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

echo "Do you wish to install Volta (Y/N)"
read -r VOLTA_CHOICE
case $VOLTA_CHOICE in

  Y) echo "Installing Volta :-)"
    volta_install

echo "Do you wish to install Docker (Y/N)"
read -r DOCKER_CHOICE
case $DOCKER_CHOICE in

  Y) echo "Installing Docker :-)"
    docker_install

     ;;
  N) echo "Skipping Docker"
     ;;


echo "Do you wish to install Docker? (Y/N)"
read -r DOCKER_CHOICE
case $DOCKER_CHOICE in
  Y) echo "Install Docker through Repository or Packages? (R/P)"
    read -r DOCKER_INSTALLATION_CHOICE
    case $DOCKER_INSTALLATION_CHOICE in
      R) docker_install_repo
          ;;
      P) docker_installation_package
          ;;
    esac
  N) echo "Skipping Docker Instalation"
      ;;
esac

echo "Do you wish to install GoLang using snap Package Installer? (Y/N)"
read -r GO_SNAP_CHOICE
case $GO_SNAP_CHOICE in

  Y) echo "Installing GoLang :-)"
    go_install_snap
     ;;
  N) echo "Skipping GoLang"
     ;;
esac

echo "Do you wish to install GoLang using Apt package Installer?(Y/N)"
read -r GO_APT_CHOICE
case $GO_APT_CHOICE in

  Y) echo "Installing GoLang :-)"
    go_install_apt
     ;;
  N) echo "Skipping GoLang"
     ;;
esac
 
 echo "Do you wish to install Go Binary? (Y/N)"
read -r GO_BINARY_CHOICE
case $GO_BINARY_CHOICE in

  Y) echo "Installing GO Binary :-)"
    go_install_binary
     ;;
  N) echo "Skipping GO Binary"
     ;;
esac

echo "Do you wish to install Julia (Y/N)"
read -r JULIA_CHOICE
case $JULIA_CHOICE in

  Y) echo "Installing Julia :-)"
    julia_install
     ;;
  N) echo "Skipping Julia"
     ;;
esac

