<?php
    $queryMain = $conn->newQuery("SELECT mcHeading, mcSubHeading, mcContent, pictureFilename, pictureTitle
                                    FROM hifi_maincontent
                                    INNER JOIN hifi_pictures ON pictureId = mcPictureId");
    if($queryMain->execute()){
        $mainContent = $queryMain->fetchAll(PDO::FETCH_ASSOC);
        for($mainCnt = 0; $mainCnt < count($mainContent); $mainCnt++){
    ?>
        <article class="row featurette">
            <section class="col-md-7">
                <h2 class="featurette-heading"><?=$mainContent[$mainCnt]['mcHeading']?>
                    <span class="text-muted"><?=$mainContent[$mainCnt]['mcSubHeading']?></span>
                </h2>
                <p class="lead"><?=$mainContent[$mainCnt]['mcContent']?></p>
            </section>
            <section class="col-md-5">
                <img class="featurette-image img-responsive" src="img/<?=$mainContent[$mainCnt]['pictureFilename']?>" alt="<?=$mainContent[$mainCnt]['pictureTitle']?>">
            </section>
        </article>
    <?php
        }
    }       
