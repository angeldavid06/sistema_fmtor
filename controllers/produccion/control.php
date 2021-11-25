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

        public function obtener_control() {
            $control = json_decode($_GET['control']);
            $vista = $control->vista;
            $op = $control->op;
            $ops = $this->model->buscar($vista,'Id_Folio_1',$op);
            $json = json_encode($ops);
            echo $json;
        }

        public function pdf_control () {
            if (isset($_GET['valor'])) {
                $control = $this->model->buscar('v_control','Orden_Produccion',$_GET['valor']);
                $this->model= new Model();
                $forjado = $this->model->buscar('v_forjado','Id_Folio_1',$_GET['valor']);
                $this->model= new Model();
                $ranurado = $this->model->buscar('v_ranurado','Id_Folio_1',$_GET['valor']);
                $this->model= new Model();
                $rolado = $this->model->buscar('v_rolado','Id_Folio_1',$_GET['valor']);
                $this->model= new Model();
                $shank = $this->model->buscar('v_shank','Id_Folio_1',$_GET['valor']);
                $this->model= new Model();
                $cementado = $this->model->buscar('v_cementado','Id_Folio_1',$_GET['valor']);
                $this->model= new Model();
                $acabado = $this->model->buscar('v_acabado','Id_Folio_1',$_GET['valor']);

                $data = [
                    "control" => $control,
                    "forjado" => $forjado,
                    "ranurado" => $ranurado,
                    "rolado" => $rolado,
                    "shank" => $shank,
                    "cementado" => $cementado,
                    "acabado" => $acabado
                ];

                $this->web->PDF('produccion/control',$data);
            } else {
                echo 0;
            }
        }

        public function obtener_info_op () {
            if (isset($_GET['op'])) {
                $op = $_GET['op'];
                $ops = $this->model->buscar('v_control','Orden_Produccion',$op);
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

                $id_folio = $_POST['op'];
                $estado = $_POST['estado'];

                $campos = 'no_maquina,fecha,botes,pzas,kilos,turno,observaciones,id_estados_1,Id_control_produccion_1';
                $values = "'$no_maquina','$fecha','$no_botes','$pzas','$kg','$turno','$observaciones','$estado','$id_folio'";
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

        public function obtener_registro () {
            if (isset($_GET['registro'])) {
                $id = $_GET['registro'];
                $result = $this->model->buscar('t_registro_diario','id_registro_diario',$id);
                echo json_encode($result);
            }
        }

        public function actualizar(){
            if (isset($_POST['a_estado']) && isset($_POST['a_op'])) {
                $no_maquina = $_POST['a_no_maquina'];
                $fecha = $_POST['a_fecha'];
                $no_botes = $_POST['a_no_botes'];
                $pzas = $_POST['a_pzas'];
                $kg = $_POST['a_kg'];
                $turno = $_POST['a_turno'];
                $observaciones = $_POST['a_observaciones'];

                $id_folio = $_POST['a_op'];
                $estado = $_POST['a_estado'];

                $valores = "no_maquina = '$no_maquina', fecha = '$fecha', botes = '$no_botes', pzas = '$pzas', kilos = '$kg', turno = '$turno', observaciones = '$observaciones',estado_general = 'PENDIENTE', id_estados_1 = '$estado'";
                $condicion = "id_registro_diario = '$id_folio'";
                $result = $this->model->actualizar('t_registro_diario',$valores,$condicion);
                if ($result) {
                    echo 1;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

       public function eliminar(){
           if (isset($_GET['dato'])) {
               $id = $_GET['dato'];
               $result = $this->model->eliminar('t_registro_diario',"id_registro_diario = '$id'");
               echo $result;
           }
       }
    }