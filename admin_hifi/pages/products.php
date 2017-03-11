<?php
    if(!empty($_GET['id'])){
        $getParamId = $_GET['id'];

        if($getParamId === 'Add'){
            $infoArr = array();

            ## Select nessecary information to form from DB
            $queryCat = $conn->newQuery("SELECT catid, categoryName FROM hifi_category;");
            $queryPic = $conn->newQuery("SELECT pictureid, picturefilename FROM hifi_pictures WHERE pictureIsProduct = 1;");    
            $queryBrand = $conn->newQuery("SELECT bid, brandName FROM hifi_brands;");
            if($queryCat->execute()){
                $infoArr['Cat'] = $queryCat->fetchAll(PDO::FETCH_ASSOC);
            }
            if($queryPic->execute()){
                $infoArr['Pic'] = $queryPic->fetchAll(PDO::FETCH_ASSOC);
                
            }
            if($queryBrand->execute()){
                $infoArr['Brand'] = $queryBrand->fetchAll(PDO::FETCH_ASSOC);
                
            }
             if(isset($_POST)){
                 $getParamPost = $_POST;
             }
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
                            <small>HiFi</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i>  <a href="<?=BASE?>/Dashboard/">Kontrolpanel</a>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                  <div class="col-lg-8">
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
                            <?=print_r($_GET) . PHP_EOL?>
                            Defined base : <?=BASE?><br>
                            <?php print_r($getParamPost)?>
                          </pre>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.row -->
                 <div class="row <?=$getParamId === 'Add' ? 'hidden': ''?>">
                  <div class="col-lg-8">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-12">
                                    <i class="fa fa-tasks fa-2x"></i>
                                      Tilføj
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                          <a href="<?=BASE?>/Products/Add/" class="btn btn-success">Produkt</a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.row -->
                <div class="row <?=$getParamId !== 'Add' ? 'hidden': ''?>">
                  <div class="col-lg-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-12">
                                    <i class="fa fa-plus fa-2x"></i>
                                      Tilføj produkt
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                          <form method="post" action="">
    
                            <div class="input-group">
                                <span class="input-group-addon" id="sizing-addon2">-</span>
                                <input type="text" class="form-control" placeholder="Produkt navn" name="productName" aria-describedby="sizing-addon2">
                            </div>
                            <div class="input-group">
                                <label for="">Produkt beskrivelse</label>
                                <textarea name="productDetails" class="form-control" col="15" rows="10">bh etue tisi blandiatue dolum dolessim ea feummy nostrud delendi pissequ ametum in etuerit etue tatiscipit nos ex el init lore tatet do conullum diamet venim dolore facidunt dit doluptat
                                </textarea>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="sizing-addon5">DKK kr.</span>
                                <input type="text" class="form-control" placeholder="Produkt pris" name="productPrice" value="9999,75" aria-describedby="sizing-addon5">
                            </div>
                            <div class="input-group">
                                <label for="basic-url">Kategori</label>
                                <select name="productCategory">
                                    <?php
                                        foreach($infoArr['Cat'] as $Category){
                                    ?>
                                        <option value="<?=$Category['catid']?>"><?=utf8_encode($Category['categoryName'])?></option>

                                        <?php
                                        }
                                        ?>
                                </select>
                            </div>
                            <div class="input-group">
                                <label for="basic-url">Mærke</label>
                                <select name="brand">
                                    <?php
                                        foreach($infoArr['Brand'] as $Brand){
                                    ?>
                                        <option value="<?=$Brand['bid']?>"><?=utf8_encode($Brand['brandName'])?></option>

                                        <?php
                                        }
                                        ?>
                                </select>
                            </div>
                            <div class="input-group">
                                <label for="basic-url">Produkt billede</label>
                                
                                <select id="productPic" name="productPicture">
                                        <?php
                                        foreach($infoArr['Pic'] as $Picture){
                                    ?>
                                        <option value="<?=$Picture['pictureid']?>"><?=utf8_encode($Picture['picturefilename'])?></option>

                                        <?php
                                        }
                                        ?>
                                </select><br>
                                <script>
                                    $(document).ready(()=>{
                                        var picture = $('#productPic option:selected').text();
                                            $("#showPic").attr("src","<?=IMGBASE?>/prod_image/" + picture);
                                        $('#productPic').on('change', function() {
                                            var picture = $('#productPic option:selected').text();
                                            $("#showPic").attr("src","<?=IMGBASE?>/prod_image/" + picture);
                                        });
                                    });
                                    </script>
                                <img id="showPic" src="">
                                <span id="showPic"></span>
                            </div>
                            <button type="submit" class="btn btn-lg btn-success">Tilføj</button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->