Phalcon Dev-Tools migrations
----------------------------



Command Line Interface
======================

Phalcon DevTools (3.1.2)

Help:
  Generates/Run a Migration

Usage: Generate a Migration
  migration generate

Usage: Run a Migration
  migration run

Usage: List all available migrations
  migration list

Arguments:
  help	Shows this help text

Options:
 --action=s             Generates a Migration [generate|run]
 --config=s             Configuration file
 --migrations=s         Migrations directory
 --directory=s          Directory where the project was created
 --table=s              Table to migrate. Default: all
 --version=s            Version to migrate
 --descr=s              Migration description (used for timestamp based migration)
 --data=s               Export data [always|oncreate] (Import data when run migration)
 --force                Forces to overwrite existing migrations
 --ts-based             Timestamp based migration version
 --log-in-db            Keep migrations log in the database table rather than in file
 --no-auto-increment    Disable auto increment (Generating only)
 --help                 Shows this help [optional]


Wartości domyślne opcji wymagających podania wartości
=====================================================

 --action=s
 --config=s             app/config/config.php
 --migrations=s         app/migrations
 --directory=s          ./ (sprawdza czy w podanej ścieżce znajduje się katalog .phalcon domyślnie szuka
                            w bieżącym, ustawienie umożliwia operacje na migracjach poza katalogiem projektu.
                            WAŻNE musi kończyć się / np. --directory=projects/demo nie zadziała. --directory=projects/demo/ TAK.)
 --table=s              (nie ma domyślnej wartości, ale jak nie jest podane bierze wszystkie tabele)
 --version=s            1.0.0
 --descr=s
 --data=s

Flagi
=====

 --force                Forces to overwrite existing migrations
 --ts-based             Timestamp based migration version
 --log-in-db            Keep migrations log in the database table rather than in file
 --no-auto-increment    Disable auto increment (Generating only)
 --help                 Shows this help [optional]

Zapisy równoważne
=================

    $ phalcon migration
    $ phalcon migration --help

    $ phalcon migration generate
    $ phalcon migration --action=generate

    $ phalcon migration run
    $ phalcon migration --action=run


Odpowiedniki opcji w konfigu projektu
=====================================

 --action=s
 --config=s
 --migrations=s         migrationsDir
 --directory=s
 --table=s
 --version=s
 --descr=s
 --data=s
 --force
 --ts-based             migrationsTsBased
 --log-in-db            logInDb
 --no-auto-increment

Zastosowanie "--force"
======================

siciarek@siciarek ~/Workspace/migdemoph $ ./vendor/bin/phalcon.php migration generate --version='1.0.2'  --log-in-db --directory=demo/
.
.
.
 Success: Version 1.0.2 was successfully generated



siciarek@siciarek ~/Workspace/migdemoph $ ./vendor/bin/phalcon.php migration generate --version='1.0.2'  --log-in-db --directory=demo/

Phalcon DevTools (3.1.1)

ERROR: Version 1.0.2 already exists


siciarek@siciarek ~/Workspace/migdemoph $ ./vendor/bin/phalcon.php migration generate --version='1.0.2' --force --log-in-db --directory=demo/
.
.
.
 Success: Version 1.0.2 was successfully generated


Ograniczenia na "--descr"
=========================

siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='Zażółć Gęślą Jaźń'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided

siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='zażółć_gęślą_jaźń'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided

siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='Ala Ma Kota'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided
siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='AlaMaKota'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided
siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='ala ma kota'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided
siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='ala.ma.kota'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided
siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='ala-ma-kota'

Phalcon DevTools (3.1.1)

ERROR: Wrong version number provided
siciarek@siciarek ~/Workspace/migdemoph/demo $ ./vendor/bin/phalcon.php migration generate --ts-based --descr='ala_ma_kota'

Phalcon DevTools (3.1.1)

