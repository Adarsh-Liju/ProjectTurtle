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
        ;;
    esac
}
python_verify
rust_verify
node_verify
volta_verify
docker_verify 