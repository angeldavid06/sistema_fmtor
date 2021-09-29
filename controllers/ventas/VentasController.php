<?php

    require_once "models/ventas/model.php";
    require_once "routes/web.php";

    class VentasController {
        public $model;
        public $web;

        public function __construct(){
            // $this->model= new TcontrolOp();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('ventas','main','');
        }
    }
?>