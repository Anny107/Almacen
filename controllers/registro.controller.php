<?php

require_once '../models/registro.php';

if(isset($_POST['operacion'])){
  $registro = new Registro();

  if($_POST['operacion'] == 'registrarEntrada'){
    $datosGuardados =[
      "idprenda"      => $_POST['idprenda'],
      "cantidad"      => $_POST['cantidad'],
      "fechaIngreso"  => $_POST['fechaIngreso'],
      "observaciones" => $_POST['observaciones'],
    ];
      $respuesta = $registro->registrarEntrada($datosGuardados);
      echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'listarEntrada'){
    $data = $registro->listarEntrada();

    if($data){
      echo json_encode($data);
    }
  }
}