1498082456.9287: SHOW TABLES FROM `demo`  => 1498082456.9291 (0.00042581558227539)
1498082456.9308: DESCRIBE `demo`.`phalcon_migrations`  => 1498082456.9315 (0.00074887275695801)
1498082456.9319: SHOW INDEXES FROM `demo`.`phalcon_migrations`  => 1498082456.9323 (0.00042104721069336)
1498082456.9325: SELECT DISTINCT KCU.TABLE_NAME, KCU.COLUMN_NAME, KCU.CONSTRAINT_NAME, KCU.REFERENCED_TABLE_SCHEMA, KCU.REFERENCED_TABLE_NAME, KCU.REFERENCED_COLUMN_NAME, RC.UPDATE_RULE, RC.DELETE_RULE FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC ON RC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME AND RC.CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA WHERE KCU.REFERENCED_TABLE_NAME IS NOT NULL AND KCU.CONSTRAINT_SCHEMA = 'demo' AND KCU.TABLE_NAME = 'phalcon_migrations'  => 1498082456.9586 (0.02603816986084)
1498082456.9588: SELECT TABLES.TABLE_TYPE AS table_type,TABLES.AUTO_INCREMENT AS auto_increment,TABLES.ENGINE AS engine,TABLES.TABLE_COLLATION AS table_collation FROM INFORMATION_SCHEMA.TABLES WHERE TABLES.TABLE_SCHEMA = 'demo' AND TABLES.TABLE_NAME = 'phalcon_migrations'  => 1498082456.9594 (0.00053787231445312)
1498082456.9597: DESCRIBE `demo`.`user`  => 1498082456.9602 (0.00053811073303223)
1498082456.9604: SHOW INDEXES FROM `demo`.`user`  => 1498082456.9607 (0.00025486946105957)
1498082456.9608: SELECT DISTINCT KCU.TABLE_NAME, KCU.COLUMN_NAME, KCU.CONSTRAINT_NAME, KCU.REFERENCED_TABLE_SCHEMA, KCU.REFERENCED_TABLE_NAME, KCU.REFERENCED_COLUMN_NAME, RC.UPDATE_RULE, RC.DELETE_RULE FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC ON RC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME AND RC.CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA WHERE KCU.REFERENCED_TABLE_NAME IS NOT NULL AND KCU.CONSTRAINT_SCHEMA = 'demo' AND KCU.TABLE_NAME = 'user'  => 1498082456.9805 (0.019641876220703)
1498082456.9806: SELECT TABLES.TABLE_TYPE AS table_type,TABLES.AUTO_INCREMENT AS auto_increment,TABLES.ENGINE AS engine,TABLES.TABLE_COLLATION AS table_collation FROM INFORMATION_SCHEMA.TABLES WHERE TABLES.TABLE_SCHEMA = 'demo' AND TABLES.TABLE_NAME = 'user'  => 1498082456.981 (0.00040102005004883)
1498082456.9812: DESCRIBE `demo`.`user_parameter`  => 1498082456.9817 (0.00047707557678223)
1498082456.9819: SHOW INDEXES FROM `demo`.`user_parameter`  => 1498082456.9822 (0.00027918815612793)
1498082456.9823: SELECT DISTINCT KCU.TABLE_NAME, KCU.COLUMN_NAME, KCU.CONSTRAINT_NAME, KCU.REFERENCED_TABLE_SCHEMA, KCU.REFERENCED_TABLE_NAME, KCU.REFERENCED_COLUMN_NAME, RC.UPDATE_RULE, RC.DELETE_RULE FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC ON RC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME AND RC.CONSTRAINT_SCHEMA = KCU.CONSTRAINT_SCHEMA WHERE KCU.REFERENCED_TABLE_NAME IS NOT NULL AND KCU.CONSTRAINT_SCHEMA = 'demo' AND KCU.TABLE_NAME = 'user_parameter'  => 1498082457.0016 (0.0193190574646)
1498082457.0018: SELECT TABLES.TABLE_TYPE AS table_type,TABLES.AUTO_INCREMENT AS auto_increment,TABLES.ENGINE AS engine,TABLES.TABLE_COLLATION AS table_collation FROM INFORMATION_SCHEMA.TABLES WHERE TABLES.TABLE_SCHEMA = 'demo' AND TABLES.TABLE_NAME = 'user_parameter'  => 1498082457.0022 (0.00039005279541016)

  Success: Version 1498082456922190_ala_ma_kota was successfully generated


Zabezpieczenie
--------------

    if ((1 !== preg_match('#^[\d]{7,}(?:\_[a-z0-9]+)*$#', $version)) && $version != '000') {
        throw new \InvalidArgumentException('Wrong version number provided');
    }
