#!/bin/bash

MONGO_CMD="/usr/bin/mongo"
MONGO_RESULTS=""
MONGO_USER=""
MONGO_DB=""
MONGO_PASSWORD=""
MONGO_HOST=""
MONGO_PORT="27017"


function nosql_cmd {
    IFS=$'\n'
    
    MONGO_RESULTS=(`$MONGO_CMD --host --port $MONGO_PORT $MONGO_DB --eval '$1'`)
   
    return $?
}

function nosql_cmd_file {
    RES=0
    
    if [ -f $1 ]
    then
        IFS=$'\n'
        
        MONGO_RESULTS=(`$MONGO_CMD --host --port $MONGO_PORT $MONGO_DB '$1'`)
        RES=$?
        if [ $RES -ne 0 ]
        then
            print_error "MONGO command failed"
        fi
   else
        RES=159
        LOG=`sprintf "MONGO %s file not found" $1`
        print_error $LOG
   fi

   return $?
}
