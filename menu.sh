# Just updates or refereshes
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
  # We can change version if its bad
  wget https://www.python.org/ftp/python/3.8.4/Python-3.8.4.tgz


}
}
function main_menu()
{

  wel_msg="Welcome to Project Turtle\nThis Project's main blah blah  blah" # this part has to be completed 
  whiptail --msgbox --title "Project Turtle" "$wel_msg" 25 80 # you can also change the dimensions
  if (whiptail --title "Python 🐍" --yesno "Do you wish to install Python" 8 78); then
  echo "YES"
  python
  
  else
  echo "NO"
  fi
}
main_menu
