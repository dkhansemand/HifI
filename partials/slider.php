<?php
    $querySlider = $conn->newQuery("SELECT sid, sliderTitle, sliderContent, sliderLink, pictureFilename, pictureTitle
                                    FROM hifi_imageslider
                                    INNER JOIN hifi_pictures ON pictureId = sliderImageId");
    if($querySlider->execute()){
        $slider = $querySlider->fetchAll(PDO::FETCH_ASSOC);
        ?>
 <aside id="myCarousel" class="container carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
        <?php
            for($indiCnt = 0; $indiCnt < count($slider); $indiCnt++){
        ?>
            <li data-target="#myCarousel" data-slide-to="<?=$indiCnt?>" class="<?=$indiCnt == 0 ? 'active': ''?>"></li>
        <?php
            }
        ?>
        </ol>
        <section class="carousel-inner">
        <?php
            for($slideCnt = 0; $slideCnt < count($slider); $slideCnt++){

        ?>
            <figure class="item <?=$slideCnt == 0 ? 'active': ''?>">
                <img src="./img/<?=$slider[$slideCnt]['pictureFilename']?>" alt="<?=$slider[$slideCnt]['pictureTitle']?>">
                <figcaption class="carousel-caption">
                    <h1><?=$slider[$slideCnt]['sliderTitle']?></h1>
                    <p><?=$slider[$slideCnt]['sliderContent']?></p>
                    <p><a class="btn btn-lg btn-primary" href="<?=$slider[$slideCnt]['sliderLink']?>" role="button">Læs mere</a></p>
                </figcaption>
            </figure>
           <?php
            }
           ?>
        </section>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </aside>
        <?php
    }
?> 
 
