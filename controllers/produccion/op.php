<?php
    require_once "models/Model.php";
    require_once "routes/web.php";

    class op {
        public $model;
        public $web;
    
        public function __construct(){
            $this->model = new Model();
            $this->web = new Web();
        }
        
        public function pdf_ordenes () {
            if (isset($_GET['formato'])) {
                if ($_GET['filtro'] == 'op') {
                    $data = $this->model->buscar($_GET['formato'],'Id_Folio',$_GET['f_op']);
                } else if($_GET['filtro'] == 'r_op'){
                    $data = $this->model->filtrar_rango($_GET['formato'],'Id_Folio',$_GET['f_r_op_m'],$_GET['f_r_op_M']);
                } else if($_GET['filtro'] == 'r_fecha'){
                    $data = $this->model->filtrar_rango($_GET['formato'],'fecha',$_GET['f_r_fecha_m'],$_GET['f_r_fecha_M']);
                } else if($_GET['filtro'] == 'fecha'){
                    $data = $this->model->buscar($_GET['formato'],'fecha',$_GET['f_fecha']);
                } else if($_GET['filtro'] == 'cliente'){
                    $data = $this->model->buscar($_GET['formato'],'Clientes',$_GET['f_cliente']);
                } else if($_GET['filtro'] == 'estado'){
                    $data = $this->model->buscar($_GET['formato'],'estado_general',$_GET['f_estado']);
                } else if($_GET['filtro'] == 'mes'){
                    $value ='-'.$_GET['f_mes'].'-';
                    $data = $this->model->filtrar($_GET['formato'],'fecha',$value);
                } else if($_GET['filtro'] == 'anio'){
                    $value = $_GET['f_anio'].'-';
                    $data = $this->model->filtrar($_GET['formato'],'fecha',$value);
                } else {
                    $data = $this->model->mostrar($_GET['formato']);
                }

                if ($_GET['formato'] == 'v_ordenes') {
                    $this->web->PDF('produccion/ordenes',$data);
                } else {
                    $this->web->PDF('produccion/diario',$data);
                }
            }
        }

        public function acumulado () {
            if (isset($_GET['Id_Folio'])) {
                $pzas = $this->model->buscar_personalizado('t_registro_diario','SUM(pzas) AS acumulado', "Id_control_produccion_1 = '".$_GET['Id_Folio']."'");
                $json = json_encode($pzas);
                echo $json;
            } else {
                echo 0;
            }
        }

        // public function buscar_personalizado ($tabla,$campos,$condicion) {
        //     $sql = "SELECT $campos FROM $tabla WHERE $condicion";

        public function obtener_ordenes () {
            $ops = $this->model->mostrar('v_ordenes');
            $json = json_encode($ops);
            echo $json;
        }

        public function obtener_reporte_diario () {
            $ops = $this->model->mostrar('v_reportediario');
            $json = json_encode($ops);
            echo $json;
        }

        public function obtener_plano () {
            if (isset($_GET['id_plano'])) {
                $plano = $this->model->buscar('v_planos','Id_Catalogo',$_GET['id_plano']);
                echo base64_encode($plano[0]['PDF']);
            } else {
                echo 2;
            }
        }

        public function buscar_op () { 
            if (isset($_POST['check_op'])) {
                if (isset($_POST['f_op'])) {
                    $op = $this->model->buscar($_POST['tabla'],'Id_Folio',$_POST['f_op']);
                    $json = json_encode($op);
                    echo $json;
                } else {
                    echo 2;
                }
            } else {
                echo 1;
            }
        }

        public function buscar_rango_op () {
            if(isset($_POST['check_rango_op'])){
                if(isset($_POST['f_r_op_m'])&& isset($_POST['f_r_op_M'])){
                    $r_op=$this->model->filtrar_rango($_POST['tabla'],'Id_Folio',$_POST['f_r_op_m'],$_POST['f_r_op_M']);
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
                    $cliente=$this->model->buscar($_POST['tabla'],'Clientes',$_POST['f_cliente']);
                    $json=json_encode($cliente);
                    echo $json;
                }
            }
        }

        public function buscar_estado(){
            if(isset($_POST['check_estado'])){
                if(isset($_POST['f_estado'])){
                    $estado=$this->model->buscar($_POST['tabla'],'estado_general',$_POST['f_estado']);
                    $json=json_encode($estado);
                    echo $json;
                }
            }
        }
   }