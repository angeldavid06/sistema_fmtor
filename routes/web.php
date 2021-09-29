<?php

    class Web {
        public function View ($system,$view,$data) {
            if (file_exists('views/'.$system.'/'.$view.'.php')) {
                require_once 'views/'.$system.'/'.$view.'.php';
            } else {    
                echo 'La vista no existe';
            }
        } 
    }

?>