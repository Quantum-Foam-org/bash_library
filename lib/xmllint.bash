XMLFILE=""
XMLLINT_CMD="/usr/bin/xmllint"
XMLOUTPUT=""


function xmllint_xpath {
    RES=0
    
    if [ -f $XMLFILE ]
    then
    
        XMLCMD=`printf "%s %s --xpath %s" "$XMLLINT_CMD" "$XMLFILE" "$1"`

        XMLOUTPUT=`$XMLCMD`

        if [ $? -ne 0 ]
        then
            print_error "xmllint command failed"
            RES=1
        fi
    else
        print_error "XML file not found"
        RES=2
    fi

    return $RES
}
