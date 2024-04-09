<?php $this->view('header') ?>

<style>
    form{
        margin:auto;
        width:500px;
        text-align:center;
        font-family:tahoma;
        border-radius:10px;
        box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    }
</style>


<div class="container  mt-5  ">



    <form  method="POST">
        <div class="row">
            <div class="col-md-12 ">
                <div class="card w-100 ">
                    <div class="card-body">
                        <a href="<?php echo ROOT?>/logout" class="btn-dark">Logout</a>
                        <?php if(!empty($generalError)):?>

                        <div class="alert alert-danger text-center"><?php echo $generalError?></div>
                        <?php endif;?>
                        <div class="card-title text-primary fw-bold">
                           ENTER YOUR CONTACT DETAILS
                        </div>
                        <div class="card-text">
                             <input type="text" name="phone" placeholder="Phone number" class="form-control mb-3">
                                <?php if(!empty($errors['phone'])): ?>
                                   <div class="text-danger mb-1"> <?php echo $errors['phone'] ?></div>
                                <?php endif ?>
                             <input type="text" name="email" placeholder="Email" class="form-control mb-3">
                                <?php if(!empty($errors['email'])): ?>
                                   <div class="text-danger mb-1"> <?php echo $errors['email'] ?></div>
                                <?php endif ?>
                              <input type="text" name="address" placeholder="Address" class="form-control mb-3">
                                <?php if(!empty($errors['address'])): ?>
                                   <div class="text-danger mb-1"> <?php echo $errors['address'] ?></div>
                                <?php endif ?>
                             <input type="text" name="regNo" placeholder="REG NO" class="form-control mb-3">
                                <?php if(!empty($errors['regNo'])): ?>
                                   <div class="text-danger mb-1"> <?php echo $errors['regNo'] ?></div>
                                <?php endif ?>
                             <input type="submit" class="btn btn-warning" value="SUBMIT">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
  
</div>
