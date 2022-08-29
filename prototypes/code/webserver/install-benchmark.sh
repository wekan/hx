#!/bin/bash

# Install benchmark

sudo apt-get -y install git build-essential make cmake
mkdir ~/repos
cd ~/repos
git clone https://github.com/wg/wrk
cd wrk
make
cd ~/repos
