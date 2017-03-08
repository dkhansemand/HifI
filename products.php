<?php
    ## Include header (With navigation) | MySQL connection open within header
    include './partials/header.php';

    ## Check if catID is NOT empty and type of is_numeric
    if(!empty($_GET['catID']) && is_numeric($_GET['catID'])){
        $CategoryID = (int)$_GET['catID'];

        ## Get all products in given category
        $query = $conn->newQuery("SELECT pid, productTitle, productDetails, productPrice,
        brandName, pictureFilename, pictureTitle, categoryName 
        FROM hifi_category
        LEFT JOIN hifi_products ON catId = productCategoryId
        LEFT JOIN hifi_pictures ON pictureId = productPicture
        LEFT JOIN hifi_brands ON bid = productBrandId
        WHERE catId = :CATID;
        ");
        $query->bindParam(":CATID", $CategoryID, PDO::PARAM_INT);
        
        ## Check if the statement can be executed
        if($query->execute()){
            if($query->rowCount()){
                $rows= $query->fetchAll(PDO::FETCH_ASSOC);
                ?>
                    <section class="container heading">
                    <article class="row">
                        <section class="col-lg-12">
                            <h3><?=utf8_encode($rows[0]['categoryName'])##UTF8 encode indtil fejl er fundet?></h3>
                        </section>
                    </article>
                    <hr class="featurette-divider">
                <?php
                
                if(!empty($rows[0]['pid'])){
                    ## Loop through results
                    foreach ($rows as $product){
                        ?>
                            <article class="row">
                                <section class="col-md-12">
                                    <figure>
                                        <a href="#" class="thumbnail">
                                        <figcaption>
                                            <h3 class="title"><?=$product['brandName']?> - <span class="text-muted"><?=$product['productTitle']?></span></h3>
                                            <p>
                                                <?=$product['productDetails']?>
                                            </p>
                                            <var><abbr title="DKK">Pris:</abbr> <?=str_replace('.',',',$product['productPrice'])?> kr</var>
                                        </figcaption>
                                            <img src="prod_image/<?=$product['pictureFilename']?>" alt="<?=$product['pictureTitle']?>">
                                        </a>
                                    </figure>
                                </section>
                            </article>
                        <?php
                    }
                }else{
                ?>
                <div class="panel panel-default">
                    <div class="panel-heading">Ingen produkter</div>
                        <div class="panel-body">
                            <div class="alert alert-warning" role="alert">
                                Der er ingen produkter i denne kategori!
                            </div>
                        </div>
                    </div>  
                </div>    
                <?php
                }
            }else{
                ?>
                <br><br><br>
                <div class="panel panel-default">
                    <div class="panel-heading">Intet fundet!</div>
                        <div class="panel-body">
                            <div class="alert alert-warning" role="alert">
                                Der er intet fundet i databasen!
                            </div>
                        </div>
                    </div>  
                </div>    

                <?php
            }
        }

    }

    ?>
    </section>
<?php

## Include footer
include './partials/footer.php';
