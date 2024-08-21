<?php

namespace App\Core;

use App\Core\Database;

abstract class Model
{
    protected $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }
}
