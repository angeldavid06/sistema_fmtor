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
    public function buscar(){
        $id_folio=$_GET['clave'];

            $result = $this->model->buscar('v_busqueda_salida','Salida',$id_folio);
            echo json_encode($result);
        
    }
    public function generarpdf()
    {
        $data = $this->model->buscar('t_salida_almacen', $_GET['atributo'], $_GET['value']);

        $this->web->PDF('ventas/salida', $data);
    }
    
    public function obtener()
    {
        $result = $this->model->buscar_personalizado(
            't_salida_almacen, t_clientes',
            'Salida,Razon_social,Fecha,Cantidad_millares,Codigo,Pedido_pza,Medida,Descripcion,Acabado,Precio_millar,Factura,Dibujo,Material,Id_Folio,Fecha_entrega',
            't_salida_almacen.Id_Clientes_2 = t_clientes.Id_Clientes'
        );
        echo json_encode($result);
    }

    public function obtener_per()
    {
        $result = $this->model->buscar_personalizado('t_salida_almacen', '*', 'Id_Folio =' . $_GET['aux'] . '');
        echo json_encode($result);
    }

    public function NuevaSalida()
    {
        if (isset($_POST['Salida']) && $_POST['Salida'] != '') {
            $this->salida->setSalida($_POST['Salida']);
            
        if (isset($_POST['Id_Clientes_2']) && $_POST['Id_Clientes_2'] != '') {
                $this->salida->setId_Clientes_2($_POST['Id_Clientes_2']);
        
                if (isset($_POST['Fecha']) && $_POST['Fecha'] != '') {
                    $this->salida->setFecha($_POST['Fecha']);
               
                    if (isset($_POST['Cantidad_millares']) && $_POST['Cantidad_millares'] != '') {
                           $this->salida->setCantidad_millares($_POST['Cantidad_millares']);

                    if (isset($_POST['Codigo']) && $_POST['Codigo'] != '') {
                        $this->salida->setCodigo($_POST['Codigo']);
                        
                    if (isset($_POST['Pedido_pza']) && $_POST['Pedido_pza'] != '') {
                        $this->salida->setPedido_pza($_POST['Pedido_pza']);

                        if (isset($_POST['Medida']) && $_POST['Medida'] != '') {
                            $this->salida->setMedida($_POST['Medida']);

                            if (isset($_POST['Descripcion']) && $_POST['Descripcion'] != '') {
                                $this->salida->setDescripcion($_POST['Descripcion']);

                                if (isset($_POST['Acabado']) && $_POST['Acabado'] != '') {
                                    $this->salida->setAcabado($_POST['Acabado']);

                                    if (isset($_POST['Precio_millar']) && $_POST['Precio_millar'] != '') {
                                        $this->salida->setPrecio_millar($_POST['Precio_millar']);
                                        
                                          if (isset($_POST['Factura']) && $_POST['Factura'] != '') {
                                        $this->salida->setFactura($_POST['Factura']);
                                      
                                        if (isset($_POST['Dibujo']) && $_POST['Dibujo'] != '') {
                                            $this->salida->setDibujo($_POST['Dibujo']);

                                            if (isset($_POST['Material']) && $_POST['Material'] != '') {
                                                $this->salida->setMaterial($_POST['Material']);
                                            
                                                if (isset($_POST['Id_Folio']) && $_POST['Id_Folio'] != '') {
                                                    $this->salida->setId_Folio($_POST['Id_Folio']);

                                                    if (isset($_POST['Fecha_entrega']) && $_POST['Fecha_entrega'] != '') {
                                                        $this->salida->setFecha_entrega($_POST['Fecha_entrega']);
     
                                                                                echo json_encode($this->salida->insertarSalida());
                                                                          
                                                                            } else {
                                                                                echo 14;
                                                                            }
                                                            } else {
                                                                echo 13;
                                                            }
                                                        } else {
                                                            echo 12;
                                                        }
                                                    } else {
                                                        echo 11;
                                                    }
                                                } else {
                                                    echo 10;
                                                }
                                            } else {
                                                echo 9;
                                            }
                                        } else {
                                            echo 8;
                                        }
                                    } else {
                                        echo 7;
                                    }
                                } else {
                                    echo 6;
                                }
                            } else {
                                echo 5;
                            }
                        } else {
                            echo 4;
                        }
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


    public function actualizarSalida()
    {
        if (isset($_POST['Id_Folio_edit'])) {

            $Salida            = $_POST['Salida_edit'];
            $Id_Clientes_2     = $_POST['Id_Clientes_2_edit'];
            $Fecha             = $_POST['Fecha_edit'];
            $Cantidad_millares = $_POST['Cantidad_millares_edit'];
            $Codigo            = $_POST['Codigo_edit'];
            $Pedido_pza        = $_POST['Pedido_pza_edit'];
            $Medida            = $_POST['Medida_edit'];
            $Descripcion       = $_POST['Descripcion_edit'];
            $Acabado           = $_POST['Acabado_edit'];
            $Precio_millar     = $_POST['Precio_millar_edit'];
            $Factura           = $_POST['Factura_edit'];
            $Dibujo            = $_POST['Dibujo_edit'];
            $Material          = $_POST['Material_edit'];
            $Fecha_entrega     = $_POST['Fecha_entrega_edit'];
           

            $Id_Folio          = $_POST['Id_Folio_edit'];

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
