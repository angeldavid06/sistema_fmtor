<?php

    require_once "models/sii/model.php";
    require_once "routes/web.php";

    class Main {
        public $model;
        public $web;

        public function __construct(){
            // $this->model= new TcontrolOp();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('sii/main','');
        }
    }
?>