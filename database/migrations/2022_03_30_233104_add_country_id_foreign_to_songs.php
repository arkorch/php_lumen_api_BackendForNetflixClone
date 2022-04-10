<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCountryIdForeignToSongs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('songs', function (Blueprint $table) {
            // $table->unsignedBigInteger('country_id')->nullable()->change();
            // is the same as:
            $table->foreignId('country_id')->nullable()->change();
            $table->foreign('country_id')->references('id')->on('countries')->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('songs', function (Blueprint $table) {
            // because lumen generates the name of the key based on the column,
            // we need to pass the actual name of the key to the dropForeign method
            // $table->dropForeign('songs_country_id_foreign');
            // OR
            // we can pass an array with the column name in it, which will cause lumen to calculate the same keyname that will then
            // be used by the function
            $table->dropForeign(['country_id']);
            $table->foreignId('country_id')->nullable(false)->change();
        });
    }
}
