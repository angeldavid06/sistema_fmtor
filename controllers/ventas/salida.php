<?php
    require_once "models/Model.php";
    require_once "models/ventas/salidaModel.php";
    require_once "routes/web.php";

    class salida
    {
        public $model;
        public $web;
        public $salida;

        public function __construct()
        {
            $this->salida = new salidaModel();
            $this->web = new Web();
            $this->model = new Model();
        }

        public function buscar()
        {
            $id_folio = $_GET['clave'];

            $result = $this->model->buscar('v_busqueda_salida', 'Salida', $id_folio);
            echo json_encode($result);
        }
        
        public function generarpdf()
        {
            $data = $this->model->buscar('t_salida_almacen', $_GET['atributo'], $_GET['value']);

            $this->web->PDF('ventas/salida', $data);
        }

        public function obtener()
        {
            $salidas = $this->model->mostrar('v_salidas_almacen');
            $this->model = new Model();
            $ordenes = $this->model->mostrar('v_ordenes');
            $data = [
                'salidas' => $salidas,
                'ordenes' => $ordenes
            ];
            echo json_encode($data);
        }

        public function obtener_per()
        {
            $result = $this->model->buscar_personalizado('t_salida_almacen', '*', 'Id_Folio =' . $_GET['aux'] . '');
            echo json_encode($result);
        }

        public function obtener_clientes () {
            $result = $this->model->mostrar('v_clientes');
            echo json_encode($result);
        }

        public function NuevaSalida()
        {
            if (isset($_POST['Id_Clientes_2']) && $_POST['Id_Clientes_2'] != '') {
                $this->salida->setId_Clientes_2($_POST['Id_Clientes_2']);
                $this->salida->setFecha($_POST['Fecha']);
                $this->salida->setFecha_entrega($_POST['Fecha_entrega']);
                $this->salida->setCantidad_millares($_POST['Cantidad_millares']);
                $this->salida->setPedido_pza($_POST['Pedido_pza']);
                $this->salida->setPrecio_millar($_POST['Precio_millar']);
                $this->salida->setCodigo($_POST['Codigo']);
                $this->salida->setDescripcion($_POST['Descripcion']);
                $this->salida->setMedida($_POST['Medida']);
                $this->salida->setAcabado($_POST['Acabado']);
                
                echo json_encode($this->salida->insertarSalida());
            } else {
                echo 0;
            }
        }


        public function actualizarSalida()
        {
            if (isset($_POST['Id_Folio_edit'])) {
                $Salida = $_POST['Salida_edit'];
                $Id_Clientes_2 = $_POST['Id_Clientes_2_edit'];
                $Fecha = $_POST['Fecha_edit'];
                $Cantidad_millares = $_POST['Cantidad_millares_edit'];
                $Codigo = $_POST['Codigo_edit'];
                $Pedido_pza = $_POST['Pedido_pza_edit'];
                $Medida = $_POST['Medida_edit'];
                $Descripcion = $_POST['Descripcion_edit'];
                $Acabado = $_POST['Acabado_edit'];
                $Precio_millar = $_POST['Precio_millar_edit'];
                $Factura = $_POST['Factura_edit'];
                $Dibujo = $_POST['Dibujo_edit'];
                $Material = $_POST['Material_edit'];
                $Fecha_entrega = $_POST['Fecha_entrega_edit'];

                $Id_Folio = $_POST['Id_Folio_edit'];

                $valores = " Salida='$Salida',
                            Id_Clientes_2='$Id_Clientes_2', 
                            Fecha = '$Fecha', 
                            Cantidad_millares = '$Cantidad_millares',
                            Codigo='$Codigo',
                            Pedido_pza = '$Pedido_pza', 
                            Medida = '$Medida', 
                            Descripcion = '$Descripcion',
                            Acabado = '$Acabado',
                            Precio_millar = '$Precio_millar', 
                            Factura='$Factura',
                            Dibujo='$Dibujo',
                            Material='$Material',
                            Fecha_entrega='$Fecha_entrega' ";

                $condicion = "Id_Folio = '$Id_Folio'";
                $result = $this->model->actualizar('t_salida_almacen', $valores, $condicion);
                if ($result) {
                    echo $result;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        public function eliminarSalida()
        {
            if (isset($_GET['dato'])) {
                $id = $_GET['dato'];
                $result = $this->model->eliminar('t_salida_almacen', "Id_Folio = '$id'");
                echo $result;
            }
        }
    }
?>