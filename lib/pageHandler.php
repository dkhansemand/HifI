<?php

class pageHandler {
    function __constructor($page){
        if(!empty($page)){
            if(file_exists('../partials/' . $page . '.php')){
                return './partials/' . $page . '.php';
            }
        }else{
            return 'home';
        }
    }
}