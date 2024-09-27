#!/bin/bash

declare -l name=`awk 'BEGIN { FS="=" } /NAME/ { print $2; exit }' /etc/os-release`

case $name in
  *"opensuse"* )
    echo 
    ;;
  *"ubuntu"* )
    echo 
    ;;
  *"nixos"* )
    echo 
    ;;
  *"arch"* )
    echo 
    ;;
  * )
    echo 
    ;;
esac 
