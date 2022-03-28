<?php
    require_once "models/Model.php";

    class pedidoModel extends Model
    {
        public $id_pedido;
        public $Descripcion;
        public $Medida;
        public $Acabado;
        public $Factor;
        public $Material;
        public $Cantidad_millares;
        public $Pedido_pza;
        public $Fecha_entrega;
        public $Precio_millar;
        public $Codigo;
        public $No_Pedido;

        public function __construct()
        {
            parent::__construct();
        }
        
        public function setCantidad_millares($Cantidad_millares): void
        {
            $this->Cantidad_millares = $Cantidad_millares;
        }
        
        public function setCodigo($Codigo): void
        {
            $this->Codigo = $Codigo;
        }
        
        public function setPedido_pza($Pedido_pza): void
        {
            $this->Pedido_pza = $Pedido_pza;
        }
        
        public function setMedida($Medida): void
        {
            $this->Medida = $Medida;
        }
        
        public function setDescripcion($Descripcion): void
        {
            $this->Descripcion = $Descripcion;
        }
        
        public function setAcabado($Acabado): void
        {
            $this->Acabado = $Acabado;
        }
        
        public function setPrecio_millar($Precio_millar): void
        {
            $this->Precio_millar = $Precio_millar;
        }
        
        public function setFactura($Factura): void
        {
            $this->Factura = $Factura;
        }
        
        public function setMaterial($Material): void
        {
            $this->Material = $Material;
        }
        
        public function setFecha_entrega($Fecha_entrega): void
        {
            $this->Fecha_entrega = $Fecha_entrega;
        }

        public function setFactor($Factor): void
        {
            $this->Factor = $Factor;
        }
        public function setNo_Pedido ($No_Pedido) {
            $this->No_Pedido = $No_Pedido;
        }

        public function insertarSalida() {
        }
        
        public function insertarPedido () {
            $obj = new Model();
            $id_pedido = $obj->buscar_personalizado('t_cotizacion', 'id_cotizacion', '1 ORDER BY id_cotizacion DESC LIMIT 1');

            $obj_2 = new Model();
            $tabla = 't_pedido';
            $parametros = 'Descripcion,Medida,Acabado,Factor,Material,Cantidad_millares,Pedido_pza,Fecha_entrega,Precio_Millar,Codigo,Id_Cotizacion_FK';
            $values =   "
                '$this->Descripcion',
                '$this->Medida',
                '$this->Acabado',
                '$this->Factor',
                '$this->Material',
                '$this->Cantidad_millares', 
                '$this->Pedido_pza',
                '$this->Fecha_entrega',
                '$this->Precio_millar',
                '$this->Codigo','".
                $id_pedido[0]['id_cotizacion']."'";
            $validacion = $obj_2->insertar($tabla, $parametros, $values);
            return $validacion;    
        }

        public function insertarOrden () {
        }

        public function cancelarOrden () {
        }

        public function actualizarSalida() {
        }

        public function actualizarOrden () {
        }

        public function actualizarSoloSalida () {
        }
    }
?>