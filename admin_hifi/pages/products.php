<?php
    if(!empty($_GET['option'])){
        $getParamOpt = $_GET['option'];

        if($getParamOpt === 'Add'){
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
                 if(!empty($_POST['productName']) && !empty($_POST['productPrice'])){
                    $queryInsert = $conn->newQuery("INSERT INTO hifi_products (productTitle, productDetails, productprice, productBrandId, productPicture, productCategoryId)
                                                    VALUES(:TITLE, :DETAILS, :PRICE, :BRANDID, :PICTUREID, :CATID)");
                    $queryInsert->bindParam(':TITLE', $_POST['productName'], PDO::PARAM_STR);   
                    $queryInsert->bindParam(':DETAILS', $_POST['productDetails'], PDO::PARAM_STR);      
                    $queryInsert->bindParam(':PRICE', $_POST['productPrice'], PDO::PARAM_STR);     
                    $queryInsert->bindParam(':BRANDID', $_POST['brand'], PDO::PARAM_INT);   
                    $queryInsert->bindParam(':PICTUREID', $_POST['productPicture'], PDO::PARAM_INT);       
                    $queryInsert->bindParam(':CATID', $_POST['productCategory'], PDO::PARAM_INT);  

                    if($queryInsert->execute()){
                        $success = true;
                        $successTitle = 'Produkt tilføjet';
                        $successMsg = 'Produktet "' . $_POST['productName'] . '" er nu tilføjet til databasen';
                    }                          
                }
             }
        }
    }else{
        $queryProducts = $conn->newQuery(" SELECT pid, productTitle, productDetails, productPrice,
                                            brandName,
                                            pictureFilename, pictureTitle,
                                            categoryName
                                            FROM hifi_products
                                            LEFT JOIN hifi_category ON catId = productCategoryId
                                            LEFT JOIN hifi_pictures ON pictureId = productPicture
                                            LEFT JOIN hifi_brands ON bid = productBrandId
                                        ");
        if($queryProducts->execute()){
            $products = $queryProducts->fetchAll(PDO::FETCH_ASSOC);
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
                            <small> - Produkter</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="<?=BASE?>/Dashboard/">Kontrolpanel</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-cubes"></i>  <a href="<?=BASE?>/Products/">Produkter</a>
                            </li>
                            <?php
                            if(@$getParamOpt === 'Add'){
                            ?>
                                <li class="active">
                                    <a href="<?=BASE?>/Products/Add/">Tilføj produkt</a>
                                </li>
                            <?php
                            }
                            ?>
                        </ol>
                    </div>
                </div>
                <div class="row <?=@$success ? '' : 'hidden'?>">
                    <div class="col-lg-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <?=@$successTitle?>
                            </div>
                            <div class="panel-body">
                                <div class="alert alert-success" role="alert">
                                    <?=@$successMsg?>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                

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
                            <?=print_r($_GET) . PHP_EOL?>
                            Defined base : <?=BASE?><br>
                            <?php #print_r($products)?>
                          </pre>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.row -->
                 <div class="row <?=$getParamOpt === 'Add' ? 'hidden': ''?>">
                  <div class="col-lg-4">
                          <a href="<?=BASE?>/Products/Add/" class="btn btn-success"><i class="fa fa-plus"></i>Tilføj Produkt</a>
                    </div>
                  </div>
                
                <!-- /.row -->
                <div class="row <?=$getParamOpt === 'View' || $getParamOpt === 'Add' ? 'hidden': ''?>">
                  <div class="col-lg-12">
                        <h2>Produkter</h2>
                        <table class="table table-stripped table-hover">
                            <thead>
                                <th>Titel</th>
                                <th>Beskrivelse</th>
                                <th>Pris (DKK)</th>
                                <th>Mærke</th>
                                <th>Kategori</th>
                                <th>Billede</th>
                                <th>Redigér<th>
                            </thead>
                            <tbody>
                                <?php
                                    for($productCount = 0; $productCount < count($products); $productCount++){
                                    ?>
                                    <tr>
                                        <td><?=$products[$productCount]['productTitle']?></td>
                                        <td><?=$products[$productCount]['productDetails']?></td>
                                        <td><?=$products[$productCount]['productPrice']?></td>
                                        <td><?=$products[$productCount]['brandName']?></td>
                                        <td><?=utf8_encode($products[$productCount]['categoryName'])?></td>
                                        <td><img src="<?=IMGBASE.'/prod_image/'.$products[$productCount]['pictureFilename']?>" alt="<?=$products[$productCount]['pictureTitle']?>" height="85" width="auto"></td>
                                        <td><a href="<?=BASE?>/View/<?=$products[$productCount]['pid']?>" class="btn btn-info">Ret</a></td>
                                    </tr>
                                    <?php
                                    }
                                ?>
                            </tbody>
                        </table>
                    </div>
                  </div>
                
                <!-- /.row -->
                <div class="row <?=$getParamOpt !== 'Add' ? 'hidden': ''?>">
                  <div class="col-lg-10">
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