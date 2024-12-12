#!/usr/bin/env bash
# * (c) Copyright IBM Corporation. 2019
# * SPDX-License-Identifier: Apache-2.0
# * By Kip Twitchell
# This script initializes the Aerospike/CentOS vagrant environment with the following
# Elements needed to do Scala development
# (1) Update the OS upon initial startup
# (2) download wget for use in later commands
# (3) download and install Hercules System/370, ESA/390, and z/Architecture Emulator
MAKE_DIR="mkdir -p tk4-"
CHANGE_DIR="cd tk4-"
# (4) download or use git respository version of MVS38j operating system
# (5) download and install Java 8
# (6) download and install Scala 2.11 (to be potentially compatible with Spark if needed)
# (7) install sbt
# (8) start Hercules
CHANGE_TO_HOME="cd /home/vagrant/"
echo $CHANGE_TO_HOME
bash -c $CHANGE_TO_HOME | tr "\r" " " 
#cd /home/vagrant/
echo '****************************************************'
echo '************* update operating system  *************'
sudo yum -y update
echo '*********************************************'
echo '*************  install dos2unix     *************'
sudo yum -y install dos2unix
echo '*********************************************'
echo '*************  install wget     *************'
sudo yum -y install wget
echo '*********************************************'
echo '*************  install curl     *************'
sudo yum -y install curl
echo '*********************************************'
echo '************* install unzip     *************'
sudo yum -y install unzip
echo '******************************************************'
echo '************* download and install hercules **********'
#mkdir tk4-
echo $MAKE_DIR | tr "\r" " "
bash -c $MAKE_DIR | tr "\r" " "
echo $CHANGE_DIR | tr "\r" " "
bash -c $CHANGE_DIR | tr "\r" " "
#cd tk4- | tr "\n" " "
#wget http://wotho.ethz.ch/tk4-/tk4-_v1.00.zip
#wget --no-check-certificate https://wotho.pebble-beach.ch/tk4-/tk4-_v1.00.zip
curl -k -C - -O 'https://wotho.pebble-beach.ch/tk4-/tk4-_v1.00.zip' | tr "\r" " "
for z in *.zip; do unzip $z; done
echo '************************************************************************************'
echo '*****          Hercules VM for z installed, and TK4- MVS as well             *******'
echo '** see instructions at http://wotho.ethz.ch/tk4-/MVS_TK4-_v1.00_Users_Manual.pdf  **'
echo '**          console can be started via browser at http://127.0.0.1:8038           **'
echo '************************************************************************************'
cd /home/vagrant/tk4
./mvs
