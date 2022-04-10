<?php

namespace App\Http\Controllers;

class HomeController extends Controller
{
    public function index()
    {
        return response()->json([
            'app' => 'Fake Netflix',
            'author' => 'Arko and Madhur',
            'email' => 'madhur@madhurdesigner.com'
        ]);
    }
}