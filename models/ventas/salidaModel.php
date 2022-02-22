<?php
    require_once "models/Model.php";

    class salidaModel extends Model
    {
        public $Salida;
        public $Id_Clientes_2;
        public $Fecha;
        public $Cantidad_millares;
        public $Cantidad_producir;
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
        public $Factor;
        public $Tratamiento;
        public $No_Pedido;

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

        public function setCantidad_producir($Cantidad_producir): void
        {
            $this->Cantidad_producir = $Cantidad_producir;
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

        public function setFactor($Factor): void
        {
            $this->Factor = $Factor;
        }

        public function setTratamiento($Tratamiento): void
        {
            $this->Tratamiento = $Tratamiento;
        }

        public function setNo_Pedido ($No_Pedido) {
            $this->No_Pedido = $No_Pedido;
        }

        public function insertarSalida()
        {
            $tabla = 't_salida_almacen';
            $parametros = 'Id_Clientes_FK,Fecha';
            $values =   "'$this->Id_Clientes_2', '$this->Fecha'";
            $validacion = Model::insertar($tabla, $parametros, $values);
            return $validacion;
        }
        
        public function insertarPedido () {
            $obj = new Model();
            $id_pedido = $obj->buscar_personalizado('t_salida_almacen', 'Id_Folio', '1 ORDER BY Id_Folio DESC LIMIT 1');

            $obj_2 = new Model();
            $tabla = 't_pedido';
            $parametros = 'Descripcion,Medida,Acabado,Factor,Material,Tratamiento,Cantidad_millares,Pedido_pza,Fecha_entrega,Precio_Millar,Codigo,Id_Salida_FK';
            $values =   "
                '$this->Descripcion',
                '$this->Medida',
                '$this->Acabado',
                '$this->Factor',
                '$this->Material',
                '$this->Tratamiento',
                '$this->Cantidad_millares', 
                '$this->Pedido_pza',
                '$this->Fecha_entrega',
                '$this->Precio_millar',
                '$this->Codigo','".
                $id_pedido[0]['Id_Folio']."'";
            $validacion = $obj_2->insertar($tabla, $parametros, $values);
            return $validacion;    
        }

        public function insertarOrden () {
            $obj = new Model();
            $id_pedido = $obj->buscar_personalizado('t_pedido','Id_Pedido','1 ORDER BY Id_Pedido DESC LIMIT 1');

            $obj2 = new Model();
            $tabla = 't_orden_produccion';
            $parametros = 'Id_Catalogo_FK,cantidad,Id_Pedidop_FK';
            $values = "'$this->Dibujo','$this->Cantidad_producir','".$id_pedido[0]['Id_Pedido']."'";
            $result = $obj2->insertar($tabla, $parametros, $values);
            return $result;
        }

        public function actualizarSalida()
        {
            $tabla = 't_salida_almacen';
            $values = "Id_Clientes_2 = '$this->Id_Clientes_2', 
                        Fecha = '$this->Fecha',
                        Cantidad_millares = '$this->Cantidad_millares', 
                        Codigo= '$this->Codigo', 
                        Pedido_pza= '$this->Pedido_pza',
                        Medida = '$this->Medida',
                        Descripcion = '$this->Descripcion', 
                        Acabado = '$this->Acabado',
                        Precio_millar = '$this->Precio_millar',
                        Factura = '$this->Factura', 
                        Fecha_entrega = '$this->Fecha_entrega'";
            $condicion = "Id_Folio = '$this->Salida'";
            $validacion = Model::actualizar($tabla, $values, $condicion);
            return $validacion;
        }
    }
?>