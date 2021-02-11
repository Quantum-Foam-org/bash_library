#!/bin/bash

MYSQL_USER=""
MYSQL_PASSWORD=""
MYSQL_DB=""
MYSQL_PORT=3306
MYSQL_CMD="/usr/bin/mysql"
MYSQL_RESULTS=
MYSQL_NUM_ROWS=0


function sql_cmd {
    IFS=$'\n'
    
    MYSQL_RESULTS=(`$MYSQL_CMD --batch -s -u$MYSQL_USER -p$MYSQL_PASSWORD -P$MYSQL_PORT $MYSQL_DB -e "$1"`)
   
    return $?
}

function sql_cmd_file {
    RES=0
    
    if [ -f $1 ]
    then
    
        IFS=$'\n'
        
        MYSQL_RESULTS=(`$MYSQL_CMD --batch -s -u$MYSQL_USER -p$MYSQL_PASSWORD -P$MYSQL_PORT $MYSQL_DB < "$1"`)
        
        RES=$?
        
        if [ $RES -ne 0 ]
        then
            print_error "MySQL command failed"
        fi
    else
        RES=159
        LOG=`sprintf "MySQL %s file not found" $1`
        print_error $LOG
    fi
    
    return $RES
}

function get_numrows {
    MYSQL_NUM_ROWS=${#MYSQL_RESULTS[@]}
}

function get_row {
    RET=0
    
    if [[ -v $MYSQL_RESULTS[$1] ]]
    then
        print_error "ROW NOT FOUND"
        RET=1
    fi
    
    IFS=$'\t'
    MYSQL_ROW=($MYSQL_RESULTS[$1])
    
    return $RET
}
