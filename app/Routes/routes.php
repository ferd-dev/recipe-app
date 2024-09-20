<?php

use FastRoute\RouteCollector;

return function (RouteCollector $r) {
    $r->addRoute('GET', '/', ['App\Controllers\HomeController', 'index']);
    $r->addRoute('GET', '/getCategories', ['App\Controllers\CategoryController', 'getCategories']);
    $r->addRoute('GET', '/getRecipes/{categoryId}', ['App\Controllers\RecipeController', 'getRecipes']);
};
