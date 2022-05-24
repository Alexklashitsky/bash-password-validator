#!/bin/bash

# color defnition

RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
NC=$'\e[0m'

# functions for checing password params

function lowerCheck() {
    if [[ $userPass =~ [[:lower:]] ]]; then
        echo "the test is ${userPass}"
        echo -e "${GREEN}great${NC}"
    else
        echo -e " ${RED}no lower letars in the password ${NC}"
        $(exit 1)
    fi
}
function upperCheck() {
    if [[ $userPass =~ [[:upper:]] ]]; then
        lowerCheck $userPass
    else
        echo -e " ${RED}no upper letars in the password ${NC}"
        $(exit 1)
    fi
}
function digetCheck() {
    if [[ $userPass == *[[:digit:]]* ]]; then
        upperCheck $userPass

    else
        echo -e " ${RED}no digets in the password ${NC}"
        $(exit 1)
    fi
}

# main script

read -p "Enter password" userPass
LEN=${#userPass}
MIN=9
if [ "$LEN" -gt "$MIN" ]; then
    digetCheck $userPass
else
    echo -e " ${RED}the sugistet password too short${NC}"
    $(exit 1)
fi
