#!/usr/bin/env bash
mkdir /mnt/data1
mkdir /mnt/data2
mkdir /mnt/data3
printf "\033c"
echo -ne "\u001b[32mEsta es tu Consola Interactiva.\u001b[m\r\n" > /dev/null
launch.sh
