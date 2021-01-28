FILE=""

function open_file {
    RETURN=0
    
    if [ ! -f $1 ]
    then
        RETURN=1;
    fi
    
    FILE=`< $1`
    
    return RETURN
}
