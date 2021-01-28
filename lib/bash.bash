declare BASH_LIBS

function add_lib {
    BASH_FILE=`printf "%s/%s" "$BASH_LIBS" "$1"`
    if [ ! -f $BASH_FILE ]
    then
        echo printf "Cannot find library %s" "$1"
        exit 1
    else
        . $BASH_FILE
    fi
}
