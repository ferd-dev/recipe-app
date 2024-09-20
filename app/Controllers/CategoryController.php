<?php

namespace App\Controllers;

use App\Core\Controller;
use App\Models\Category;

class CategoryController extends Controller
{
    public function getCategories(): void
    {
        $category = new Category();
        $category->isActive = true;
        $categories = $category->getAllActive();

        echo json_encode($categories);
    }
}
