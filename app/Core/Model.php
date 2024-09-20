<?php

namespace App\Core;

use App\Core\Database;
use Exception;

abstract class Model
{
    protected $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function __get(string $name)
    {
        if (property_exists($this, $name)) {
            return $this->$name;
        }

        throw new Exception("Property '$name' not found");
    }

    public function __set(string $name, $value): void
    {
        if (property_exists($this, $name)) {
            $this->$name = $value;
        } else {
            throw new Exception("Property '$name' not found");
        }
    }
}
