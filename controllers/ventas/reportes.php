<?php
require_once "models/Model.php";
require_once "models/ventas/reporteModel.php";
require_once "routes/web.php";

    class reportes {
        public $model;
        public $web;
		public $reporte;
    
        public function __construct()
        {
            $this->reporte = new reporteModel();
            $this->web = new Web();
            $this->model = new Model();
        }
		
        public function buscar(){
            $id_reporte=$_GET['clave'];

                $result = $this->model->buscar('v_mensual_reporte','Id_reporte',$id_reporte);
                echo json_encode($result);
            
        }

		public function obtener () {
			$result = $this->model->mostrar('v_mensual_reporte');
			echo json_encode($result);
		}

		public function obtener_per()
        {
            $result = $this->model->buscar_personalizado('t_reporte','Id_reporte,Mes_de_creacion','Id_reporte ='.$_GET['aux'].'');
            echo json_encode($result);
        }

        public function obtener_plano () {
            if (isset($_GET['id_plano'])) {
                $plano = $this->model->buscar('v_cliente_reporte','Id_reporte',$_GET['id_plano']);
                echo base64_encode($plano[0]['PDF']);
            } else {
                echo 2;
            }
        }


		public function Nuevoreporte(){
            if (isset($_POST['Mes_de_creacion']) && $_POST['Mes_de_creacion'] != '') {
                $this->reporte->setMes_de_creacion($_POST['Mes_de_creacion']);


                if (isset($_FILES['ReportePDF']['tmp_name']) && $_FILES['ReportePDF']['tmp_name'] != '') {
                    $reporte = addslashes(file_get_contents($_FILES['ReportePDF']['tmp_name']));
                    
                    $this->reporte->setReportePDF ($reporte);
						echo json_encode($this->reporte->insertarreporte());
                        
                    }else{
                        echo 1;
                    }       
           }else{
           echo 0;
          }  
        } 
		
		public function actualizarreporte(){
            if (isset($_POST['Id_reporte_edit'])) {
                $Mes_de_creacion = $_POST['Mes_de_creacion_edit'];
               
                $ReportePDF = addslashes(file_get_contents($_FILES['ReportePDF_edit']['tmp_name']));

               

                $Id_reporte = $_POST['Id_reporte_edit'];
                

                $valores = " Mes_de_creacion = '$Mes_de_creacion', PDF = '$ReportePDF'";
                $condicion = "Id_reporte = '$Id_reporte'";
                $result = $this->model->actualizar('t_reporte',$valores,$condicion);
                if ($result) {
                    echo 1;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        

       public function eliminarreporte(){
           if (isset($_GET['dato'])) {
               $id = $_GET['dato'];
               $result = $this->model->eliminar('t_reporte',"Id_reporte = '$id'");
               echo $result;
           }
       }
		
	}
?>