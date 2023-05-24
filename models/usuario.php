<?php
require_once 'conexion.php';

class Usuario extends Conexion {

  private $acceso;

  public function __CONSTRUCT(){
    $this->acceso = parent::getConexion();
  }

  public function iniciarSesion($usuario = ""){
    try{
      $consulta = $this->acceso->prepare("CALL spu_usuarios_login(?)");
      $consulta->execute(array($usuario));

      return $consulta->fetch(PDO::FETCH_ASSOC);
    }catch(Exception $e){
       die($e->getMessage());
    }
  }
}