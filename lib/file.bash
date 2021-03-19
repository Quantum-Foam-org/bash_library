FILE=""

function read_file {
    RETURN=0
    
    if [ ! -f $1 ]
    then
        RETURN=1;
    fi
    
    FILE=`< $1`
    
    return RETURN
}

function write_file {
    RETURN=0
    
    echo $1;
    echo "$1" >> "$2"
    
    if [ ! -f $2 ]
    then
	    RETURN=1
    fi

    return $RETURN
}
