<?php

    require_once "models/produccion/model.php";
    require_once "routes/web.php";

    class ProduccionController {
        public $model;
        public $web;

        public function __construct(){
            // $this->model= new NombreDelModelo();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('produccion','main','');
        }
    }
?>