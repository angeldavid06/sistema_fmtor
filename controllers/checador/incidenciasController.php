<?php
    require_once "models/Model.php";
    require_once "models/checador/incidenciasModel.php";
    require_once "routes/web.php";

    class incidenciasController{
        public $model;
        public $web;
        public $incidenciasModel;

        public function __construct()
        {
            $this->incidenciasModel = new incidenciasModel();
            $this->model= new Model();
            $this->web = new Web();
        }

        public function pdf_listas () {

        }
        
        public function obtener()
        {
           $result = $this->model->mostrar('v_incidencias');
            echo json_encode($result);
        }
        public function obtenerIn(){
            $result = $this->model->mostrar('t_incidencias');
            echo json_encode($result); 
        }
        public function obtener_incidencia()
        {
            $result = $this->model->buscar_personalizado('v_incidencias', '*', 'v_incidencias = id_empleados' . $_GET['aux'] . '');
            echo json_encode($result);
        }

        public function buscar_incidencias_edit(){
            if (isset($_POST['check_incidenciasEdit'])) {
                if (isset($_POST['incidencias_edit'])) {
                    $lisd = $this->model->buscar($_POST['tabla'],'lisalida',$_POST['incidencias_edit']); //verificar lisd que va ahi=?
                    $json = json_encode($lisd);
                    echo $json;
                } else {
                    echo 2;
                }
            } else {
                echo 1;
            }
        }

        public function buscar_incidencia_mostrar(){
            if (isset($_POST['check_incidenciasMostrar'])) {
                if (isset($_POST['incidencia_mostrar'])) {
                    $lisd = $this->model->buscar($_POST['tabla'],'lisalida',$_POST['incidencia_mostrar']); //verificar lisd que va ahi=?
                    $json = json_encode($lisd);
                    echo $json;
                } else {
                    echo 2;
                }
            } else {
                echo 1;
            }
        }

        public function buscarEmpleado(){
            $result = $this->model->buscar_personalizado('t_empleados','id_empleados,nombre,apellidoP,apellidoM','1');
            echo json_encode($result);
        }

        public function NuevaIncidencia()
        { //datos de formulario
            if (isset($_POST['id_empleado']) && $_POST['id_empleado'] != '') {
                $this->incidenciasModel->setIdEmpleados($_POST['id_empleado']);
    
                if (isset($_POST['tipo_incidencia']) && $_POST['tipo_incidencia'] != '') {
                    $this->incidenciasModel-> setTipoIncidencia($_POST['tipo_incidencia']);
    
                    if (isset($_POST['inicio_in']) && $_POST['inicio_in'] != '') {
                        $this->incidenciasModel->setInicioIn($_POST['inicio_in']);
    
                        if (isset($_POST['fin_in']) && $_POST['fin_in'] != '') {
                            $this->incidenciasModel->setFinIn($_POST['fin_in']);

                           // $result= $this->incidenciasModel->insertarIncidencias(); 
                           // echo json_encode($result); 
                            echo json_encode($this->incidenciasModel->insertarIncidencias());

                        } else {
                            echo 3;
                        }
                    } else {
                        echo 2;
                    }
                } else {
                    echo 1;
                }
            } else {
                echo 0;
            }
        }
     
        public function actualizarIncidencia()
        {
            if (isset($_POST['id_incidencias'])) {
                $id_empleados = $_POST['id_empleado'];
                $tipo_incidencia = $_POST['tipo_incidencia'];
                $inicio_in = $_POST['inicio_in'];
                $fin_in = $_POST['fin_in'];
          
                $id_incidencias = $_POST['id_incidencia_edit'];
    
                $valores = "id_empleados = '$id_empleados', tipo_incidencia = '$tipo_incidencia', inicio_in = '$inicio_in', fin_in= '$fin_in'";
                $condicion = "id_incidencias = '$id_incidencias'";
                $result = $this->incidenciasModel->actualizarIncidencias('t_incidencias', $valores, $condicion);
                if ($result) {
                    echo 1;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            } 
        }
    
        public function eliminar()
        {
            if (isset($_GET['id'])) {
                $id_incidencias = $_GET['id'];
                $result = $this->model->eliminar('t_incidencias', "id_incidencias = '$id_incidencias'");
                echo $result;
            }
        }

        
    }