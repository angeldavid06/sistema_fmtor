<?php
    require_once "../../models/Model.php";
    require_once "routes/web.php";

    class opController{
        public $model;
        public $web;
    
        public function __construct(){
            $this->model = new Model();
            $this->web = new Web();
        }

        public function mostrar(){
            $this->web->View('ordenes','');
        }
        
        public function obtener_ordenes () {
            $ops = $this->model->mostrar('ordenes');
            $json = json_encode($ops);
            echo $json;
        }

        public function obtener_reporte_diario () {
            $ops = $this->model->mostrar('reporte_diario');
            $json = json_encode($ops);
            echo $json;
        }

        public function buscar_op () { 
            if (isset($_POST['check_op'])) {
                if (isset($_POST['f_op'])) {
                    $op = $this->model->buscar($_POST['tabla'],'op',$_POST['f_op']);
                    $json = json_encode($op);
                    echo $json;
                }
            }
        }

        public function buscar_rango_op () {
            if(isset($_POST['check_rango_op'])){
                if(isset($_POST['f_r_op_m'])&& isset($_POST['f_r_op_M'])){
                    $r_op=$this->model->filtrar_rango($_POST['tabla'],'op',$_POST['f_r_op_m'],$_POST['f_r_op_M']);
                    $json=json_encode($r_op);
                    echo $json;
                }
            }  
        }  

        public function buscar_rango_fecha(){
            if(isset($_POST['check_rango_fecha'])){
                if(isset($_POST['f_r_fecha_m'])&& isset($_POST['f_r_fecha_M'])){
                    $r_op=$this->model->filtrar_rango($_POST['tabla'],'fecha',$_POST['f_r_fecha_m'],$_POST['f_r_fecha_M']);
                    $json=json_encode($r_op);
                    echo $json;
                }
            }  
        }  

        public function buscar_fecha(){
            if(isset($_POST['check_fecha'])){
                if(isset($_POST['f_fecha'])){
                    $fecha=$this->model->buscar($_POST['tabla'],'fecha',$_POST['f_fecha']);
                    $json=json_encode($fecha);
                    echo $json;
                }
            }
        }

        public function buscar_mes(){
            if(isset($_POST['check_fecha_mes'])){
                if(isset($_POST['f_mes'])){
                    $value ='-'.$_POST['f_mes'].'-';
                    $mes = $this->model->filtrar($_POST['tabla'],'fecha',$value);
                    $json=json_encode($mes);
                    echo $json;
                }
            }
        }

        public function buscar_anio(){
            if(isset($_POST['check_fecha_anio'])){
                if(isset($_POST['f_anio'])){
                    $value=$_POST['f_anio'].'-';
                    $anio=$this->model->filtrar($_POST['tabla'],'fecha',$value);
                    $json=json_encode($anio);
                    echo $json;

                }
            }
        }

        public function buscar_cliente(){
            if(isset($_POST['check_cliente'])){
                if(isset($_POST['f_cliente'])){
                    $cliente=$this->model->buscar($_POST['tabla'],'Cliente',$_POST['f_cliente']);
                    $json=json_encode($cliente);
                    echo $json;
                }
            }
        }

        public function buscar_estado(){
            if(isset($_POST['check_estado'])){
                if(isset($_POST['f_estado'])){
                    $estado=$this->model->buscar($_POST['tabla'],'estado',$_POST['f_estado']);
                    $json=json_encode($estado);
                    echo $json;
                }
            }
        }
   }