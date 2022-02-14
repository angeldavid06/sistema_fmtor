<?php

    require_once "models/ventas/model.php";
    require_once "routes/web.php";

    class Main {
        public $model;
        public $web;

        public function __construct(){
            // $this->model= new NombreDelModelo();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('ventas/main','');
        }

        public function cotizacion () {
            $this->web->View('ventas/cotizacion','');
        }
        
              public function reportes () {
            $this->web->View('ventas/reportes','');
        }
        public function salidas () {
            $this->web->View('ventas/salidas','');
        }
        public function clientes () {
            $this->web->View('ventas/clientes','');
          
        }
         public function orden () {
            $this->web->View('ventas/orden','');
          
        }
        
        public function tarjeta () {
            $this->web->View('ventas/tarjeta','');
        }
      
        
    }
?>