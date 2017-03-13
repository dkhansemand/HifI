<?php
    if(isset($_GET['option'])){
        $getParamOpt = $_GET['option'];

        if($getParamOpt === 'Add'){
            // Add picture function
        }
    }else{
        $queryPicture = $conn->newQuery("SELECT pictureId, pictureFilename, pictureTitle, pictureIsProduct FROM hifi_pictures");
        
        if($queryPicture->execute()){
            $pictures = $queryPicture->fetchAll(PDO::FETCH_ASSOC);
        }
    }


?>


<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Kontrolpanel
                    <small>Billeder</small>
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="./index.php?p=Dashboard">Dashboard</a>
                    </li>
                    <li class="active">
                         <i class="fa fa-picture-o"></i>  <a href="./index.php?p=Pictures">Billeder</a>
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
                            <?=print_r($_GET)?><br>
                            Defined base : <?=BASE?><br>
                            </pre>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row <?=$getParamOpt === 'Add' || $getParamOpt === 'Delete' ? 'hidden': ''?>">
                  <div class="col-lg-4">
                          <a href="./index.php?p=Pictures&option=Add" class="btn btn-success"><i class="fa fa-plus"></i>Tilføj Billede</a>
                    </div>
                  </div><br>

            <div class="row <?=empty($getParamOpt) ? '' : 'hidden'?>">
                <div class="col-lg-12">
                   
        
                <ul  class="nav nav-pills bg-default">
                    <li class="active">
                         <a  href="#productPictures" data-toggle="tab">Produkt billeder</a>
                    </li>
                    <li>
                        <a href="#OtherPictures" data-toggle="tab">Andre billeder</a>
                    </li>
                    
                </ul><br>

			<div class="tab-content clearfix">
			  <div class="tab-pane active" id="productPictures">
                    <div class="row">
                            <?php
                            if(empty($getParamOpt)){
                                foreach($pictures as $picture){
                                    if($picture['pictureIsProduct'] == 1){
                                    ?>
                                    
                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                - <small><?=$picture['pictureTitle']?></small>
                                            </div>
                                            <div class="panel-body">
                                                <img src="<?=IMGBASE?>/prod_image/<?=$picture['pictureFilename']?>" height="85" width="125" alt="<?=$picture['pictureTitle']?>">
                                            </div>
                                        <div class="panel-footer">
                                            <a href="./index.php?p=Pictures&option=Delete&id=<?=$picture['pictureId']?>" class="btn btn-danger" role="button">Slet</a>
                                        </div>
                                    </div>
                                    </div>
                                    
                                    <?php
                                    }
                                }
                            }
                            ?>
                            </div>
				</div>
				<div class="tab-pane" id="OtherPictures">
                     <div class="row">
                            <?php
                             if(empty($getParamOpt)){
                                foreach($pictures as $picture){
                                    if($picture['pictureIsProduct'] == 0){
                                    ?>
                                    
                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                - <small><?=$picture['pictureTitle']?></small>
                                            </div>
                                            <div class="panel-body">
                                                <img src="<?=IMGBASE?>/img/<?=$picture['pictureFilename']?>" height="85" width="125" alt="<?=$picture['pictureTitle']?>">
                                            </div>
                                        <div class="panel-footer">
                                           <a href="./index.php?p=Pictures&option=Delete&id=<?=$picture['pictureId']?>" class="btn btn-danger" role="button">Slet</a>
                                        </div>
                                    </div>
                                    </div>
                                    
                                    <?php
                                    }
                                }
                             }
                            ?>
                            </div>
				</div>
			</div>
  </div>
                                    
            </div>         
            


    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->