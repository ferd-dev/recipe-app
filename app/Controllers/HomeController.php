<?php

namespace App\Controllers;

use App\Core\Controller;

class HomeController extends Controller
{
    public function index(): void
    {
        $data = ['title' => 'Home'];
        $this->view('home', $data);
    }
}
