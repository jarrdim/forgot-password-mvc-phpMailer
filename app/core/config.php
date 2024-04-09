<?php

define('NAME','Login systemshop');
define('DEBUG',"true");

if($_SERVER['SERVER_NAME'] == '127.0.0.1' || $_SERVER['SERVER_NAME'] =='localhost' )
{
    define('DBHOST','127.0.0.1');
    define('DBUSER','guru');
    define('DBNAME','AgriTech');
    define('DBDRIVER','mysql');
    define('DBPASS','moting');
    define('ROOT','http://localhost/forgot-password/public');
}
else
{
    define('ROOT','https://wwww/system/public');
}

