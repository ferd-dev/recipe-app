<?php

namespace App\Core;

class Router
{
    public function dispatch($url)
    {
        $url = trim($url, '/');
        $parts = explode('/', $url);

        $controllerName = isset($parts[0]) && $parts[0] !== '' ? ucfirst($parts[0]) . 'Controller' : 'HomeController';
        $controllerClass = "App\\Controllers\\$controllerName";

        if (!class_exists($controllerClass)) {
            $this->notFoundPage("Controller $controllerName not found");
            return;
        }

        $controller = new $controllerClass();
        $method = isset($parts[1]) && $parts[1] !== '' ? $parts[1] : 'index';

        if (!method_exists($controller, $method)) {
            $this->notFoundPage("Method $method not found in $controllerName");
            return;
        }

        $params = array_slice($parts, 2);
        call_user_func_array([$controller, $method], $params);
    }

    private function notFoundPage($message)
    {
        $controllerClass = "App\\Controllers\\ErrorPageController";
        $controller = new $controllerClass();
        $controller->notFound($message);
    }
}
