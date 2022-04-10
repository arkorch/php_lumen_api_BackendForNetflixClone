<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Movie;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    /**
     * List all the songs stored in our Database
     * 
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    function list(){
        return Movie::all();
    }
     public function index(Request $request)
    {
       
        $moviesQuery = Movie::with(['categories', 'country']);

        // check if the category_id key is on the request (either in $_POST or $_GET)
        if ($request->has('category_id')) {
            // modify our query to filter down to that specific category_id
            $categoryId = $request->input('category_id');

         

            $moviesQuery->whereHas('categories', function ($categoryQuery) use ($categoryId) {
                $categoryQuery->where('id', '=', $categoryId);
            });
        }

        if ($request->has('country_id')) {
            $moviesQuery->where('country_id', '=', $request->input('country_id'));
        }

        if ($request->has('search')) {
            // SELECT * FROM songs WHERE title LIKE '%abc%';
            $search = $request->input('search');
            $moviesQuery->where('movies_title', 'LIKE', "%" . $search . "%");
            // $moviesQuery->where('title', 'LIKE', "%$search%");
        }

        if ($request->has('country_name')) {
            // when loading the songs from the DB, also check the countries table
            // and see if there is a country for this model (relationship) that matches
            // the extra where statements we're adding
            $countryName = $request->input('country_name');
            $moviesQuery->whereHas('country', function ($countryQuery) use ($countryName) {
                $countryQuery->where('name', 'LIKE', '%' . $countryName . '%');
            });
        }

        $movies = $moviesQuery->paginate();

        return response()->json($movies);
    }

    /**
     * Show a specific Song
     * 
     * @param int $id 
     * @return \Illuminate\Http\Response 
     */
    public function show(int $id)
    {
        // this:
        $movie = Movie::query()->find($id);
        // is the same as:
        $movie = Movie::find($id);
        // use load AFTER we've gotten a SINGLE model
        // (or loop over a Collection of models and call 'load' for each one)
        $movie->load(['categories', 'country']);
        // is the same as calling each one individually:
        // $movie->load('category');
        // $movie->load('country');

        return response()->json($movie);
    }

    public function onlyadult()
    { 
        $moviesQuery = Movie::with(['categories', 'country']);
        $moviesQuery->where('rating', '=', 'adult');
      
        $movies = $moviesQuery->paginate();

        return response()->json($movies);
    }

    public function onlykids()
    { 
        $moviesQuery = Movie::with(['categories', 'country']);
        $moviesQuery->where('rating', '=', 'kids');
      
        $movies = $moviesQuery->paginate();

        return response()->json($movies);
    }
    /**
     * Store a new song in the database
     * 
     * @param \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'movie_title' => 'required|min:3',
            'movies_runtime' => 'required',
            'country_id' => 'required|exists:countries,id',
            'category_ids' => 'array'
        ]);

        $userInput = $request->all();

        // The below is equivalent to:
        // Movie::create([
        //     'title' => 'title of the song',
        //     'movies_runtime' => '12345',
        //     'movie_category_id' => 1
        // ]);
        $movie = Movie::create($userInput);

        if ($request->has('country_id')) {
            $country = Country::findOrFail($request->input('country_id'));

            $movie->country()->associate($country);
            $movie->save();
        }

        if ($request->has('mcategory_ids')) {
            $categoryIds = $request->input('mcategory_ids', []);

            $movie->categories()->sync($categoryIds);
        }

        $movie->load(['categories', 'country']);

        return response()->json([
            'message' => 'Successfully created a Music!',
            'data' => $movie
        ]);
    }

    /**
     * Updates a specific Song with the input the user provides
     * 
     * @param int $id 
     * @param Request $request 
     * @return \Illuminate\Http\Response
     */
    public function update(int $id, Request $request)
    {
        $this->validate($request, [
            'movie_title' => 'min:3',
            'country_id' => 'exists:countries,id',
            'mcategory_ids' => 'array'
        ]);

        $userInput = $request->all();
        $movie = Movie::find($id);

        // actuallly update the given song
        $success = $movie->update($userInput);

        if (! $success) {
            return response()->json([
                'message' => 'Could not update!'
            ]);
        }

        if ($request->has('country_id')) {
            $country = Country::findOrFail($request->input('country_id'));

            $movie->country()->associate($country);
            $movie->save();
        }

        if ($request->has('mcategory_ids')) {
            $categoryIds = $request->input('mcategory_ids', []);

            $movie->categories()->sync($categoryIds);
        }

        $movie->load(['categories', 'country']);

        return response()->json([
            'message' => 'Successfully update the Movie!',
            'data' => $movie
        ]);
    }

    /**
     * Delete a specific song
     * 
     * @param int $id 
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        $movie = Movie::find($id);
        $movie->delete();

        return response()->json([
            'message' => 'Successfully deleted the Movie!'
        ]);
    }
}
