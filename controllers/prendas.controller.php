<?php

require_once '../models/prendas.php';

if(isset($_POST['operacion'])){
  $prenda = new Prendas();

  if($_POST['operacion'] == 'listarPrenda'){
    $dato = $prenda -> listarPrenda();

    if($dato){
      echo json_encode($dato);
    }
  }
}