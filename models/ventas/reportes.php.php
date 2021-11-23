<?php
  require_once "Model.php";
    
     class clientes extends Model{
      
            public function get_clientes(){
                $conexion= parent::conexion();
                parent::set_names();
                $sql="SELECT * FROM t_clientes;";
                $sql=$conexion->prepare($sql);
                $sql->execute();
                return $resultado=$sql->fetchAll();
            }
    
            public function insert_clientes($id_clientes,$nombre){
                $conexion= parent::conexion();
                parent::set_names();
                $sql="INSERT INTO tm_menu VALUES(?,?)";
                $sql=$conexion->prepare($sql);
                $sql->bindValue(1, $id_clientes);
                $sql->bindValue(2, $nombre);
                
                $sql->execute();
            }
    
            public function update_clientes($id_clientes,$nombre){
                $conexion= parent::conexion();
                parent::set_names();
                $sql="UPDATE t_clientes SET
                id_clientes=?,
                nombre=?;
                $sql=$conexion->prepare($sql);
                $sql->bindValue(1, $id_clientes);
                $sql->bindValue(2, $nombre);
               
                $sql->execute();
            }
    
            public function delete_clientes($id_clientes){
                $conexion= parent::conexion();
                parent::set_names();
                $sql="UPDATE tm_menu SET est=0 WHERE id_clientes=?";
                $sql=$conexion->prepare($sql);
                $sql->bindValue(1, $id_clientes);
                $sql->execute();
            }
    
            public function get_clientes_x_id($id_clientes){
                $conexion= parent::conexion();
                parent::set_names();
                $sql="SELECT * FROM t_clientes WHERE id_clientes=?";
                $sql=$conexion->prepare($sql);
                $sql->bindValue(1, $id_clientes);
                $sql->execute();
                return $resultado=$sql->fetchAll();
            }
    
        }
    ?>
        