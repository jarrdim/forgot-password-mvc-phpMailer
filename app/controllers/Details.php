
<?php

class Details extends Controller
{
    public function index()
    {
        $generalError['genError'] = "";

       
 


        $details = new Detail_model();
        if($_SERVER['REQUEST_METHOD'] == "POST")
        {

            $data['email'] = $_POST['email'];
        
             $result = $details->first($data);

             if(!empty($result))
             {
                $generalError['genError'] = "The record already exist!";
                 //$data['errors'] = 
             
             }
           else{
                 $details->validate($_POST);
                if($details->validate($_POST))
                {
                    $details->insert($_POST);
                    redirect('search');
                    //$this->view('details',$data);
                
        
                }
           }
    
           
           
            
        }

        $data['generalError'] = $generalError['genError'] ?? "";
    
        $data['errors'] = $details->errors;
        $data['title'] = 'Details';

       $this->view('details',$data);
    }

}
