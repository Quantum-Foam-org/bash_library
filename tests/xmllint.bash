#!/bin/bash

. "../lib/bash.bash"

BASH_LIBS="../lib"

add_lib "print.bash"
add_lib "xmllint.bash"

XMLFILE="xml/test.xml"


function test_node_contents {
    print_heading "XMLLINT Test for Node Contents"
    
    xmllint_xpath "/bash_lib/bash_node[2]/text()"
    
    if [[ $XMLOUTPUT != "Text of Second Bash Node" ]]
    then
        print_error "Test for bash node contents failed"
    else
        print_success "Test for bash node succeeded"
    fi
    
    echo $'\n'
}

function test_node_count {
    print_heading "XMLLINT Test for Node Count"
    
    xmllint_xpath "count(/bash_lib/bash_node)"
    
    if [[ $XMLOUTPUT -ne 3 ]]
    then
        print_error "Test for bash node contents failed"
    else
        print_success "Test for bash node succeeded"
    fi
    
    echo $'\n'
}

test_node_contents

test_node_count
