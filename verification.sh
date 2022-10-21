#!/bin/sh
python_verify()
{
    python3 --version
    if [ $? -q 0 ]; then
        echo "Python has been installed successfully"
    else
        echo "Python installation failed"
    fi
}
rust_verify()
{
    rustc --version
    if [ $? -q 0 ]; then
        echo "Rust has been installed successfully"
    else
        echo "Rust installation failed"
    fi
}
node_verify()
{
    node --version
    if [ $? -q 0 ]; then
        echo "Node has been installed successfully"
    else
        echo "Node installation failed"
    fi
}
volta_verify()
{
    volta --version
    if [ $? -q 0 ]; then
        echo "Volta has been installed successfully"
    else
        echo "Volta installation failed"
    fi
}
docker_verify()
{
    docker --version
    if [ $? -q 0 ]; then
        echo "Docker has been installed successfully"
    else
        echo "Docker installation failed"
    fi
}
python_verify
rust_verify
node_verify
volta_verify
docker_verify 