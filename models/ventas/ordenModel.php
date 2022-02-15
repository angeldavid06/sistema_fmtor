<?php
    require_once "models/Model.php";

    class ordenModel extends Model
    {
        public $Id_Folio;
        public $Id_Clientes_2;
        public $Precio_millar;
        public $Fecha;
        public $Descripcion;
        public $Medida;
        public $Cantidad_millares;
        public $Acabado;
        public $Codigo;
        public $Tratamiento;
        public $Dibujo;
        public $Material;
        public $Fecha_Entrega;
        public $Salida;

        public function __construct()
        {
            parent::__construct();
        }

        public function setId_Folio($Id_Folio): void
        {
            $this->Id_Folio = $Id_Folio;
        }

        public function setId_Clientes_2($Id_Clientes_2): void
        {
            $this->Id_Clientes_2 = $Id_Clientes_2;
        }

        public function setPrecio_millar($Precio_millar): void
        {
            $this->Precio_millar = $Precio_millar;
        }

        public function setFecha($Fecha): void
        {
            $this->Fecha = $Fecha;
        }

        public function setDescripcion($Descripcion): void
        {
            $this->Descripcion = $Descripcion;
        }

        public function setMedida($Medida): void
        {
            $this->Medida = $Medida;
        }

        public function setCantidad_millares($Cantidad_millares): void
        {
            $this->Cantidad_millares = $Cantidad_millares;
        }

        public function setAcabado($Acabado): void
        {
            $this->Acabado = $Acabado;
        }

        public function setCodigo($Codigo): void
        {
            $this->Codigo = $Codigo;
        }

        public function setTratamiento($Tratamiento): void
        {
            $this->Tratamiento = $Tratamiento;
        }

        public function setDibujo($Dibujo): void
        {
            $this->Dibujo = $Dibujo;
        }

        public function setMaterial($Material): void
        {
            $this->Material = $Material;
        }

        public function setFecha_Entrega($Fecha_Entrega): void
        {
            $this->Fecha_Entrega = $Fecha_Entrega;
        }

        public function setSalida($Salida): void
        {
            $this->Salida = $Salida;
        }

        public function actualizarorden()
        {
            $tabla = 't_salida_almacen';
            $parametros = 'Tratamiento';
            $values =   "'$this->Tratamiento'";
            $validacion = Model::actualizar($tabla, $parametros, $values);
            return $validacion;
        }
    }
