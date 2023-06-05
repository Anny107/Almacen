<?php
session_start();

$_SESSION["login"] = [];

require_once '../models/usuario.php';
if(isset($_POST['operacion'])){

  $usuario = new Usuario();

  
  if($_POST['operacion'] == 'iniciarSesion'){
    $acceso = [
      "status" => false,
      "idusuario" => "",
      "apellidos" => "",
      "nombres" => "",
      "mensaje" => ""
    ];
    $data = $usuario->iniciarSesion($_POST['email']);
    $claveIngresada = $_POST['clave'];

    if($data){
      if(password_verify($claveIngresada, $data['clave'])){
        $acceso["status"] = true;
        $acceso["idusuario"] = $data["idusuario"];
        $acceso["apellidos"] = $data["apellidos"];
        $acceso["nombres"] = $data["nombres"];
      }else{
        $acceso["mensaje"] = "Error en la contraseña";
        }
    }else{
      $acceso["mensaje"] = "No se encontro el usuario";
    }

    $_SESSION["login"] = $acceso;

    echo json_encode($acceso);
  }
}
if (isset($_GET['operacion']) == 'destroy'){
  session_destroy();
  session_unset();
  header("location:../index.php");
  
}
?>