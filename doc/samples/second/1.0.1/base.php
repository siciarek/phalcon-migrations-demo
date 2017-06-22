<?php

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class BaseMigration_101
 */
class BaseMigration_101 extends Migration
{
    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {
        $sql =<<<SQL
CREATE TABLE book (
    id INT AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    description VARCHAR(255) NULL,
    info TEXT,
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
DROP TABLE book
SQL;

        self::$_connection->execute($sql);
    }

}
