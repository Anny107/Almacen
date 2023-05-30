<?php
// session_start();

// date_default_timezone_set('America/Lima');
require_once '../models/usuario.php';
if(isset($_POST['operacion'])){

  $usuario = new Usuario();

  if($_POST['operacion'] == 'destroy'){
    session_destroy();
    session_unset();
    header('Location: ../index.html');
  }
  if($_POST['operacion'] == 'iniciarSesion'){
    $acceso = [
      "login" => false,
      "apellidos" => "",
      "nombres" => "",
      "mensaje" => ""
    ];
    $data = $usuario->iniciarSesion($_POST['email']);
    $claveIngresada = $_POST['clave'];

    if($data){
      if(password_verify($claveIngresada, $data['clave'])){
        $acceso["login"] = true;
        $acceso["apellidos"] = $data["apellidos"];
        $acceso["nombres"] = $data["nombres"];
      }else{
        $acceso["mensaje"] = "Error en la contraseña";
        }
    }else{
      $acceso["mensaje"] = "No se encontro el usuario";
    }

    $_SESSION['seguridad'] = $acceso;
    echo json_encode($acceso);
  }
}