<?php

namespace App\Models;

use App\Core\Model;
use PDO;

class Category extends Model
{
    protected $id;
    protected $name;
    protected $isActive;


    public function getAllActive(): array
    {
        $stmt = $this->pdo->prepare(
            "SELECT * FROM categories Where is_active = :is_active"
        );
        $stmt->bindParam(':is_active', $this->isActive, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
