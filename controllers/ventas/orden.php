<?php
require_once "models/Model.php";
require_once "models/ventas/ordenModel.php";
require_once "routes/web.php";


class orden
{
    public $model;
    public $web;
    public $orden;

    public function __construct()
    {
        $this->orden = new ordenModel();
        $this->web = new Web();
        $this->model = new Model();
    }
    public function buscar(){
        $id_folio=$_GET['clave'];

            $result = $this->model->buscar('v_busqueda_orden','Id_Folio',$id_folio);
            echo json_encode($result);
        
    }
    
    public function pdforden()
    {
        $data = $this->model->buscar('t_salida_almacen', $_GET['atributo'], $_GET['value']);

        $this->web->PDF('ventas/orden', $data);
    }
    
    public function obtener()
    {
        $result = $this->model->buscar_personalizado(
            't_salida_almacen, t_clientes',
            'Id_Folio,Razon_social,Precio_millar,Fecha,Descripcion,Medida,Cantidad_millares,Acabado,Codigo,Tratamiento,Dibujo,Material,Fecha_entrega,Salida',
            't_salida_almacen.Id_Clientes_2 = t_clientes.Id_Clientes'
        );
        echo json_encode($result);
    }

    public function obtener_per()
    {
        $result = $this->model->buscar_personalizado('t_salida_almacen, t_clientes', 'Tratamiento, Id_Folio','Id_Folio =' . $_GET['aux'] . '');
        echo json_encode($result);
    }

   

    public function actualizarorden()
    {
        if (isset($_POST['id_folio_edit'])) {

            $Tratamiento  = $_POST['Tratamiento_edit'];
            $Id_Folio     = $_POST['id_folio_edit'];

            $valores = "Tratamiento='$Tratamiento'";

            $condicion = "Id_Folio = '$Id_Folio'";
            
            $result = $this->model->actualizar('t_salida_almacen', $valores, $condicion);
            if ($result) {
                echo 1;
            } else {
                echo 2;
            }
        } else {
            echo 0;
        }
    }

   
}