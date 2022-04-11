<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Category extends Model
{
    /**
     * The table our model uses from the database
     * 
     * @var string
     */
    protected $table = 'categories';

    /**
     * Indicates whether or not our model is using the
     * created_at
     * and
     * updated_at
     * columns in the database.
     * 
     * @var bool
     */
    public $timestamps = false;

    /**
     * The properties / columns on the model that are "mass assignable" -
     * meaning they can be passed in as keys on an array to either create() or update()
     * Acts as a whitelist of acceptable inputs
     * 
     * @var array
     */
    protected $fillable = [
        'name'
    ];

    /* ======================== RELATIONSHIPS ==================== */

    /**
     * A Catagories has many movies
     * 
     * @return BelongsToMany
     */
    public function movies()
    {
        return $this->belongsToMany(Movie::class);
    }

    public function tvshows()
    {
        return $this->belongsToMany(Tvshow::class);
    }
}