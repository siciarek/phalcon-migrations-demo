<?php

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class UserMigration_101
 */
class UserMigration_101 extends Migration
{
    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {
        $sql =<<<SQL
    CREATE TABLE user (
        id INT AUTO_INCREMENT,
        first_name VARCHAR(32) NOT NULL,
        last_name VARCHAR(32) NOT NULL,
        PRIMARY KEY (id)
    ) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
SQL;

        self::$_connection->execute($sql);
    }

    /**
     * Reverse the migrations
     *
     * @return void
     */
    public function down()
    {
        $sql =<<<SQL
DROP TABLE user
SQL;

        self::$_connection->execute($sql);
    }

}
