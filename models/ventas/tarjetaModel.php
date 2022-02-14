<?php
require_once "models/Model.php";

class tarjetaModel extends Model
{
    public $Id_Folio;
    public $Codigo;
    public $Tratamiento;
    public $Bote;
    public $Descripcion;
    public $Medida;
    public $Acabado;
    public $Dibujo;
    public $Id_Clientes_2;
    public $Salida;
    public $Fecha;
    public $Material;
    

    public function __construct()
    {
        parent::__construct();
    }

    public function getId_Folio()
    {
        return $this->Id_Folio;
    }
    public function getCodigo()
    {
        return $this->Codigo;
    }
    public function getTratamiento()
    {
        return $this->Tratamiento;
    }
    public function getBote()
    {
        return $this->Bote;
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
    public function getDibujo()
    {
        return $this->Dibujo;
    }
    public function getId_Clientes_2()
    {
        return $this->Id_Clientes_2;
    }
    public function getSalida()
    {
        return $this->Salida;
    }
    public function getFecha()
    {
        return $this->Fecha;
    }
    public function getMaterial()
    {
        return $this->Material;
    }
    


    public function setId_Folio($Id_Folio): void
    {
        $this->Id_Folio = $Id_Folio;
    }
    public function setCodigo($Codigo): void
    {
        $this->Codigo = $Codigo;
    }
    public function setTratamiento($Tratamiento): void
    {
        $this->Tratamiento = $Tratamiento;
    }
    public function setBote($Bote): void
    {
        $this->Bote = $Bote;
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
    public function setDibujo($Dibujo): void
    {
        $this->Dibujo = $Dibujo;
    }
    public function setId_Clientes_2($Id_Clientes_2): void
    {
        $this->Id_Clientes_2 = $Id_Clientes_2;
    }
    public function setSalida($Salida): void
    {
        $this->Salida = $Salida;
    }
    public function setFecha($Fecha): void
    {
        $this->Fecha = $Fecha;
    }
    public function setMaterial($Material): void
    {
        $this->Material = $Material;
    }

    public function actualizarTarjeta()
    {
        $tabla = 't_salida_almacen';
        $parametros = 'Bote';
        $values =   "'$this->Bote'";  
        $validacion = Model::actualizar($tabla, $parametros, $values);
        return $validacion;
    }

   
}
