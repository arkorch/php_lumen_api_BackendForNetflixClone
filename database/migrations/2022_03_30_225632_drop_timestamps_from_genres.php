<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropTimestampsFromGenres extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('genres', function (Blueprint $table) {
            // This:
            // $table->dropColumn('created_at');
            // $table->dropColumn('updated_at');
            // is basically the same as:
            $table->dropTimestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('genres', function (Blueprint $table) {
            // This:
            // $table->timestamp('created_at')->nullable();
            // $table->timestamp('updated_at')->nullable();
            // is basically the same as:
            $table->timestamps();
        });
    }
}
