#!/bin/sh
# User can change this version
export PYTHON_VERSION=3.7.7
export PYTHON_MAJOR=3
pre_requisite()
{
    sudo apt install curl wget
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
curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar -xvzf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}

./configure \
    --prefix=/opt/python/${PYTHON_VERSION} \
    --enable-shared \
    --enable-ipv6 \
    LDFLAGS=-Wl,-rpath=/opt/python/${PYTHON_VERSION}/lib,--disable-new-dtags

make
sudo make install

}
python_pip()
{
	cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3curl -O https://bootstrap.pypa.io/get-pip.py
	sudo /opt/python/${PYTHON_VERSION}/bin/python${PYTHON_MAJOR} get-pip.py

}
npm_install()
{
  curl -qL https://www.npmjs.com/install.sh | sh
}
volta_install()
{
    curl https://get.volta.sh | bash
}

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
    ;;
  N)
    echo "Skipping Rust and Cargo"
    ;;
esac

echo "Do you wish to install Node.js and npm"
read -r NPM_CHOICE
case $NPM_CHOICE in

  Y) echo "Installing Node.js and npm"
     ;;
  N) echo "Skipping Node.js and npm"
     ;;
esac
