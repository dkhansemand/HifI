<?php
$queryNews = $conn->newQuery("SELECT news.id, news.title, news.content, DATE_FORMAT(news.dateAdded, '%d/%m %Y %h:%i') AS newsDate, pictures.filename AS newsPic, pictures.title AS newsPicTitle
                                    FROM hifi_news AS news
                                    LEFT JOIN hifi_pictures AS pictures ON pictures.filename = news.pictureId
                                    LIMIT 4;");
if($queryNews->execute()){
    while($news = $queryNews->fetch(PDO::FETCH_ASSOC)){
        if(!empty($news['newsPic'])){
            $image = $news['newsPic'];
        }else{
            $image = 'http://placehold.it/500x300';
        }
?>
    <div class="col-xs-18 col-sm-6 col-md-3">
        <div class="thumbnail">
        <img src="<?=$image?>" alt="<?=$news['newsPicTitle']?>">
            <div class="caption">
            <h4><?=$news['title']?></h4>
            <p class="text-muted"><?=$news['newsDate']?></p>
            <p><?=$news['content'];?></p>
            <p><a href="#id=<?=$news['id']?>" class="btn btn-default btn-xs" role="button">Læs mere</a></p>
        </div>
        </div>
    </div>
<?php
    }
}
            