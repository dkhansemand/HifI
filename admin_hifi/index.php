<?php

if(!empty($_GET['p'])){
    $page = (string)$_GET['p'];
    if(file_exists('./pages/' . $page . '.php')){
        require_once './partials/header.php';
        include './pages/' . $page . '.php';
    }else{
         header('Location: ../dashboard/', true);
    }
}else{
    header('Location: ../dashboard/', true);
}

require_once './partials/footer.php';

?>



