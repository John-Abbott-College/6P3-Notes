#!/usr/bin/env bash

add-apt-repository ppa:deadsnakes/ppa -y
apt update

apt install -y python3.11 python3.11-distutils
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# Who is adding the \r characters?!? Not me!! Maybe `zip`?
# Let's get rid of them.
sed -i 's/\r$//' /autograder/source/run_autograder

pip3.11 install -r /autograder/source/requirements.txt
