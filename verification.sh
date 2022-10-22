#!/bin/sh
source menu.sh
python_verify()
{
    python3 --version
    case $? in 

    0)
        echo "Python has been installed successfully"
        ;;
    *)
        echo "Python installation failed"
        echo "starting reinstall"
        python_build
        python_pip
        ;;
    esac
}
rust_verify()
{
    rustc --version
    case $? in
    0)
        echo "Rust has been installed successfully"
        ;;
    *)
        echo "Rust installation failed"
        echo "starting reinstall"
        rust_install
        ;;
    esac
}
node_verify()
{
    node -v
    case $? in
    0)
        echo "Node has been installed successfully"
        ;;
    *)
        echo "Node installation failed"
        echo "starting reinstall"
        volta_install
        ;;
    esac
}
volta_verify()
{
    volta --version
    case $? in 
    0)
        echo "Volta has been installed successfully"
        ;;
    *)
        echo "Volta installation failed"
        echo "starting reinstall"
        volta_install
        ;;
    esac
}
docker_verify()
{
    docker --version
    case $? in
    0)
        echo "Docker has been installed successfully"
        ;;
    *)
        echo "Docker installation failed"
        echo "starting reinstall"
        docker_install
        ;;
    esac
}
# first installation
update_system
pre_requisite
important_lib
update_system
python_build
python_pip
rust_install
volta_install
docker_install
# verification
python_verify
rust_verify
node_verify
volta_verify
docker_verify 