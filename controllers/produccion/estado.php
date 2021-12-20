<?php 

    require_once "models/Model.php";
    require_once "routes/web.php";

    class Estado {
        public $model;
        public $web;
    
        public function __construct(){
            $this->model = new Model();
            $this->web = new Web();
        }

        public function obtener() {
            $data = $this->model->mostrar('v_estado_op');
            echo json_encode($data);
        }

        public function pdf_estado () {
            $data = $this->model->mostrar('v_estado_op');
            $this->web->PDF('produccion/estado',$data);
        }
    }

?>