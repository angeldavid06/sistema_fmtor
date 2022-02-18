<?php
    require_once "models/Model.php";

    class salidaModel extends Model
    {
        public $Salida;
        public $Id_Clientes_2;
        public $Fecha;
        public $Cantidad_millares;
        public $Codigo;
        public $Pedido_pza;
        public $Medida;
        public $Descripcion;
        public $Acabado;
        public $Precio_millar;
        public $Factura;
        public $Dibujo;
        public $Material;
        public $Id_Folio;
        public $Fecha_entrega;

        public function __construct()
        {
            parent::__construct();
        }

        public function setSalida($Salida): void
        {
            $this->Salida = $Salida;
        }
        
        public function setId_Clientes_2($Id_Clientes_2): void
        {
            $this->Id_Clientes_2 = $Id_Clientes_2;
        }
        
        public function setFecha($Fecha): void
        {
            $this->Fecha = $Fecha;
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

        public function setDibujo($Dibujo): void
        {
            $this->Dibujo = $Dibujo;
        }
        
        public function setMaterial($Material): void
        {
            $this->Material = $Material;
        }

        public function setId_Folio($Id_Folio): void
        {
            $this->Id_Folio = $Id_Folio;
        }
        
        public function setFecha_entrega($Fecha_entrega): void
        {
            $this->Fecha_entrega = $Fecha_entrega;
        }

        public function insertarSalida()
        {
            $tabla = 't_salida_almacen';
            $parametros = 'Id_Clientes_2,Fecha,Cantidad_millares,Codigo,Pedido_pza,Medida,Descripcion,Acabado,Precio_millar,Fecha_entrega';
            $values =   "'$this->Id_Clientes_2', '$this->Fecha', '$this->Cantidad_millares', '$this->Codigo', '$this->Pedido_pza','$this->Medida','$this->Descripcion', '$this->Acabado','$this->Precio_millar','$this->Fecha_entrega'";
            $validacion = Model::insertar($tabla, $parametros, $values);
            return $validacion;
        }

        public function actualizarSalida()
        {
            $tabla = 't_salida_almacen';
            $parametros = 'Salida,Id_Clientes_2, Fecha,Cantidad_millares,Codigo,Pedido_pza, Medida,Descripcion,Acabado,Precio_millar, Factura,Dibujo,Material,Id_Folio,Fecha_entrega';
            $values =   " '$this->Salida', '$this->Id_Clientes_2', '$this->Fecha', '$this->Cantidad_millares', '$this->Codigo', '$this->Pedido_pza','$this->Medida','$this->Descripcion', '$this->Acabado','$this->Precio_millar','$this->Factura', '$this->Dibujo', '$this->Material','$this->Id_Folio', '$this->Fecha_entrega'";
            $validacion = Model::actualizar($tabla, $parametros, $values);
            return $validacion;
        }
    }
?>