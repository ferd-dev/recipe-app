<?php

namespace App\Models;

use App\Core\Model;
use PDO;

class Recipe extends Model
{
    protected $id;
    protected $categoryId;
    protected $userId;
    protected $image;
    protected $name;
    protected $description;
    protected $isActive;

    protected $search = "";

    public function getAllActive(int $page = 1, int $limit = 5): array
    {
        $offset = ($page - 1) * $limit;
        $sql = "SELECT * FROM recipes WHERE is_active = :is_active";
        if ($this->search) {
            $sql .= " AND (name LIKE :search OR description LIKE :search)";
        }
        $sql .= " LIMIT :limit OFFSET :offset";

        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':is_active', $this->isActive, PDO::PARAM_INT);
        if ($this->search) {
            $stmt->bindParam(':search', $this->search, PDO::PARAM_STR);
        }
        $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getActiveByCategory(int $page = 1, int $limit = 5): array
    {
        $offset = ($page - 1) * $limit;
        $sql = "SELECT * FROM recipes WHERE category_id = :category_id AND is_active = :is_active";
        if ($this->search) {
            $sql .= " AND name LIKE :search OR description LIKE :search";
        }
        $sql .= " LIMIT :limit OFFSET :offset";

        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':category_id', $this->categoryId, PDO::PARAM_INT);
        $stmt->bindParam(':is_active', $this->isActive, PDO::PARAM_INT);
        if ($this->search) {
            $stmt->bindParam(':search', $this->search, PDO::PARAM_STR);
        }
        $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
