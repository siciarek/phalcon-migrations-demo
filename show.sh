#!/bin/bash +x

export PTOOLSPATH=$PWD/vendor/phalcon/devtools

SCRIPT=$(basename $0)
PHALCON=$PWD/vendor/bin/phalcon.php
PROJECT_CONFIG=$PWD/demo/app/config/config.php
CREATE_DB=$(cat <<SQL

DROP DATABASE IF EXISTS demo;

CREATE DATABASE demo;

CREATE TABLE demo.user (
    id INT AUTO_INCREMENT,
    name VARCHAR(32),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

CREATE TABLE demo.user_parameter (
    id INT AUTO_INCREMENT,
    name VARCHAR(32),
    value VARCHAR(255),
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

SQL
)

function pause(){
   read -p ""
}

function writeln() {
    echo -e "\n$*\n"
}

clear

writeln ' * Reset bazy danych'

rm -rf demo

mysql -uroot -ppass -h localhost -e "$CREATE_DB"

echo -e "\n$CREATE_DB"

writeln ' * Tworzenie projektu "demo"'
pause

$PHALCON project demo simple


writeln ' * Aktualizacja konfiguracji projektu "demo"'
pause

set -x
sed -i "s/'host'        => 'localhost'/'host'        => '127.0.0.1'/g" $PROJECT_CONFIG
sed -i "s/'password'    => ''/'password'    => 'pass'/g" $PROJECT_CONFIG
sed -i "s/'dbname'      => 'test'/'dbname'      => 'demo'/g" $PROJECT_CONFIG
set +x

writeln ' * Wejście do katalogu projektu: cd ./demo i wyświetlenie pomocy'

cd ./demo

echo \$ phalcon migration --help

pause

$PHALCON migration --help

pause

clear

writeln ' 1. Generowanie migracji - zapis do pliku phalcon/migration-version'

# ----------------------------------------------------------------------------------

writeln '     1.1 Typowy sposób numeracji wersji (1.X.X) ZMIANA W KODZIE.'

echo \$ phalcon migration generate
echo \$ phalcon migration run

pause

$PHALCON migration generate
echo \$ ls -all app/migrations
ls -all app/migrations

pause


$PHALCON migration run

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

# ----------------------------------------------------------------------------------

writeln '     1.2 Typowy sposób numeracji wersji (1.X.X) kolejna wersja.'

echo \$ phalcon migration generate
echo \$ phalcon migration run

pause

$PHALCON migration generate
$PHALCON migration run

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

# ----------------------------------------------------------------------------------

writeln '     1.3 Typowy sposób numeracji wersji (1.X.X) kolejna wersja.'

echo \$ phalcon migration generate
echo \$ phalcon migration run

pause

$PHALCON migration generate
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

$PHALCON migration run
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

echo

# ----------------------------------------------------------------------------------

writeln '     1.4 Typowy sposób numeracji wersji (1.X.X) podbicie głównej wersji'

echo \$ phalcon migration generate --version=\'3.0.0\'
echo \$ phalcon migration run

pause

$PHALCON migration generate --version='3.0.0'
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

$PHALCON migration run
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

echo

# ----------------------------------------------------------------------------------

writeln '     1.5 Typowy sposób numeracji wersji (1.X.X) kolejna wersja'

echo \$ phalcon migration generate
echo \$ phalcon migration run

pause

$PHALCON migration generate
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

$PHALCON migration run
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

echo

# ----------------------------------------------------------------------------------

writeln '     1.6 Wyświetlenie listy migracji'

echo \$ phalcon migration generate
echo \$ phalcon migration list

pause

$PHALCON migration generate
$PHALCON migration list


echo
echo ----------------------------------------------------------------------------------

writeln ' 2. Generowanie migracji - zapis do bazy danych'

# ----------------------------------------------------------------------------------

writeln '     2.1 Typowy sposób numeracji wersji (1.X.X)'

echo \$ phalcon migration generate
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate
$PHALCON migration run --log-in-db

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

# ----------------------------------------------------------------------------------

writeln '     2.2 Typowy sposób numeracji wersji (1.X.X) kolejna wersja'

echo \$ phalcon migration generate
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate
$PHALCON migration run --log-in-db

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

# ----------------------------------------------------------------------------------

writeln '     2.3 Typowy sposób numeracji wersji (1.X.X) kolejna wersja'

echo \$ phalcon migration generate
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

$PHALCON migration run --log-in-db
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

echo

# ----------------------------------------------------------------------------------

writeln '     2.4 Typowy sposób numeracji wersji (1.X.X) podbicie głównej wersji'

echo \$ phalcon migration generate --version=\'4.0.0\'
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate --version='4.0.0'
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

$PHALCON migration run --log-in-db
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

echo

# ----------------------------------------------------------------------------------

writeln '     2.5 Typowy sposób numeracji wersji (1.X.X) kolejna wersja'

echo \$ phalcon migration generate
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

$PHALCON migration run --log-in-db
echo \$ ls -all app/migrations
ls -all app/migrations
echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version

echo

# ----------------------------------------------------------------------------------

writeln '     2.6 Wyświetlenie listy migracji'

echo \$ phalcon migration generate
echo \$ phalcon migration list

pause

$PHALCON migration generate
$PHALCON migration list

pause

# ----------------------------------------------------------------------------------

writeln '     2.7 Wyświetlenie listy migracji - tera JO!'

echo \$ phalcon migration list --log-in-db

pause

$PHALCON migration list --log-in-db

pause

echo
echo ----------------------------------------------------------------------------------

writeln ' 3. Generowanie migracji - zapis do bazy danych'

# ----------------------------------------------------------------------------------

writeln '     3.1 Numeracja oparta o timestampa (23434534534534_52134_cos_tam_cos_tam) - uwaga na dopuszczalne znaki'

echo \$ phalcon migration generate --ts-based --descr=52134_cos_tam_cos_tam
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate --ts-based --descr=52134_cos_tam_cos_tam
$PHALCON migration run --log-in-db

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

pause

writeln '     3.2 Przestawienie strategi na opartą o timestampa, czyszczenie bazy, usuwanie migracji'

echo "\$ rm -rvf app/migrations/*"
echo "\$ echo '' > .phalcon/migration-version"
echo "\$ mysql -uroot -ppass -h localhost -e 'TRUNCATE TABLE demo.phalcon_migrations'"

pause

rm -rvf app/migrations/*
echo '' > .phalcon/migration-version
mysql -uroot -ppass -h localhost -e 'TRUNCATE TABLE demo.phalcon_migrations'


writeln '     3.3 (POWTÓRKA) Numeracja oparta o timestampa (23434534534534_52134_cos_tam_cos_tam)'

echo \$ phalcon migration generate --ts-based --descr=52134_cos_tam_cos_tam
echo \$ phalcon migration run --log-in-db

pause

$PHALCON migration generate --ts-based --descr=52134_cos_tam_cos_tam
$PHALCON migration run --log-in-db

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

pause

writeln '     3.4 (POWTÓRKA) Numeracja oparta o timestampa (23434534534534_52134_cos_tam_cos_tam)'

echo \$ phalcon migration generate --ts-based --descr=52134_cos_tam_cos_tam
echo \$ phalcon migration run --ts-based --log-in-db

pause

$PHALCON migration generate --ts-based --descr=52134_cos_tam_cos_tam
$PHALCON migration run --ts-based --log-in-db

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

writeln '     3.5 (POWTÓRKA) Numeracja oparta o timestampa (23434534534534_52134_cos_tam_cos_tam)'

echo \$ phalcon migration generate --ts-based --descr=52134_cos_tam_cos_tam
echo \$ phalcon migration run --ts-based --log-in-db

pause

$PHALCON migration generate --ts-based --descr=52134_cos_tam_cos_tam
$PHALCON migration run --ts-based --log-in-db

echo \$ ls -all app/migrations
ls -all app/migrations

echo \$ cat .phalcon/migration-version
cat .phalcon/migration-version
echo

# ----------------------------------------------------------------------------------
