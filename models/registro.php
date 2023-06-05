<?php

require_once 'Conexion.php';

class Registro extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function registrarMovimientos($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_movimientos_registrar(?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idtipoprenda"],
          $datos["idusuario"],
          $datos["idprenda"],
          $datos["tipo"],
          $datos["cantidad"],
          $datos["observaciones"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guardar. Codigo". $e->getCode();
    }
    return $respuesta;
  }

  public function listarMovimientos(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_listar_movimientos()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function editarMov($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_movimientos_editar(?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idmovimiento"],
          $datos["idtipoprenda"],
          $datos["idprenda"],
          $datos["tipo"],
          $datos["cantidad"],
          $datos["observaciones"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo editar. Codigo". $e->getCode();
    }
    return $respuesta;
  }

  public function filtroFecha($fecha){
    try{
      $consulta = $this->conexion->prepare("CALL spu_movimiento_fecha(?)");
      $consulta->execute(array($fecha));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}