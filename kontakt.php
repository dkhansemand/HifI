<?php
    ##Include header (With navigation)
    include './partials/header.php';

    if(!empty($_POST)){
        $errCount = 0;
        $name = $_POST['name'];
        $email = $_POST['email'];
        $subject = $_POST['subject'];
        $message = $_POST['message'];

        if(empty($name)){
            $errName = 'Navn skal udfyldes';
            ++$errCount;
        }elseif(preg_match('/\d/', $name) ) { 
            $errName = "Feltet må ikke indeholde tal.";
            ++$errCount;
        }

        if ( empty($email) ) { // test om variablen er tom
            $errEmail = 'Du skal udfylde feltet';
            ++$errCount;
        }elseif( !filter_var($email, FILTER_VALIDATE_EMAIL) ) { // test om varibel er en email
            $errEmail = "Emailen er ikke skrevet korrekt.";
            ++$errCount;
        } 

        if(empty($subject)){
            $errSubject = 'Emne skal udfyldes';
            ++$errCount;
        }elseif(preg_match('/\w[a-zA-ZÆØÅæøå0-9]+$/', $subject) ) { 
            $errSubject = "Feltet må ikke indeholde specialtegn.";
            ++$errCount;
        }

        if(empty($message)){ // test om variablen er tom
            $errMsg = 'Du skal udfylde feltet';
            ++$errCount;
        }elseif (strlen($message) <= 20){ //tjekker længden på strengen
            $errMsg = 'Du skal skrive mere en 20 tegn';
            ++$errCount;
        }

        if($errCount === 0){
            $query = $conn->newQuery("INSERT INTO hifi_contactmessages (cmFullname, cmEmail, cmSubject, cmMessage)VALUES(:NAME, :EMAIL, :SUBJECT, :MSG)");
            $query->bindParam(':NAME', $name, PDO::PARAM_STR);
            $query->bindParam(':EMAIL', $email, PDO::PARAM_STR);
            $query->bindParam(':SUBJECT', $subject, PDO::PARAM_STR);
            $query->bindParam(':MSG', $message, PDO::PARAM_STR);

            if($query->execute()){
                unset($name, $email, $subject, $message);
                $success = ' <div class="alert alert-success" role="alert">Din besked er nu sendt! Vi vender tilbage med svar hurtigst muligt!</div>';
            }else{
                $success = ' <div class="alert alert-danger" role="alert">Din besked blev ikke sendt! Prøv igen...!</div>';
            }
            
        }
    }
?>
<script src="./js/validate.js"></script>
    <section class="container heading">
        <article class="row">
        	<section class="col-lg-12">
        		<h3>Kontakt</h3>
        	</section>
        </article>
        <hr class="featurette-divider">
        <article class="row">
            <section class="col-md-12">
                <div class="jumbotron jumbotron-sm">
                    <h1><small>Du er velkommen til at kontakte os</small></h1>
                </div>
                <?php
                if(!empty($success)){
                    echo $success;
                }
                ?>
                <div class="col-md-8">
                    <div class="well well-sm">
                        <form action="" method="post" id="contactForm">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label for="name">Navn</label>
                                    <input type="text" class="form-control" name="name" id="name" value="<?=@$name?>" placeholder="Indtast navn" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg"><?=@$errName?></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="email">Email Adresse</label>
                                      <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="E-mail" value="<?=@$email?>">
                                    </div>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg"><?=@$errEmail?></span>
                                </div>
                                    
                                <div class="form-group has-feedback">
                                    <label for="subject">Emne</label>
                                    <input type="text" class="form-control" name="subject" id="subject" value="<?=@$subject?>" placeholder="Indtast emne" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg"><?=@$errSubject?></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label for="message">Besked</label>
                                    <textarea name="message" id="message" class="form-control" rows="9" cols="25" required placeholder="Besked"><?=@$message?></textarea>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg"><?=@$errMsg?></span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary pull-right">Send Besked</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <form>
                    <legend><span class="glyphicon glyphicon-globe"></span> Vores adresse</legend>
                    <address>
                        <strong>Hi-fi Netbutikken</strong><br>
                        Byvej 25<br>
                        4000 bykøbing<br>
                        <abbr title="Telefon">Tlf:</abbr> 45 45 45 45<br>
                        <abbr title="Fax">Fax:</abbr> 45 45 45 45<br>
                    </address>
                    <address>
                        post@hifi-netbutikken.dk
                    </address>
                    </form>
                </div>
            </section>
        </article>
        <hr class="featurette-divider">

<?php
    ##Include footer
    include './partials/footer.php';
