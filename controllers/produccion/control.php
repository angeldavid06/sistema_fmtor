<?php
    require_once "models/Model.php";
    require_once "routes/web.php";

    class control{
        public $model;
        public $web;

        public function __construct(){
            $this->model= new Model();
            $this->web = new Web();
        }

        public function mostrar () {
            $this->web->View('control','');
        }

        public function mostrarV_forjado(){
            $this->web->View('v_control','');
        } 

        public function mostrarV_for(){
            $this->web->View('v_forjado','');
        }

        public function mostrarV_ranurado(){
            $this->web->View('v_ranurado','');
        }

        public function mostrarV_rolado(){
            $this->web->View('v_rolado','');
        }

        public function mostrarV_shank(){
            $this->web->View('v_shank','');
        }

        public function mostrarV_cementado(){
            $this->web->View('v_cementado','');
        }

        public function mostrarV_acabado(){
            $this->web->View('v_acabado','');
        }
        
        public function obtener_control() {
            $control = json_decode($_GET['control']);
            $vista = $control->vista;
            $op = $control->op;
            $ops = $this->model->filtrar($vista,'op',$op);
            $json = json_encode($ops);
            echo $json;
        }

        public function obtener_info_op () {
            if (isset($_GET['op'])) {
                $op = $_GET['op'];
                $ops = $this->model->filtrar('v_control','op',$op);
                $json = json_encode($ops);
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
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

       public function actualizar(){

       }

       public function eliminar(){
           if (isset($_POST['registro_diario'])) {
               $id = $_POST['registro_diario'];
               $this->model->eliminar('','');
           }
       }
    }