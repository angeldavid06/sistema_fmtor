<?php

    require_once 'layout.php';

    class Web_Layout extends Layout {
        public $url_server;

        public function __construct() {
           $this->url_server = 'http://localhost/sistema_fmtor';
        }

        public function View ($view,$data) {
            if (file_exists('views/'.$view.'.php')) {
                Layout::StartLayout();
                require_once 'views/'.$view.'.php';
                Layout::EndLayout();
            } else { 
                require_once 'controllers/error.php';
                $error = new Errores();
            }
        } 
    }
