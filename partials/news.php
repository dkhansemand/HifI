<?php
$queryNews = $conn->newQuery("SELECT nid, newsTitle, newsContent, DATE_FORMAT(newsAdded, '%d/%m %Y %h:%i') AS newsDate, pictureFilename, pictureTitle
                                    FROM hifi_news 
                                    LEFT JOIN hifi_pictures ON pictureFilename = newsPictureId
                                    LIMIT 4;");
if($queryNews->execute()){
    while($news = $queryNews->fetch(PDO::FETCH_ASSOC)){
        if(!empty($news['pictureFlename'])){
            $image = $news['pictureFilename'];
        }else{
            $image = 'http://placehold.it/500x300';
        }
?>
    <div class="col-xs-18 col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="<?=$image?>" alt="<?=$news['pictureTitle']?>">
            <div class="caption">
            <h4><?=$news['newsTitle']?></h4>
            <p class="text-muted"><?=$news['newsDate']?></p>
            <p><?=$news['newsContent'];?></p>
            <p><a href="#id=<?=$news['nid']?>" class="btn btn-default btn-xs" role="button">Læs mere</a></p>
        </div>
        </div>
    </div>
<?php
    }
}
            