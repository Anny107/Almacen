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
}