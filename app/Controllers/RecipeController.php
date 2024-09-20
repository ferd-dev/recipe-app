<?php

namespace App\Controllers;

use App\Core\Controller;
use App\Models\Recipe;

class RecipeController extends Controller
{
    public function index(): void
    {
        $data = ['title' => 'Home'];
        $this->view('recipes/create', $data);
    }

    public function getRecipes($category_id): void
    {
        $page = $_GET['page'] ?? 1;
        $search = $_GET['search'] ?? "";


        $recipe = new Recipe();
        $recipe->isActive = true;
        $recipe->search = $search ? "%" . $search . "%" : "";

        $limit = 5;

        if ($category_id !== "todos") {
            $recipe->categoryId = $category_id;
            $recipes = $recipe->getActiveByCategory($page, $limit);
        } else {
            $recipes = $recipe->getAllActive($page, $limit);
        }

        echo json_encode($recipes);
    }
}
