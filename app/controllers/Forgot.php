
<?php
include "../public/assets/vendor/autoload.php";
 use PHPMailer\PHPMailer\Exception;
 use PHPMailer\PHPMailer\PHPMailer;
 use PHPMailer\PHPMailer\SMTP;

class Forgot extends Controller
{
    public function index($mode='')
    {  
       
          if($_SERVER['REQUEST_METHOD'] == 'POST' )
              {
           
                  switch ($_POST['data_type']) {

                    case 'enteremail':

                        
                         if(empty(trim($_POST['email'])) && !filter_var(trim(trim($_POST['email'])), FILTER_VALIDATE_EMAIL))
                         {
                           
                            $info['email_error'] = "Please enter valid email";
                                
                            
                           
                         }elseif(!Auth::valide_email($_POST['email']))
                         {
                            $info['email_error'] = "Invalid email";
                         }
                        
                         else
                         {
                            $_SESSION['email'] = $_POST['email'];
                            $reset = new Reset();
                            //$info['data_type'] = 'entercode';
                            $code = rand(10000, 99999);
                            $expire = time() + (60 * 4);
                                
                            $arr['email'] = $_POST['email'];
                            $arr['code'] = $code;
                            $arr['expire'] = $expire;

                            $_SESSION['reset_email'] = $_POST['email'];

                            
                            $sq = "select * from reset where email = :email";
                            $resul = $reset->query($sq, ['email'=>$_POST['email']]);

                            if($resul)
                            {
                                //$delete = "DELETE FROM reset where email = :email";
                                $update = "UPDATE reset SET code = :code WHERE email = :email";
                                $reset->query($update, ['code'=>$code, 'email'=>$_POST['email']]);
                            }else{



                            
                            $sql ="insert into reset (email , code, expire) VALUES (:email,:code,:expire)";
                    
                            $reset->query($sql, $arr);
                            }
                           
                             //echo json_encode($resul);

                            //SEND EMAIL
                            //mail($email,"AGRITECH: RESET PASSWORD","RESET CODE: ".$code);

                         }

                         try {
                            $email = $_POST['email'];
                            //Server settings

                            $mail = new PHPMailer();
                            // $mail = new SendMail();
        
                            $mail->CharSet =  "utf-8";
                            $mail->IsSMTP();
                            // enable SMTP authentication
                            $mail->SMTPAuth = true;                  
                            // GMAIL username
                            $mail->Username = "jackmutiso37@gmail.com";
                            // GMAIL password
                            $mail->Password = "tzuhdwrgmuqtgydw";
                            $mail->SMTPSecure = "ssl";  
                            // sets GMAIL as the SMTP server
                            $mail->Host = "smtp.gmail.com";
                            // set the SMTP port for the GMAIL server
                            $mail->Port = "465";
                            // $mail->From='jackmutiso37@gmail.com';
                            $mail->FromName='Jack Just a Tech';
                            $mail->AddAddress($email, 'reciever_name');
                            $mail->Subject  =  'Reset Password';
                            $mail->IsHTML(true);
                            $mail->Body    = 'A password reset in attempt requires further verification. To complete the password reset, enter the verification code on the unrecognized device. <br>'. $code;
                        
                            $mail->send();
                                //$info = "Hello the Client Server Authentication system has sent a passwod reset otp to your email - $email";
                            // $_SESSION['info'] = $info;
                            // $_SESSION['email'] = $email;
                            // echo $info;
                            //  json_encode($info);die;
                            // exit();
                            $info['data_type'] = 'entercode';
                            //   echo json_encode($info);                    
                            //     die;
                        } catch (Exception $e) {
                            //echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";die;
                                $info['email_error'] = 'jjjjjj';
                            // header('refresh: 1; url=../client/forgotpass.html');
                        }
                






                                 
                         echo json_encode($info);                    
                         die;
               
                        break;



                    case 'entercode':
                        if(!empty(trim($_POST['code'])) && is_numeric(trim(trim($_POST['code']))))
                         {
                            $code = trim($_POST['code']);
                            
                            $result = Auth::is_code_correct($code);

                           // echo $result;die;
                            if($result == "success")
                            {
                               $info['data_type'] = 'enterpassword';
                            }
                            else{
                                $info['code_error'] = $result;
                            }
                             

                         }
                         else
                         {
                             $info['code_error'] = "Invalid code";
                         }
                       
                    
                      
                       echo json_encode($info);
                        die;
                        break;

                    case 'enterpassword':
                        
                        if(empty($_POST['password']))
                        {
                            $info['pass_error'] = "Enter new password";
                        }
                        elseif(empty($_POST['password2']))
                        {
                            $info['pass_error'] = "Retype password";
                        }
                        elseif($_POST['password'] != $_POST['password2'])
                        {
                             $info['pass_error'] = "macth passwords";
                        }
                        else{
                            Auth::save_password($_POST['password']);
                            $info['data_type'] = 'reset';
                            $info['message'] = "Reset successfuly";
                        }
                        
                       
                        echo json_encode($info);
                        die;
                
                        break;                        
                    default:
                
                        break;
                  }

              }

        $data['title'] = 'Forgot';
       $this->view('forgot',$data);
    }
   

}