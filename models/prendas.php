<?php

require_once 'Conexion.php';

class Prendas extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarPrenda(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_prendas_listar()");
      $consulta->execute();

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}