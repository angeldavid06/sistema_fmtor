<?php 

    require_once 'models/Model.php';
    require_once 'routes/web.php';

    class Maquinas {
        public $model;
        public $web;

        public function __construct() {
            $this->model = new Model();
            $this->web = new Web();
        }

        public function obtener_reporte () {
            if (isset($_GET['inicio']) && isset($_GET['fin']) && isset($_GET['concepto'])) {
                $inicio = $_GET['inicio'];
                $fin = $_GET['fin'];
                $concepto = $_GET['concepto'];
                $result = $this->model->filtrar_rango('v_reporte_'.$concepto,'fecha',$inicio,$fin);
                echo json_encode($result);
            } else {
                echo 0;
            }
        }
    }

?>