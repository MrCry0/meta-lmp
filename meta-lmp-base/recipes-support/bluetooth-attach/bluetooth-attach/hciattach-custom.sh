#!/bin/bash

if [[ -z $1 || -z $2 || -z $3 ]]; then
    echo Usage: $0 {tty} {speed} {proto}
    exit
fi

if grep -qE "(fsl,imx8mm-evkb|fsl,imx8mp-evk)" /proc/device-tree/compatible &>/dev/null; then
        echo imx8mm-evkb/imx8mp-evk found. Setting up the High Speed HCI interface...
        hciattach $1 any 115200 flow
        hciconfig hci0 up
        hcitool -i hci0 cmd 0x3f 0x0009 0xc0 0xc6 0x2d 0x00
        killall hciattach
        sleep 2
        hciattach $1 any -s $2 $2 flow
        hciconfig hci0 up && echo OK || echo FAIL
fi
