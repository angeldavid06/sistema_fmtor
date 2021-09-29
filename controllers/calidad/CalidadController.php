<?php

    require_once "models/calidad/model.php";
    require_once "routes/web.php";

    class CalidadController {
        public $model;
        public $web;

        public function __construct(){
            // $this->model= new TcontrolOp();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('calidad','main','');
        }
    }
?>