<?php 

    require_once 'models/checador/registrosModel.php';
    require_once 'routes/web.php';

    class registro_prueba {
        public $model;
        public $web;
        public $mo;

        public function __construct() {
            $this->web = new Web();
            $this->mo = new registrosModel();  
        }

        public function insertar_h () {
            $json = $_GET['json'];
            $data = json_decode($json);

            $this->mo->setUsuario($data->id);
            $this->mo->setFecha($data->entrada);
            $this->mo->setTipoRegistro($data->tipo);

            echo $this->mo->insertar1();
        }

        public function consultar_h () {
            $json = $_GET['json'];
            $data = json_decode($json);

            $this->mo->setUsuario($data->id);
            echo $this->mo->consultar();
        }
    }
    
?>