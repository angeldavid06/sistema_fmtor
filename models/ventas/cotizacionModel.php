<?php
require_once "models/Model.php";

class cotizacionModel extends Model
{
    public $Id_Cotizacion;
    public $Fecha;
    public $Descripcion;
    public $Medida;
    public $Acabado;
    public $Cantidad_millares;
    public $Precio_millar;
    public $Id_Clientes_1;
    public $Total;
    public $Importe;
    public $iva;
    public $total_neto;
    public $Notas;
    public $Empleado;



    public function __construct()
    {
        parent::__construct();
    }

    public function getId_Cotizacion()
    {
        return $this->getId_Cotizacion;
    }
    public function getFecha()
    {
        return $this->Fecha;
    }
    public function getDescripcion()
    {
        return $this->Descripcion;
    }
    public function getMedida()
    {
        return $this->Medida;
    }
    public function getAcabado()
    {
        return $this->Acabado;
    }
    public function getCantidad_millares()
    {
        return $this->Cantidad_millares;
    }

    public function getPrecio_millar()
    {
        return $this->Precio_millar;
    }
    
    public function getId_Clientes_1()
    {
        return $this->Id_Clientes_1;
    }
    public function getTotal()
    {
        return $this->Total;
    }
    public function getImporte()
    {
        return $this->Importe;
    }
    public function getiva()
    {
        return $this->iva;
    }
    public function gettotal_neto()
    {
        return $this->total_neto;
    }
    public function getNotas()
    {
        return $this->Notas;
    }
    public function getEmpleado()
    {
        return $this->Empleado;
    }


    public function setId_Cotizacion($Id_Cotizacion): void
    {
        $this->Id_Cotizacion = $Id_Cotizacion;
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
    public function setAcabado($Acabado): void
    {
        $this->Acabado = $Acabado;
    }

    public function setCantidad_millares($Cantidad_millares): void
    {
        $this->Cantidad_millares = $Cantidad_millares;
    }

    public function setPrecio_millar($Precio_millar): void
    {
        $this->Precio_millar = $Precio_millar;
    }
    public function setId_Clientes_1($Id_Clientes_1): void
    {
        $this->Id_Clientes_1 = $Id_Clientes_1;
    }
    public function setTotal($Total): void
    {
        $this->Total = $Total;
    }
    public function setImporte($Importe): void
    {
        $this->Importe = $Importe;
    }
    public function setiva($iva): void
    {
        $this->iva = $iva;
    }
    public function settotal_neto($total_neto): void
    {
        $this->total_neto = $total_neto;
    }
    public function setNotas($Notas): void
    {
        $this->Notas = $Notas;
    }
    public function setEmpleado($Empleado): void
    {
        $this->Empleado = $Empleado;
    }



    public function insertarCotizacion()
    {
        $tabla = 't_cotizacion';
        $parametros = 'Fecha,Descripcion,Medida,Acabado,Cantidad_millares,Precio_millar,Id_Clientes_1,Total,Importe,iva,total_neto,Notas,Empleado';
        $values = "'$this->Fecha','$this->Descripcion','$this->Medida','$this->Acabado','$this->Cantidad_millares','$this->Precio_millar','$this->Id_Clientes_1','$this->Total','$this->Importe','$this->iva','$this->total_neto','$this->Notas','$this->Empleado'";
        $validacion = Model::insertar($tabla, $parametros, $values);
        return $validacion;
    }
    public function actualizarCotizacion()
    {
        $tabla = 't_cotizacion';
        $parametros = 'Fecha,Descripcion,Medida,Acabado,Cantidad_millares,Precio_millar,Id_Clientes_1,Total,Importe,iva,total_neto,Notas,Empleado';
        $values = "'$this->Fecha','$this->Descripcion','$this->Medida','$this->Acabado','$this->Cantidad_millares','$this->Precio_millar','$this->Id_Clientes_1','$this->Total','$this->Importe','$this->iva','$this->total_neto','$this->Notas','$this->Empleado'";
         $validacion = Model::actualizar($tabla, $parametros, $values);
        return $validacion;
    }
}