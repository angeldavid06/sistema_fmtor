<?php
    require_once "models/Model_t_control_op.php";
    require_once "routes/web.php";

    class controlController{
        public $model;
        public $web;

        public function __construct(){
            $this->model= new TcontrolOp();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('control','');
        }

        public function obtener_control() {
            $control = json_decode($_GET['control']);
            $vista = $control->vista;
            $op = $control->op;
            $ops = $this->model->filtrar($vista,'op',$op);
            $Array = array();
            while ($row = $ops->fetch_array(MYSQLI_ASSOC)) {
                $Array[] = $row;
            }
            $json = json_encode($Array);
            echo $json;
        }

        public function obtener_info_op () {
            if (isset($_GET['op'])) {
                $op = $_GET['op'];
                $ops = $this->model->filtrar('control','op',$op);
                $Array = array();
                while ($row = $ops->fetch_array(MYSQLI_ASSOC)) {
                    $Array[] = $row;
                }
                $json = json_encode($Array);
                echo $json;
            }
        }

        public function insertar() {
            if (isset($_POST['estado']) && isset($_POST['op'])) {
                $no_maquina = $_POST['no_maquina'];
                $fecha = $_POST['fecha'];
                $no_botes = $_POST['no_botes'];
                $pzas = $_POST['pzas'];
                $kg = $_POST['kg'];
                $turno = $_POST['turno'];
                $observaciones = $_POST['observaciones'];
                $control = $_POST['op'];
                $estado = $_POST['estado'];

                $campos = 'no_maquina,fecha,botes,pzas,kilos,turno,observaciones,id_control,id_estado';
                $values = "'$no_maquina','$fecha','$no_botes','$pzas','$kg','$turno','$observaciones','$control','$estado'";
                $result = $this->model->insertar('t_registro_diario',$campos,$values);
                if ($result) {
                    echo 1;
                }
            } else {
                echo 0;
            }
        }

       public function actualizar(){

       }

       public function eliminar(){
           
       }
    }