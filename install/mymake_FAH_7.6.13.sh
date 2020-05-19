#!/bin/bash
## 
# Script to download folding@home version 7.6.13 and install it to 
# specified TARGET directory
#
# Modulefile still needs to be built after install
#
# USE AT YOUR OWN RISK
##

URL="https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.6/fahclient-7.6.13-1.x86_64.rpm"

RPM=$(basename $URL)

VERSION="$(echo $RPM | cut -d '-' -f 2)"
TARGET="/packages/7x/fah/${VERSION}"

echo-red()     { echo "$(tput setaf 1)$@$(tput sgr0)"; }
echo-green()   { echo "$(tput setaf 2)$@$(tput sgr0)"; }
echo-yellow()  { echo "$(tput setaf 3)$@$(tput sgr0)"; }
echo-blue()    { echo "$(tput setaf 4)$@$(tput sgr0)"; }
echo-magenta() { echo "$(tput setaf 5)$@$(tput sgr0)"; }

dl() {
  echo-yellow DOWNLOADING
  wget -q $URL
  echo-green DOWNLOAD COMPLETE
}

build() {
  echo-yellow BUILDING
  rpm2cpio $RPM | cpio -idv
  echo-green BUILD COMPLETE
}

install() {
  echo-yellow INSTALLING TO $TARGET
  tput setaf 5
  cp -vr usr/bin $TARGET
  cp -v  usr/share/doc/fahclient/* $TARGET
  tput sgr0
  echo-green INSTALLED
  echo-red "UPDATE MODULE FILE"
}

dl && build && install || echo-red FAILURE
