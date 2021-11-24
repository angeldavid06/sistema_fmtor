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
        
        public function controlp () {
            $this->web->View('ventas/controlp','');
        }
        public function oproduccion () {
            $this->web->View('ventas/oproduccion','');
        }
        public function costos () {
            $this->web->View('ventas/costos','');
        }

        public function cotizacion () {
            $this->web->View('ventas/cotizacion','');
        }
        
        public function ordenes () {
            $this->web->View('ventas/oproduccion','');
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
        public function registro_clientes () {
            $this->web->View('ventas/registro_clientes','');
          
        }
       
        
    }
?>