<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Song;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SongController extends Controller
{
    /**
     * I have Listed all the songs stored in our Database
     * 
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // Get a list of all of the songs in the database with genres and country

        $songsQuery = Song::with(['genres', 'country']);

        // this coide is checking if the genre_id key is on the request (either in $_POST or $_GET)
        if ($request->has('genre_id')) {
           
            $genreId = $request->input('genre_id');

            $songsQuery->whereHas('genres', function ($genreQuery) use ($genreId) {
                $genreQuery->where('id', '=', $genreId);
            });
        }
  // this coide is checking if the country_id key is on the request (either in $_POST or $_GET)
     
        if ($request->has('country_id')) {
            $songsQuery->where('country_id', '=', $request->input('country_id'));
        }
  // this coide is checking if the search request is made, if made, search from database and give result
        if ($request->has('search')) {
            
            $search = $request->input('search');
            $songsQuery->where('title', 'LIKE', "%" . $search . "%");
           
        }

        if ($request->has('country_name')) {
          // this coide is checking if the country_name key is on the request (either in $_POST or $_GET)
   
            $countryName = $request->input('country_name');
            $songsQuery->whereHas('country', function ($countryQuery) use ($countryName) {
                $countryQuery->where('name', 'LIKE', '%' . $countryName . '%');
            });
        }

        $songs = $songsQuery->paginate();

        return response()->json($songs);
    }

    /**
     * Show a specific Song
     * 
     * @param int $id 
     * @return \Illuminate\Http\Response 
     */
    public function show(int $id)
    {
      //this code send detail of single song
        $song = Song::find($id);
       
        $song->load(['genres', 'country']);

        return response()->json($song);
    }

    /**
     * This code is use for Store  new song into database
     * 
     * @param \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|min:3',
            'duration' => 'required|integer',
            'country_id' => 'required|exists:countries,id',
            'genre_ids' => 'array'
        ]);

        $userInput = $request->all();


        $song = Song::create($userInput);

        if ($request->has('country_id')) {
            $country = Country::findOrFail($request->input('country_id'));

            $song->country()->associate($country);
            $song->save();
        }

        if ($request->has('genre_ids')) {
            $genreIds = $request->input('genre_ids', []);

            $song->genres()->sync($genreIds);
        }

        $song->load(['genres', 'country']);

        return response()->json([
            'message' => 'Successfully created a song!',
            'data' => $song
        ]);
    }

    /**
     * This code use for Updates a specific Song with the input the user provides
     * 
     * @param int $id 
     * @param Request $request 
     * @return \Illuminate\Http\Response
     */
    public function update(int $id, Request $request)
    {
        $this->validate($request, [
            'title' => 'min:3',
            'duration' => 'integer',
            'country_id' => 'exists:countries,id',
            'genre_ids' => 'array'
        ]);

        $userInput = $request->all();
        $song = Song::find($id);

        $success = $song->update($userInput);

        if (! $success) {
            return response()->json([
                'message' => 'Could not update!'
            ]);
        }

        if ($request->has('country_id')) {
            $country = Country::findOrFail($request->input('country_id'));

            $song->country()->associate($country);
            $song->save();
        }

        if ($request->has('genre_ids')) {
            $genreIds = $request->input('genre_ids', []);

            $song->genres()->sync($genreIds);
        }

        $song->load(['genres', 'country']);

        return response()->json([
            'message' => 'Successfully update the song!',
            'data' => $song
        ]);
    }

    /**
     * Delete a specific song from database
     * 
     * @param int $id 
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        $song = Song::find($id);
        $song->delete();

        return response()->json([
            'message' => 'Successfully deleted the song!'
        ]);
    }
}
