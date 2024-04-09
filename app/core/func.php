<?php

function show($arr)
{
    //echo "<br>";
    echo "<pre>";
    print_r($arr);
    echo "</pre>";
}

function sendMail()
{
   



}

function  redirect($link)
{
    header("Location: ".ROOT."/".$link);
    die;
}

function esc($data)
{
    return nl2br(htmlspecialchars($data));
}

function URL()
{
  
  
    $url = $_GET['url']?? 'home';
    return $url;
}
function ads_edit_view_path($path)
{
   
   return "../app/views/".$path.".view.php";
}


function message($message='',$delete = false)
{
    if(!empty($message))
    {
         $_SESSION['message'] = $message;
    }
    else 
        {
            if(!empty($_SESSION['message']))
                {
                    $$message = $_SESSION['message'];
                    if($delete)
                    {
                        unset($_SESSION['message']);
                    }
                
                    return $message;
                }
        }
     return "kk";
}


