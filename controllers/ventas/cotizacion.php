<?php
    require_once "models/Model.php";
    require_once "routes/web.php";
    require_once "models/ventas/cotizacionModel.php";
    require_once "models/ventas/pedidoModel.php";

    class cotizacion {
        public $model;
        public $web;
        public $cotizacion;
        public $pedido;

        public function __construct () {
            $this->model = new Model();
            $this->web = new Web();
            $this->cotizacion = new cotizacionModel();
            $this->pedido = new pedidoModel();
        }

        public function obtener_cotizaciones () {
            $result = $this->model->mostrar('v_cotizacion');
            echo json_encode($result);
        }

        public function obtener_cotizacion () {
            if (isset($_GET['id'])) {
                $result = $this->model->buscar_personalizado('t_cotizacion','*',"id_cotizacion = '".$_GET['id']."'");
                echo json_encode($result);
            } else {
                echo 0;
            }
        }
        
        public function obtener_pedido () {
            if (isset($_GET['id'])) {
                $result = $this->model->buscar_personalizado('t_pedido','*',"Id_Pedido = '".$_GET['id']."'");
                echo json_encode($result);
            } else {
                echo 0;
            }
        }

        public function historial () {
            $cotizacion = $this->model->buscar('v_cotizaciones', 'id_cotizacion', $_GET['id']);

            echo json_encode($cotizacion);
        }
        

        public function insertar () {
            $aux = 1;
            if (isset($_POST['Fecha']) && $_POST['Fecha'] != '' && isset($_POST['Id_Clientes_2']) && $_POST['Id_Clientes_2'] != '') {
                $this->cotizacion->setFecha($_POST['Fecha']);
                $this->cotizacion->setId_Clientes_1($_POST['Id_Clientes_2']);
                $result = $this->cotizacion->insertar_cotizacion();

                if ($result) {
                    for ($i=1; $i <= $_POST['Cantidad_Tornillos']; $i++) { 
                        $this->pedido->setDescripcion($_POST['Descripcion_'.$i]);
                        $this->pedido->setMedida($_POST['Medida_'.$i]);
                        $this->pedido->setAcabado($_POST['Acabado_'.$i]);
                        $this->pedido->setFactor($_POST['factor_'.$i]);
                        $this->pedido->setMaterial($_POST['Material_'.$i]);
                        $this->pedido->setCantidad_millares($_POST['Cantidad_millares_'.$i]);
                        $this->pedido->setPedido_pza($_POST['Pedido_pza_'.$i]);
                        $this->pedido->setFecha_entrega($_POST['Fecha_entrega_'.$i]);
                        $this->pedido->setPrecio_millar($_POST['Precio_millar_'.$i]);
                        $this->pedido->setCodigo($_POST['Codigo_'.$i]);
                        
                        $result_2 = $this->pedido->insertarPedido();
                        if (!$result_2) {
                            $aux = 2;
                        }
                    }
                    echo $aux;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        public function actualizar_solo_cotizacion () {
            if (isset($_POST['Cotizacion_e']) && $_POST['Cotizacion_e'] != '') {
                $this->cotizacion->setId_Cotizacion($_POST['Cotizacion_e']);
                $this->cotizacion->setFecha($_POST['Fecha_e']);
                $this->cotizacion->setId_Clientes_1($_POST['Id_Clientes_2_e']);

                $result = $this->cotizacion->solo_cotizacion();

                if ($result) {
                    echo 1;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        public function actualizar_pedido () {
            if (isset($_POST['Pedido_p'])) {
                $this->pedido->setId_Pedido($_POST['Pedido_p']);
                $this->pedido->setDescripcion($_POST['Descripcion_p']);
                $this->pedido->setMedida($_POST['Medida_p']);
                $this->pedido->setAcabado($_POST['Acabado_p']);
                $this->pedido->setFactor($_POST['factor_p']);
                $this->pedido->setMaterial($_POST['Material_p']);
                $this->pedido->setCantidad_millares($_POST['Cantidad_millares_p']);
                $this->pedido->setPedido_pza($_POST['Pedido_pza_p']);
                $this->pedido->setFecha_entrega($_POST['Fecha_entrega_p']);
                $this->pedido->setPrecio_millar($_POST['Precio_millar_p']);
                $this->pedido->setCodigo($_POST['Codigo_p']);

                $result = $this->pedido->actualizarPedido();

                if ($result) {
                    echo 1;
                } else {
                    echo 0;
                }
            } else {
                echo 0;
            }
        }

        public function eliminar_pedido () {
            if (isset($_GET['id']) && $_GET['id'] != '') {
                $result = $this->model->eliminar('t_pedido',"Id_Pedido = '". $_GET['id']."'");
                if ($result)  {
                    echo 1;
                } else {
                    echo 2;
                }
            } else {
                echo 0;
            }
        }

        public function generarpdf () {
            $data = $this->model->buscar('v_cotizacion', 'id_folio', $_GET['id']);
            $this->web->PDF('ventas/cotizacion', $data);
        }
    }
