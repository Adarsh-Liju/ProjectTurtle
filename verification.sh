#!/bin/sh
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
golang_verify()
{
    go version
    case $? in
    0)
        echo "Golang has been installed successfully"
        ;;
    *)
        echo "Golang installation failed"
        echo "starting reinstall"
        go_install_apt
        ;;
    esac
}
julia_verify()
{
    julia --version
    case $? in
    0)
        echo "Julia has been installed successfully"
        ;;
    *)
        echo "Julia installation failed"
        echo "starting reinstall"
        julia_install
        ;;
    esac
}
# calling the functions
python_verify
rust_verify
node_verify
volta_verify
docker_verify 
golang_verify
julia_verify
