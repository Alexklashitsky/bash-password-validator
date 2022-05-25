#!/bin/bash

########### color defnition

RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
NC=$'\e[0m'

########## functions for checing password params

function lowerCheck() {
    if [[ $userPass =~ [[:lower:]] ]]; then
        echo "the test is ${userPass}"
        echo -e "${GREEN}great${NC}"
        exit 0
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

############ main script

###ops section
while getopts "f:" OPTION; do
    case "$OPTION" in
    # the user promt  the file path
    f)
        input="$OPTARG"
        userPass=$(<$input)
        echo $userPass
        LEN=${#userPass}
        MIN=9
        if [ "$LEN" -gt "$MIN" ]; then
            digetCheck $userPass
        else
            echo -e " ${RED}the sugistet password too short${NC}"
            $(exit 1)
        fi
        ;;
    #the user promt somthing else
    ?)
        echo -e " ${RED}plese type -f and the path to the file ${NC}"
        exit 1
        ;;
    esac
done
shift "$(($OPTIND - 1))"
# the user type the password
read -p "Enter password" userPass
LEN=${#userPass}
MIN=9
if [ "$LEN" -gt "$MIN" ]; then
    digetCheck $userPass
else
    echo -e " ${RED}the sugistet password too short${NC}"
    $(exit 1)
fi
