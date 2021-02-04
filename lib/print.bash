#!/bin/bash


HEADING="\e[1;30;44m%15s\e[1;30;47m%40s%-20s\e[1;30;44m%15s\e[0m\n"
ERROR="\e[1;31;47mERROR:\t\e[0;31;40m %s\e[0m\n"
SUCCESS="\e[1;32;47mSUCCESS:\t\e[0;32;40m %s\e[0m\n"
INFO="\e[1;36;47mINFO:\t\e[0;36;40m %s\e[0m\n"

function print_heading {
    printf "$HEADING" "" "${1^^}" "" " "
}

function print_error {
    printf "$ERROR" "$1"
}

function print_success {
    printf "$SUCCESS" "$1" 
}

function print_info {
    printf "$INFO" "$1"
}
