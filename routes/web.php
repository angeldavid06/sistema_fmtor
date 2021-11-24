<?php

    class Web {
        public function View ($view,$data) {
            if (file_exists('views/'.$view.'.php')) {
                require_once 'views/'.$view.'.php';
            } else {    
                echo 'La vista no existe';
            }
        } 
        
        public function PDF ($view,$data) {
            if (file_exists('public/pdf/'.$view.'.php')) {
                require_once 'public/pdf/'.$view.'.php';
            } else {    
                echo 'La vista no existe';
            }
        }
    }

?>