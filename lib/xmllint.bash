XMLFILE=""
XMLLINT_CMD="/usr/bin/xmllint"
XMLOUTPUT=""


function xmllint_xpath {
    RES=0
    
    XMLCMD=`printf "%s %s --xpath \"%s\"" "$XMLLINT_CMD" "$XMLFILE" "$1"`

    XMLOUTPUT=`bash -c "$XMLCMD"`

    if [ $? -ne 0 ]
    then
        print_error "xmlling command failed"
        RES=1
    fi

    return $RES
}
