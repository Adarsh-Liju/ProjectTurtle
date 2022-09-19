#!/bin/sh
# User ccan change this version
export PYTHON_VERSION=3.7.7
export PYTHON_MAJOR=3
function pre_requisite()
{
    sudo apt install curl wget 
}
function rust_install()
{

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

}
# Updates or refreshes everything
function update_system()
{
  sudo apt update
  sudo apt upgrade

}
function python()
{
function important_lib()
{
  # for apt systems

  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
       libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
       libncurses5-dev libncursesw5-dev xz-utils tk-dev
}
# Building Python from Source
function python_build()
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
function python_pip()
{
	cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3curl -O https://bootstrap.pypa.io/get-pip.py
	sudo /opt/python/${PYTHON_VERSION}/bin/python${PYTHON_MAJOR} get-pip.py

}
function npm_install()
{
  sudo ./install.sh
}
function main_menu()
{

  wel_msg="Welcome to Project Turtle\nThis Project's main blah blah  blah" # this part has to be completed 
  whiptail --msgbox --title "Project Turtle" "$wel_msg" 25 80 # you can also change the dimensions
  if (whiptail --title "Python 🐍" --yesno "Do you wish to install Python" 8 78); then
  echo "YES"
  else
  echo "NO"
  fi
}
main_menu
