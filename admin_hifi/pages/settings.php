<?php

?>

<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                 <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Kontrolpanel
                            <small>Indstillinger</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="./index.php?p=Dashboard">Kontrolpanel</a>
                            </li>
                             <li class="<?=@empty($getParamOpt) ? '' : 'active'?>">
                                <i class="fa fa-newspaper-o"></i>  <a href="./index.php?p=Settings">Indstillingerr</a>
                            </li>
                            
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                  <div class="col-lg-10">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-12">
                                    <i class="fa fa-bug fa-2x"></i>
                                     - DEBUG
                                </div>
                                
                            </div>
                        </div>
                        <div class="panel-body">
                          <pre>
                            <?=print_r($_GET)?><br> Defined base : <?=BASE?><br>
                            <?=print_r($_POST, true)?>
                            <?=print_r(@$settings, true)?>
                          </pre>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="row">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                             Kontakt oplysninger
                        </div>
                        <div class="panel-body">
                            <form method="post" action="" id="settingsInfoForm">
                                <div class="input-group col-lg-6 has-feedback">
                                    <span class="input-group-addon" id="sizing-addon1">Adresse</span>
                                    <input type="text" class="form-control" placeholder="Adresse" name="address" id="address" value="<?=@$shopAddr?>" aria-describedby="sizing-addon1" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg alert-warning"><?=@$errAddr?></span>
                                </div><br>
                                <div class="input-group col-lg-2 has-feedback">
                                    <span class="input-group-addon" id="sizing-addon2">Post nr.</span>
                                    <input type="text" pattern="[0-9]{4}" class="form-control" placeholder="post nr." name="zipcode" id="zipcode" value="<?=@$shopZipcode?>" aria-describedby="sizing-addon2" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg alert-warning"><?=@$errZipcode?></span>
                                </div><br>
                                <div class="input-group col-lg-4 has-feedback">
                                    <span class="input-group-addon" id="sizing-addon3">By</span>
                                    <input type="text" class="form-control" placeholder="By" name="city" id="city" value="<?=@$shopCity?>" aria-describedby="sizing-addon3" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg alert-warning"><?=@$errCity?></span>
                                </div><br>
                                <div class="input-group col-lg-4 has-feedback">
                                    <span class="input-group-addon" id="sizing-addon4">Tlf. nr.</span>
                                    <input type="text" pattern="[+0-9\s]{8,15}" class="form-control" placeholder="Tlf. nr." name="phone" id="phone" value="<?=@$shopPhone?>" aria-describedby="sizing-addon4" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg alert-warning"><?=@$errPhone?></span>
                                </div><br>
                                <div class="input-group col-lg-4 has-feedback">
                                    <span class="input-group-addon" id="sizing-addon5">Fax</span>
                                    <input type="text" pattern="[+0-9\s]{8,15}" class="form-control" placeholder="Fax" name="fax" id="fax" value="<?=@$shopFax?>" aria-describedby="sizing-addon5" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg alert-warning"><?=@$errFax?></span>
                                </div><br>
                                <div class="input-group col-lg-4 has-feedback">
                                    <span class="input-group-addon" id="sizing-addon6">E-mail</span>
                                    <input type="email" class="form-control" placeholder="E-mail" name="email" id="email" value="<?=@$shopEmail?>" aria-describedby="sizing-addon6" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="errMsg alert-warning"><?=@$errEmail?></span>
                                </div><br>
                            
                                <button type="submit" name="btnAdd" class="btn btn-lg btn-success">Ret oplysninger</button>
                        </form>
                        </div>
                    </div>
                    
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->