#!/bin/bash +x

PHALCON=$PWD/vendor/bin/phalcon.php

function pause(){
   read -p ""
}

function writeln() {
    echo -e "\n$*\n"
}

function reset() {

    writeln ' [*] Czyszczenie bazy, usuwanie migracji'

    echo "\$ rm -rvf app/migrations/*"
    echo "\$ echo '' > .phalcon/migration-version"
    echo "\$ mysql -uroot -ppass -h localhost -e 'DROP DATABASE IF EXISTS demo;CREATE DATABASE demo'"

    pause

    rm -rvf app/migrations/*
    echo '' > .phalcon/migration-version
    mysql -uroot -ppass -h localhost -e 'DROP DATABASE IF EXISTS demo;CREATE DATABASE demo'
}

cd demo

reset

writeln ' [1] Przykład pierwszy'

cp -R ../doc/samples/first/* ./app/migrations

set -x
ls -1 ./app/migrations
set +x

pause

$PHALCON migration run --log-in-db

writeln ' [1] Przykład pierwszy - cofnięcie do wersji'

pause

set -x
$PHALCON migration run --version=1.0.1 --log-in-db
set +x

pause

# ---------------------------------------------------------------------------------

reset

writeln ' [2] Przykład drugi'

cp -R ../doc/samples/second/* ./app/migrations

set -x
ls -1 ./app/migrations
set +x

pause

$PHALCON migration run --log-in-db

writeln ' [2] Przykład drugi - cofnięcie o dwie wersje'

pause

set -x
$PHALCON migration run --version=1.0.1 --log-in-db
set +x


# ---------------------------------------------------------------------------------

reset

writeln ' [3] Przykład trzeci'

cp -R ../doc/samples/third/* ./app/migrations

set -x
ls -1 ./app/migrations
set +x

pause

$PHALCON migration run --log-in-db

writeln ' [3] Przykład trzeci - cofnięcie o jedną wersję'

pause
set -x
$PHALCON migration run --version=1.0.2 --log-in-db
set +x

writeln ' [3] Przykład trzeci - cofnięcie o kolejną wersję'

pause

set -x
$PHALCON migration run --version=1.0.1 --log-in-db
set +x
