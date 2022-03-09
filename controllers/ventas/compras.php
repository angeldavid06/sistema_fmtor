<?php 

    require_once 'models/Model.php';
    require_once 'models/ventas/compraModel.php';
    require_once 'routes/web.php';

    class Compras {
        public $model;
        public $model_compra;
        public $web;

        public function __construct() {
            $this->model = new Model();
            $this->model_compra = new compraModel();
            $this->web = new Web();
        }

        public function generar_pdf () {
            if (isset($_GET['empresa']) && $_GET['empresa'] == 1) {
                $this->model = new Model();
                $empresa = $this->model->buscar_personalizado('t_informacion_empresa','*', "Id_Empresa = '".$_GET['empresa']."'");
                $this->model = new Model();
                $orden = $this->model->buscar_personalizado('t_orden_compra','*', "Id_Compra  = '".$_GET['id']. "' AND FK_Empresa = '".$_GET['empresa']."'");
                $this->model = new Model();
                $pedidos = $this->model->buscar_personalizado('t_pedido_compra', '*', "FK_Orden_Compra  = '" . $_GET['id'] . "'");
                $this->model = new Model();
                $proveedor = $this->model->buscar_personalizado('t_proveedores', '*', "Id_Proveedor  = '" . $orden[0]['FK_Proveedor'] . "'");
                $data = [
                    'empresa' => $empresa,
                    'orden' => $orden,
                    'pedidos' => $pedidos,
                    'proveedor' => $proveedor
                ];

                $this->web->PDF('ventas/compra_fmtor',$data);
            } else if (isset($_GET['empresa']) && $_GET['empresa'] == 2) {
                $this->model = new Model();
                $empresa = $this->model->buscar_personalizado('t_informacion_empresa', '*', "Id_Empresa = '" . $_GET['empresa'] . "'");
                $this->model = new Model();
                $orden = $this->model->buscar_personalizado('t_orden_compra', '*', "Id_Compra  = '" . $_GET['id'] . "' AND FK_Empresa = '" . $_GET['empresa'] . "'");
                $this->model = new Model();
                $pedidos = $this->model->buscar_personalizado('t_pedido_compra', '*', "FK_Orden_Compra  = '" . $_GET['id'] . "'");
                $this->model = new Model();
                $proveedor = $this->model->buscar_personalizado('t_proveedores', '*', "Id_Proveedor  = '" . $orden[0]['FK_Proveedor'] . "'");
                $data = [
                    'empresa' => $empresa,
                    'orden' => $orden,
                    'pedidos' => $pedidos,
                    'proveedor' => $proveedor
                ];
                $this->web->PDF('ventas/compra_rdg',$data);
            }
        }

        public function obtener() {
            echo json_encode($this->model->mostrar('v_orden_compra'));
        }

        public function obtener_empresas() {
            echo json_encode($this->model->mostrar('v_empresa'));
        }

        public function obtener_proveedores () {
            echo json_encode($this->model->mostrar('v_proveedor'));
        }

        public function obtener_informacion_pedidos () {
            if (isset($_GET['id'])) {
                $pedidos = $this->model->buscar_personalizado('t_pedido_compra', '*', "FK_Orden_Compra  = '" . $_GET['id'] . "'");
                echo json_encode($pedidos);
            } else {
                echo 0;
            }
        }

        public function insertar () {
            if (isset($_POST['solicitado']) && $_POST['solicitado'] != '') {
                $this->model_compra->setFecha($_POST['Fecha']);
                $this->model_compra->setSolicitado($_POST['solicitado']);
                $this->model_compra->setTerminos($_POST['terminos']);
                $this->model_compra->setContacto($_POST['contacto']);
                $this->model_compra->setId_Empresa($_POST['empresas']);
                $this->model_compra->setId_Proveedor($_POST['proveedores']);

                $result = $this->model_compra->ingresar_orden();
                
                if ($result) {
                    for ($i=1; $i <= $_POST['Cantidad_Tornillos']; $i++) { 
                        $this->model_compra->setCodigo($_POST['codigo_'.$i]);
                        $this->model_compra->setProducto($_POST['producto_'.$i]);
                        $this->model_compra->setCantidad($_POST['cantidad_'.$i]);
                        $this->model_compra->setPrecio($_POST['precio_'.$i]);

                        $result = $this->model_compra->ingresar_pedido();
                    }
                    echo 1;
                } else {
                    echo 0;
                }
            } else {
                echo 0;
            }
        }
    }

?>