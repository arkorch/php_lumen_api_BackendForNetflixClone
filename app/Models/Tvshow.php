<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Tvshow extends Model
{
    /**
     * The table our model uses from the database
     * 
     * @var string
     */
    protected $table = 'tvshows';

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
        'tvshows_cover',
        'tvshows_title',
        'rating'
    ];


    /* ======================== RELATIONSHIPS ==================== */

    /**
     * A tvshow belongs to one category
     * 
     * @return BelongsToMany
     */
    public function categories()
    {
    
        return $this->belongsToMany(Category::class);
    }
    
    /**
     * A tvshow belongs to one country
     * 
     * @return BelongsTo 
     */
    public function country()
    {
        return $this->belongsTo(Country::class);
    }
}