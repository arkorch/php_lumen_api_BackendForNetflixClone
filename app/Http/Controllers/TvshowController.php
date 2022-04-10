<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Category;
use App\Models\Tvshow;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class TvshowController extends Controller
{
    /**
     * List all the songs stored in our Database
     * 
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    function list(){
        return Tvshow::all();
    } 
     public function index(Request $request)
    {
       
        $tvshowsQuery = Tvshow::with(['categories', 'country']);

        // check if the category_id key is on the request (either in $_POST or $_GET)
        if ($request->has('category_id')) {
            // modify our query to filter down to that specific category_id
            $categoryId = $request->input('category_id');

         

            $tvshowsQuery->whereHas('categories', function ($categoryQuery) use ($categoryId) {
                $categoryQuery->where('id', '=', $categoryId);
            });
        }

        if ($request->has('country_id')) {
            $tvshowsQuery->where('country_id', '=', $request->input('country_id'));
        }

        if ($request->has('search')) {
            // SELECT * FROM songs WHERE title LIKE '%abc%';
            $search = $request->input('search');
            $tvshowsQuery->where('tvshows_title', 'LIKE', "%" . $search . "%");
            // $tvshowsQuery->where('title', 'LIKE', "%$search%");
        }

        if ($request->has('country_name')) {
            // when loading the songs from the DB, also check the countries table
            // and see if there is a country for this model (relationship) that matches
            // the extra where statements we're adding
            $countryName = $request->input('country_name');
            $tvshowsQuery->whereHas('country', function ($countryQuery) use ($countryName) {
                $countryQuery->where('name', 'LIKE', '%' . $countryName . '%');
            });
        }

        $tvshows = $tvshowsQuery->paginate();

        return response()->json($tvshows);
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
        $tvshow = Tvshow::query()->find($id);
        // is the same as:
        $tvshow = Tvshow::find($id);
        // use load AFTER we've gotten a SINGLE model
        // (or loop over a Collection of models and call 'load' for each one)
        $tvshow->load(['categories', 'country']);
        // is the same as calling each one individually:
        // $tvshow->load('category');
        // $tvshow->load('country');

        return response()->json($tvshow);
    }

    public function onlyadult()
    { 
        $tvshowsQuery = Tvshow::with(['categories', 'country']);
        $tvshowsQuery->where('rating', '=', 'adult');
      
        $tvshows = $tvshowsQuery->paginate();

        return response()->json($tvshows);
    }

    public function onlykids()
    { 
        $tvshowsQuery = Tvshow::with(['categories', 'country']);
        $tvshowsQuery->where('rating', '=', 'kids');
      
        $tvshows = $tvshowsQuery->paginate();

        return response()->json($tvshows);
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
            'tvshows_title' => 'required|min:3',
            'tvshows_runtime' => 'required',
            'country_id' => 'required|exists:countries,id',
            'category_ids' => 'array'
        ]);

        $userInput = $request->all();

        // The below is equivalent to:
        // Tvshow::create([
        //     'title' => 'title of the song',
        //     'tvshows_runtime' => '12345',
        //     'tvshows_category_id' => 1
        // ]);
        $tvshow = Tvshow::create($userInput);

        if ($request->has('country_id')) {
            $country = Country::findOrFail($request->input('country_id'));

            $tvshow->country()->associate($country);
            $tvshow->save();
        }

        if ($request->has('category_ids')) {
            $categoryIds = $request->input('category_ids', []);

            $tvshow->categories()->sync($categoryIds);
        }

        $tvshow->load(['categories', 'country']);

        return response()->json([
            'message' => 'Successfully created a Tv show!',
            'data' => $tvshow
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
            'tvshows_title' => 'min:3',
            'country_id' => 'exists:countries,id',
            'category_ids' => 'array'
        ]);

        $userInput = $request->all();
        $tvshow = Tvshow::find($id);

        // actuallly update the given song
        $success = $tvshow->update($userInput);

        if (! $success) {
            return response()->json([
                'message' => 'Could not update!'
            ]);
        }

        if ($request->has('country_id')) {
            $country = Country::findOrFail($request->input('country_id'));

            $tvshow->country()->associate($country);
            $tvshow->save();
        }

        if ($request->has('category_ids')) {
            $categoryIds = $request->input('category_ids', []);

            $tvshow->categories()->sync($categoryIds);
        }

        $tvshow->load(['categories', 'country']);

        return response()->json([
            'message' => 'Successfully update the Tv show!',
            'data' => $tvshow
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
        $tvshow = Tvshow::find($id);
        $tvshow->delete();

        return response()->json([
            'message' => 'Successfully deleted the Tv show!'
        ]);
    }
}
