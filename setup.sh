#!/bin/bash


function pause(){
   read -p ""
}

function writeln() {
    echo -e "\n * $*\n"
}


writeln 'Usunięcie aplikacji + instalacja "phalcon/devtools" '

echo '$ rm -rvf vendor > /dev/null'
echo '$ rm -rvf composer.json composer.lock > /dev/null'
echo '$ rm -rvf demo > /dev/null'
echo '$ composer require phalcon/devtools 3.1.1'

pause

rm -rvf vendor > /dev/null
rm -rvf composer.json composer.lock > /dev/null
rm -rvf demo > /dev/null
composer require phalcon/devtools 3.1.1
