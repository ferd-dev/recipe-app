<?php

namespace App\Controllers;

use App\Core\Controller;

class ErrorPageController extends Controller
{
    public function notFound($meesage = 'Page Not Found'): void
    {
        die($meesage);
        $data = ['title' => 'Page Not Found'];
        $this->view('error/404', $data);
    }
}
