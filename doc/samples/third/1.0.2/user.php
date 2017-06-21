<?php

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class UserMigration_102
 */
class UserMigration_102 extends Migration
{
    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {
        $sql =<<<SQL
ALTER TABLE user ADD COLUMN email VARCHAR(127) NOT NULL AFTER id
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
ALTER TABLE user DROP COLUMN email
SQL;

        self::$_connection->execute($sql);
    }

}
