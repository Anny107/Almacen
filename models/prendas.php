<?php

require_once 'conexion.php';

class Prendas extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarTipoPrenda(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_tipoprenda_listar()");
      $consulta->execute();

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listarDescripcion($idtipoprenda = 0){
    try{
      $consulta = $this->conexion->prepare("CALL spu_prendas_filtrar(?)");
      $consulta->execute(array($idtipoprenda));
      return $consulta->fetchAll(PDO::FETCH_ASSOC); 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function filtrarTipo($idtipoprenda = 0){
    try{
      $consulta = $this->conexion->prepare("CALL spu_filtro_cate(?)");
      $consulta->execute(array($idtipoprenda));
      return $consulta->fetchAll(PDO::FETCH_ASSOC); 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}