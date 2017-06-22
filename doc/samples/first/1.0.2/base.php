<?php

use Phalcon\Db\Column;
use Phalcon\Db\Index;
use Phalcon\Db\Reference;
use Phalcon\Mvc\Model\Migration;

/**
 * Class BaseMigration_102
 */
class BaseMigration_102 extends Migration
{
    /**
     * Run the migrations
     *
     * @return void
     */
    public function up()
    {
        $sql =<<<SQL
CREATE TABLE profile (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    description VARCHAR(255) NULL,
    info TEXT,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

CREATE TABLE extra_profile (
    id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
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
DROP TABLE profile;
DROP TABLE extra_profile;
SQL;

        self::$_connection->execute($sql);
    }

}
