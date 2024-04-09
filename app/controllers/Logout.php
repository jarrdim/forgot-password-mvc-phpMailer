
<?php


class Logout 
{
    public function index()
    {
       

       
        Auth::logout();
        redirect('login');

      // $this->view('details',$data);
    }

}
