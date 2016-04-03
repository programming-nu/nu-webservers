#!/bin/bash
#
# Use this script in a bare Ubuntu distribution to install 
# clang, libobjc2, GNUstep, and other dependencies that
# will allow you to build and run Nu.
#
# libobjc2 is an updated runtime that seeks compatibility 
# with Apple's modern Objective-C runtime. This new runtime
# allows Nu to be ported to Linux+GNUstep without difficulty.
#
# Tested with ubuntu-12.04.2-server-amd64.iso. 
# Other Ubuntu and Debian installations may also work well.
#
# Thanks to Tobias Lensing for pointing the way.
# http://blog.tlensing.org/2013/02/24/objective-c-on-linux-setting-up-gnustep-clang-llvm-objective-c-2-0-blocks-runtime-gcd-on-ubuntu-12-04/
#
mkdir /STARTUP
cd /STARTUP

sudo apt-get update
sudo apt-get install curl -y
sudo apt-get install ssh -y
sudo apt-get install git -y
sudo apt-get install libreadline-dev -y
sudo apt-get install libicu-dev -y
sudo apt-get install openssl -y
sudo apt-get install build-essential -y
sudo apt-get install clang -y
sudo apt-get install libblocksruntime-dev -y
sudo apt-get install libkqueue-dev -y
sudo apt-get install libpthread-workqueue-dev -y
sudo apt-get install gobjc -y
sudo apt-get install libxml2-dev -y
sudo apt-get install libjpeg-dev -y
sudo apt-get install libtiff-dev -y
sudo apt-get install libpng12-dev -y
sudo apt-get install libcups2-dev -y
sudo apt-get install libfreetype6-dev -y
sudo apt-get install libcairo2-dev -y
sudo apt-get install libxt-dev -y
sudo apt-get install libgl1-mesa-dev -y
sudo apt-get remove libdispatch-dev -y
sudo apt-get install gdb -y
#
# A few modifications were needed to fix problems with 
# libobjc2 and gnustep-base. To maintain stability, we
# work with a fork on github.
#

git clone https://github.com/nulang/gnustep-libobjc2.git
git clone https://github.com/nulang/gnustep-make.git
git clone https://github.com/nulang/gnustep-base.git
echo Installing libobjc2
export CC=clang
cd gnustep-libobjc2
make clean
make
sudo make install
cd /STARTUP

cd gnustep-make
./configure
make clean
make
sudo make install
cd /STARTUP

cd gnustep-base
./configure
make clean
make
sudo make install
cd /STARTUP

sudo apt-get install libdispatch-dev -y
echo Installation script finished successfully
git clone https://github.com/nulang/nu.git
cd nu
make
./mininush tools/nuke install
nuke install
cd /STARTUP

git clone https://github.com/nulang/nu-json.git
cd nu-json
nuke install
cd /STARTUP

sudo apt-get install libevent-dev -y
git clone https://github.com/nulang/libevhtp
cd libevhtp
cd build/
sudo apt-get install cmake -y
cmake ..
make
sudo make install
cd /STARTUP

sudo apt-get install libssl-dev -y
git clone https://github.com/nulang/nu-http.git
cd nu-http/
nuke
nuke install
cd /STARTUP

git clone https://github.com/nulang/nu-crypto.git
cd nu-crypto/
sudo apt-get install uuid-dev -y
nuke
nuke install
cd /STARTUP
echo "Ready, Player One."
                                 
