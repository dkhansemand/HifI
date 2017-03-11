<?php
require_once './partials/header.php';

if(!empty($_GET['p'])){
    $page = (string)$_GET['p'];
    if(file_exists('./pages/' . $page . '.php')){
        $page = (string)$_GET['p'];
    }else{
        $page = 'dashboard';
    }
}else{
   $page = 'dashboard';
}

include './pages/' . $page . '.php';

require_once './partials/footer.php';

?>



