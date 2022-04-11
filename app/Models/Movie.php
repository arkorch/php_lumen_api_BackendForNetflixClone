<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Movie extends Model
{
    /**
     * The table our model uses from the database
     * 
     * @var string
     */
    protected $table = 'movies';

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
        'movies_cover',
        'movies_title',
        'mgenre_id'
    ];


    /* ======================== RELATIONSHIPS ==================== */

    /**
     * A movie belongs to one category
     * 
     * @return BelongsToMany
     */
    public function categories()
    {
    
        return $this->belongsToMany(Category::class);
    }
    
    /**
     * A movie belongs to one country
     * 
     * @return BelongsTo 
     */
    public function country()
    {
        return $this->belongsTo(Country::class);
        
    }
}