<?php

require_once '../models/registro.php';

if(isset($_POST['operacion'])){
  $registro = new Registro();

  if($_POST['operacion'] == 'registrarMovimientos'){
    $datosGuardados =[
      "idtipoprenda"  => $_POST['idtipoprenda'],
      "idusuario"     => $_POST['idusuario'],
      "idprenda"      => $_POST['idprenda'],
      "tipo"          => $_POST['tipo'],
      "cantidad"      => $_POST['cantidad'],
      "observaciones" => $_POST['observaciones']
    ];
      $respuesta = $registro->registrarMovimientos($datosGuardados);
      echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'editarMov'){
    $datos =[
      "idmovimiento"  => $_POST['idmovimiento'],
      "idtipoprenda"  => $_POST['idtipoprenda'],
      "idprenda"      => $_POST['idprenda'],
      "tipo"          => $_POST['tipo'],
      "cantidad"      => $_POST['cantidad'],
      "observaciones" => $_POST['observaciones']
    ];
      $respuesta = $registro->editarMov($datos);
      echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'listarMovimientos'){
    $data = $registro->listarMovimientos();

    if($data){
      echo json_encode($data);
    }
  }

  if($_POST['operacion'] == 'filtroFecha'){
    $data = $registro->filtroFecha($_POST['fecha']);

    if($data){
      echo json_encode($data);
    }
  }
}
