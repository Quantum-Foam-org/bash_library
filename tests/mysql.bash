#!/bin/bash

. "../lib/bash.bash"

BASH_LIBS="../lib"

add_lib "print.bash"
add_lib "mysql.bash"

MYSQL_USER="amir_php"
MYSQL_PASSWORD="AKLsj03toiaust"
MYSQL_DB="http_web_spider"

sql_cmd "SELECT * FROM spidered_site"


function num_rows_test {
    print_heading "Number of Rows Test"
    
    get_numrows

    if [ $MYSQL_NUM_ROWS -ne 326 ]
    then
        print_error "Row count 326 does not match"
    else 
        print_success "Row 326 count matches"
    fi
}

function row_test {
    print_heading "Row Test"
    
    # test for row 
    get_row "$1"

    if [ $? -ne 0 ]
    then
        print_error "Row Not found"
    else
        print_success "ROW FOUND"
        
        if [[ ! $MYSQL_ROW[0] != $2 ]]
        then
            print_error "Row field value was not expected"
        else
            print_success "Row field value expected"
        fi
        
        echo $'\n'
        print_info "Contents of row"
        declare -pa MYSQL_ROW
        echo $'\n'
    fi
}

function undefined_row_test {
    print_heading "Undefined Row Test"
    
    # test for undefined row
    get_row "326"

    if [ $? -ne 1 ]
    then
        print_error "Unable to determine if the row is not set"
        ERROR=`printf "ROW: %s" "$MYSQL_ROW"`
        print_error $ERROR
    else
        print_success "Row was not set"
    fi
    echo $'\n'
}

row_test "0" "1813"
row_test "1" "1814"

num_rows_test

undefined_row_test
