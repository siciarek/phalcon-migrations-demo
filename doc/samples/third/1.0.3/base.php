<?php

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class BaseMigration_103
 */
class BaseMigration_103 extends Migration
{
    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {
        self::$_connection->insert(
            'user',
            [
                'Jan',
                'Chrzan',
                'j.chrzan@example.pl'
            ],
            [
                'first_name',
                'last_name',
                'email',
            ]
        );
    }

    /**
     * Reverse the migrations
     *
     * @return void
     */
    public function down()
    {
        self::$_connection->delete(
            'user',
            "email = 'j.chrzan@example.pl'"
        );
    }
}
