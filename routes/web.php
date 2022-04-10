<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

// example closure (inline function) route
// $router->get('/', function () use ($router) {
//     return $router->app->version();
// });

$router->get('/', [
    'as' => 'home.index',
    'uses' => 'HomeController@index'
]);

// Songs
// GET /api/songs maps to SongController function index, and lists songs
$router->get('/api/songs', [
    'as' => 'api.songs.index',
    'uses' => 'SongController@index',
    // 'middleware' => ['auth']
]);

// GET /api/songs/{id} maps to SongController function show, and shows a specific movie
$router->get('/api/songs/{id}', [
    'as' => 'api.songs.show',
    'uses' => 'SongController@show'
]);

// POST /api/songs maps to SongController function store, which creates/stores a new song
$router->post('/api/songs', [
    'as' => 'api.songs.store',
    'uses' => 'SongController@store'
]);

// PATCH /api/songs/{id} maps to SongController function update, which updates a specific movie
$router->patch('/api/songs/{id}', [
    'as' => 'api.songs.update',
    'uses' => 'SongController@update'
]);

// DELETE /api/songs/{id} maps to SongController function destroy, which deletes the given song
$router->delete('/api/songs/{id}', [
    'as' => 'api.songs.delete',
    'uses' => 'SongController@destroy'
]);

// Countries

// GET /api/countries
$router->get('/api/countries', [
    'as' => 'api.countries.index',
    'uses' => 'CountryController@index'
]);

// GET /api/countries/{id}
$router->get('/api/countries/{id}', [
    'as' => 'api.countries.show',
    'uses' => 'CountryController@show'
]);

$router->get('/api/movie', [
    'as' => 'api.movie.list',
    'uses' => 'MovieController@list',
]);


//Movie 

// GET /api/songs maps to SongController function index, and lists movies
$router->get('/api/movies', [
    'as' => 'api.movies.index',
    'uses' => 'MovieController@index',
    // 'middleware' => ['auth']
]);
//Show Only Movies For Adult

$router->get('/api/movies/onlyadult', [
    'as' => 'api.movie.onlyadult',
    'uses' => 'MovieController@onlyadult'
]);

//Show Only Movies For Kids

$router->get('/api/movies/onlykids', [
    'as' => 'api.movie.onlykids',
    'uses' => 'MovieController@onlykids'
]);
// GET /api/movies/{id} maps to SongController function show, and shows a specific movie
$router->get('/api/movies/{id}', [
    'as' => 'api.movies.show',
    'uses' => 'MovieController@show'
]);

// POST /api/movies maps to SongController function store, which creates/stores a new movie
$router->post('/api/movies', [
    'as' => 'api.movies.store',
    'uses' => 'MovieController@store'
]);

// PATCH /api/movies/{id} maps to SongController function update, which updates a specific movie
$router->patch('/api/movies/{id}', [
    'as' => 'api.movies.update',
    'uses' => 'MovieController@update'
]);

// DELETE /api/movies/{id} maps to SongController function destroy, which deletes the given movie
$router->delete('/api/movies/{id}', [
    'as' => 'api.movies.delete',
    'uses' => 'MovieController@destroy'
]);

// Countries

// GET /api/countries
$router->get('/api/movie/countries', [
    'as' => 'api.movie.countries.index',
    'uses' => 'MovieController@index'
]);

// GET /api/countries/{id}
$router->get('/api/movie/countries/{id}', [
    'as' => 'api.movie.countries.show',
    'uses' => 'MovieController@show'
]);






//TVSHOWS 
// GET /api/songs maps to SongController function index, and lists movies
$router->get('/api/tvshow', [
    'as' => 'api.tvshows.index',
    'uses' => 'TvshowController@index',
    // 'middleware' => ['auth']
]);
//Show Only Movies For Adult

$router->get('/api/tvshow/onlyadult', [
    'as' => 'api.movie.onlyadult',
    'uses' => 'TvshowController@onlyadult'
]);

//Show Only Movies For Kids

$router->get('/api/tvshow/onlykids', [
    'as' => 'api.movie.onlykids',
    'uses' => 'TvshowController@onlykids'
]);
// GET /api/tvshow/{id} maps to SongController function show, and shows a specific movie
$router->get('/api/tvshow/{id}', [
    'as' => 'api.tvshows.show',
    'uses' => 'TvshowController@show'
]);

// POST /api/tvshow maps to SongController function store, which creates/stores a new movie
$router->post('/api/tvshow', [
    'as' => 'api.tvshows.store',
    'uses' => 'TvshowController@store'
]);

// PATCH /api/tvshow/{id} maps to SongController function update, which updates a specific movie
$router->patch('/api/tvshow/{id}', [
    'as' => 'api.tvshows.update',
    'uses' => 'TvshowController@update'
]);

// DELETE /api/tvshow/{id} maps to SongController function destroy, which deletes the given movie
$router->delete('/api/tvshow/{id}', [
    'as' => 'api.tvshows.delete',
    'uses' => 'TvshowController@destroy'
]);

// Countries

// GET /api/countries
$router->get('/api/movie/countries', [
    'as' => 'api.movie.countries.index',
    'uses' => 'TvshowController@index'
]);

// GET /api/countries/{id}
$router->get('/api/movie/countries/{id}', [
    'as' => 'api.movie.countries.show',
    'uses' => 'TvshowController@show'
]);