<?php

    require_once './lib/class.mysql.php';

    $conn = new dbconnector();

    $query = $conn->newQuery("SELECT * FROM hifi_products;SELECT * FROM hifi_category;SELECT * FROM hifi_brands");
    $query->execute();
    echo '<pre>';
    do{
   foreach(new RecursiveArrayIterator($query->fetchAll(PDO::FETCH_ASSOC)) as $key=>$val){
    //echo $key.' : '.$val.'<br>';
    if(array_key_exists('catId', $val)){
       echo $val['categoryName'] . '<br>';
    }
    //print_r($val);
   }
    }while($query->nextRowset());

    echo '</pre>';

    $conn = null;
