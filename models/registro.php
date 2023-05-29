<?php

require_once 'Conexion.php';

class Registro extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function registrarEntrada($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_entrada_registrar(?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idprenda"],
          $datos["cantidad"],
          $datos["fechaIngreso"],
          $datos["observaciones"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guardar. Codigo". $e->getCode();
    }
    return $respuesta;
  }

  public function listarEntrada(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_listar_entrada()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}