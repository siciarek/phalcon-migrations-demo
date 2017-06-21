#!/bin/bash -x


function pause(){
   read -p ""
}

function writeln() {
    echo -e "\n * $*\n"
}

rm -rvf vendor > /dev/null
rm -rvf composer.* > /dev/null


writeln 'Usunięcie aplikacji + instalacja "phalcon/devtools" '

read -p ''


composer require phalcon/devtools 3.1.1
