<?php

require_once '../models/prendas.php';

if(isset($_POST['operacion'])){
  $prenda = new Prendas();

  if($_POST['operacion'] == 'listarTipoPrenda'){
    $dato = $prenda -> listarTipoPrenda();

    if($dato){
      echo json_encode($dato);
    }
  }

  if($_POST['operacion'] == 'listarDescripcion'){
    $datos = $prenda -> listarDescripcion($_POST['idtipoprenda']);

    if($datos) {
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'filtrarTipo'){
    $datos = $prenda -> filtrarTipo($_POST['idtipoprenda']);

    if($datos) {
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'filtrarDes'){
    $datos = $prenda -> filtrarDes($_POST['idtipoprenda'], $_POST['idprenda']);

    if($datos) {
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'grafico1'){
    $datos = $prenda -> grafico1();

    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'grafico2'){
    $datos = $prenda -> grafico2();

    if($datos){
      echo json_encode($datos);
    }
  }
}