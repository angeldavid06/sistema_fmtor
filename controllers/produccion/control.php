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

        public function obtener_control() {
            $control = json_decode($_GET['control']);
            $vista = $control->vista;
            $op = $control->op;
            $ops = $this->model->buscar($vista,'Id_Folio',$op);
            $json = json_encode($ops);
            echo $json;
        }

        public function obtener_info_op () {
            if (isset($_GET['op'])) {
                $op = $_GET['op'];
                $ops = $this->model->filtrar('v_control','Orden_Produccion',$op);
                $json = json_encode($ops);
                echo $json;
            }
        }

        public function insertar() {
            if (isset($_POST['estado']) && isset($_POST['op'])) {
                $factor = $_POST['factor'];
                $no_maquina = $_POST['no_maquina'];
                $fecha = $_POST['fecha'];
                $no_botes = $_POST['no_botes'];
                $pzas = $_POST['pzas'];
                $kg = $_POST['kg'];
                $turno = $_POST['turno'];
                $observaciones = $_POST['observaciones'];

                $id_folio = $_POST['op'];
                $estado = $_POST['estado'];

                $campos = 'factor,no_maquina,fecha,botes,pzas,kilos,turno,observaciones,estado_general,id_estados_1,Id_Folio_1';
                $values = "'$factor','$no_maquina','$fecha','$no_botes','$fecha','$kg','$turno','$observaciones','PENDIENTE','$estado','$id_folio'";
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
           if (isset($_GET['dato'])) {
               $id = $_GET['dato'];
               $result = $this->model->eliminar('t_registro_diario',"id_registro_diario = '$id'");
               echo $result;
           }
       }
    }