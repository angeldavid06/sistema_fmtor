<?php
    require_once "models/Model.php";
    require_once "models/ventas/cotizacionModel.php";
    require_once "routes/web.php";

    class cotizacion {
        public $model;
        public $web;
        public $cotizacion;

        public function __construct () {
            $this->cotizacion = new cotizacionModel();
            $this->web = new Web();
            $this->model = new Model();
        }

        public function obtener_cotizaciones () {
            $result = $this->model->mostrar('v_cotizaciones');
            echo json_encode($result);
        }

        public function generarpdf () {
            $data = $this->model->buscar('v_cotizacion', 'id_folio', $_GET['id']);
            $this->web->PDF('ventas/cotizacion', $data);
        }
    }
