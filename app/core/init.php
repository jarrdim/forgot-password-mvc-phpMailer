<?php

spl_autoload_register(function($class)

    {
       require "../app/models/".$class.".php";
    });
    require "mail.php";
require "func.php";
require "config.php";
require 'db.php';
require "model.php";
require "controller.php";
require "route.php";



//require 'PHPmailer-master/src/PHPMailer.php';

