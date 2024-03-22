#!/bin/bash

/usr/bin/apt update -y
/usr/bin/apt upgrade -y
/usr/bin/apt install -y python3 python3-pip git
/usr/bin/pip3 install boto3

# preload with OS updates, the packages below installed,
#   and software required to run (install tools that install other supporting libraries or resources)
# install: python3, boto3, git
# for the Ubuntu distribution as stated in the tutorial