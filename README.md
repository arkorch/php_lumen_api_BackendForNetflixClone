# research2_movies_api_hw
Research 2 assignment using Laravel Lumen. This API is used by the Netflix Clone.

# Link to Netflix Clone Repository
https://github.com/arkorch/netflixclone_frontend.git

# Installation 
* You need to install Lumen,php & Composer 
* Then you need to create .env file 
* Install the database
* put this comand in folder terminal " php -S localhost:8000 -t public " 
* Then you can see our Api working on localhost
* For example if you need to open songs api then you have to write this on your browser "localhost:8000/api/songs"

# FOR .ENV FILE ( Please copy this ) and save file as .env in root folder 

* APP_NAME=Lumen
* APP_ENV=local
* APP_KEY=
* APP_DEBUG=true
* APP_URL=http://localhost
* APP_TIMEZONE=UTC

* LOG_CHANNEL=stack
* LOG_SLACK_WEBHOOK_URL=

* DB_CONNECTION=mysql
* DB_HOST=127.0.0.1
* DB_PORT=3306
* DB_DATABASE=netflixapis    .//database name
* DB_USERNAME=root           // username of sql
* DB_PASSWORD=               // password of sql

* CACHE_DRIVER=file
* QUEUE_CONNECTION=sync

# Lumen PHP Framework

[![Build Status](https://travis-ci.org/laravel/lumen-framework.svg)](https://travis-ci.org/laravel/lumen-framework)
[![Total Downloads](https://img.shields.io/packagist/dt/laravel/framework)](https://packagist.org/packages/laravel/lumen-framework)
[![Latest Stable Version](https://img.shields.io/packagist/v/laravel/framework)](https://packagist.org/packages/laravel/lumen-framework)
[![License](https://img.shields.io/packagist/l/laravel/framework)](https://packagist.org/packages/laravel/lumen-framework)

Laravel Lumen is a stunningly fast PHP micro-framework for building web applications with expressive, elegant syntax. We believe development must be an enjoyable, creative experience to be truly fulfilling. Lumen attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as routing, database abstraction, queueing, and caching.

## Official Documentation

Documentation for the framework can be found on the [Lumen website](https://lumen.laravel.com/docs).

## Contributing

Thank you for considering contributing to Lumen! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Security Vulnerabilities

If you discover a security vulnerability within Lumen, please send an e-mail to Taylor Otwell at taylor@laravel.com. All security vulnerabilities will be promptly addressed.

## Mit License

Copyright © 2022 Arko Roychowdhury & Madhur Kakkar
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
