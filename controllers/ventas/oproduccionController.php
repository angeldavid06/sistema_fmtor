<?php
    require_once "models/Model_t_op.php";
    require_once "routes/web.php";

    class oproduccionController{
        public $model;
        public $web;
    
        public function __construct(){
            $this->model=new Top();
            $this->web = new Web();
        }

        public function mostrar(){
            $this->web->View('oproduccion','');
        }
        
        public function obtener_ordenes () {
            $ops = $this->model->mostrar('oproduccion');
            $Array = array();
            while ($row = $ops->fetch_array(MYSQLI_ASSOC)) {
                $Array[] = $row;
            }
            $json = json_encode($Array);
            
            echo $json;
        }

        

        public function buscar_op () { 
            if (isset($_POST['check_op'])) {
                if (isset($_POST['t_op'])) {
                    $op = $this->model->buscar($_POST['tabla'],'op',$_POST['t_op']);
                    $Array = array();
                    while ($row = $op->fetch_array(MYSQLI_ASSOC)) {
                        $Array[] = $row;
                    }
                    $json = json_encode($Array);
                    echo $json;
                }
            }
        }

        public function buscar_rango_op () {
            if(isset($_POST['check_rango_op'])){
                if(isset($_POST['f_r_op_m'])&& isset($_POST['f_r_op_M'])){
                    $r_op=$this->model->filtrar_rango($_POST['tabla'],'op',$_POST['f_r_op_m'],$_POST['f_r_op_M']);
                    $Array=array();
                    while($row=$r_op->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;
                }
            }  
        }  

        public function buscar_rango_fecha(){
            if(isset($_POST['check_rango_fecha'])){
                if(isset($_POST['f_r_fecha_m'])&& isset($_POST['f_r_fecha_M'])){
                    $r_op=$this->model->filtrar_rango($_POST['tabla'],'fecha',$_POST['f_r_fecha_m'],$_POST['f_r_fecha_M']);
                    $Array=array();
                    while($row=$r_op->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;
                }
            }  
        }  

        public function buscar_fecha(){
            if(isset($_POST['check_fecha'])){
                if(isset($_POST['f_fecha'])){
                    $fecha=$this->model->buscar($_POST['tabla'],'fecha',$_POST['f_fecha']);
                    $Array = array();
                    while($row = $fecha->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;
                }
            }
        }

        public function buscar_mes(){
            if(isset($_POST['check_fecha_mes'])){
                if(isset($_POST['f_mes'])){
                    $value ='-'.$_POST['f_mes'].'-';
                    $mes = $this->model->filtrar($_POST['tabla'],'fecha',$value);
                    $Array = array();
                    while($row = $mes->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;
                }
            }
        }

        public function buscar_anio(){
            if(isset($_POST['check_fecha_anio'])){
                if(isset($_POST['f_anio'])){
                    $value=$_POST['f_anio'].'-';
                    $anio=$this->model->filtrar($_POST['tabla'],'fecha',$value);
                    $Array=array();
                    while($row = $anio->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;

                }
            }
        }

        public function buscar_cliente(){
            if(isset($_POST['check_cliente'])){
                if(isset($_POST['f_cliente'])){
                    $cliente=$this->model->buscar($_POST['tabla'],'Cliente',$_POST['f_cliente']);
                    $Array= array();
                    while($row = $cliente->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;
                }
            }
        }

        public function buscar_estado(){
            if(isset($_POST['check_estado'])){
                if(isset($_POST['f_estado'])){
                    $estado=$this->model->buscar($_POST['tabla'],'estado',$_POST['f_estado']);
                    $Array= array();
                    while($row = $estado->fetch_array(MYSQLI_ASSOC)){
                        $Array[]=$row;
                    }
                    $json=json_encode($Array);
                    echo $json;
                }
            }
        }




   }

   