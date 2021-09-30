#!/bin/bash 
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
apt update -y
apt install python3-pip -y
PIP=$(which pip3)
PYTHON=$(which python3)
git clone https://github.com/rahul2662/flask-hello-world-1.git
cd flask-hello-world-1 && yes | $PIP install -r requirements.txt && $PYTHON hello.py
