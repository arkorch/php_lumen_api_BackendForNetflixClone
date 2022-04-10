<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGenreSongTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('genre_song', function (Blueprint $table) {
            $table->foreignId('genre_id');
            $table->foreignId('song_id');

            $table->foreign('genre_id')
                ->references('id')
                ->on('genres')
                ->cascadeOnDelete();

            $table->foreign('song_id')
                ->references('id')
                ->on('songs')
                ->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('genre_song');
    }
}
