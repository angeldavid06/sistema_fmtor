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
            if (isset($_GET['inicio']) && isset($_GET['fin']) && isset($_GET['concepto']) && isset($_GET['vista'])) {
                $inicio = $_GET['inicio'];
                $fin = $_GET['fin'];
                $concepto = $_GET['concepto'];
                $id_vista = $_GET['vista'];
                $vista = '';
                if ($id_vista == 1) {
                    $vista = 'forjado';
                } else if ($id_vista == 2) {
                    $vista = 'ranurado';
                } else if ($id_vista == 3) {
                    $vista = 'rolado';
                } else if ($id_vista == 6) {
                    $vista = 'acabado';
                }
                $result = $this->model->filtrar_rango('v_reporte_'.$vista.'_'.$concepto,'fecha',$inicio,$fin);
                echo json_encode($result);
            } else {
                echo 0;
            }
        }
    }

?>