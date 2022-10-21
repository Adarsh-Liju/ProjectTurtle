#!/bin/sh
# User can change this version
export PYTHON_VERSION=3.7.7
export PYTHON_MAJOR=3
pre_requisite()
{
    sudo apt install curl wget cmake git
}
    

rust_install()
{

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

}
# Updates or refreshes everything
update_system()
{
  sudo apt update
  sudo apt upgrade

}
important_lib()
{
  # for apt systems

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
python_pip()
{
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  /opt/python/${PYTHON_VERSION}/bin/python get-pip.py


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
{
  sudo apt install nodejs
}
npm_install()
{
  curl -qL https://www.npmjs.com/install.sh | sh
}
volta_install()
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

update_system
pre_requisite
important_lib
update_system
echo "Do you wish to install Python (Y/N)"
read -r PYTHON_CHOICE
case $PYTHON_CHOICE in

    Y)
        echo "Installing Python and PIP :-)"
        python_build
        python_pip
        ;;
    N)
        echo "Skipping Python Install :-("
        ;;
esac
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

