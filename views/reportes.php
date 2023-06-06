<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['status']){
    header("Location:../");
}

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Almacen Jony's</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#E4C4E8;">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Almacen Jony's</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav" style="text-align: right;">
              <li class="nav-item">
                <a class="nav-link active" href="graficos.php">Graficos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="movimientos.php">Entrada y Salida</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="reportes.php">Reportes</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="../controllers/usuario.controller.php?operacion=destroy">Cerrar sesion</a>
              </li>
              <ul style="text-align: end;">
                <li class="nav-item">
                  <label class="nav-link" for="">Bienvenido <?=$_SESSION['login']['nombres'] ?></label>
                </li>
              </ul>
              
            </ul>
          </div>
        </div>
      </nav>
      
      <h1 style="text-align: center;" class="mt-3">Reportes</h1>
        <div class="row mt-2">
            <div class="col-md-1"></div>
            <div class="col-md-1">
              <label for="cate" class="form-label">Categoria:</label>
            </div>
            <div class="col-md">
              <select name="cate" id="cate" class="form-select" autofocus>
                <option value="">Seleccione</option>
              </select>
            </div>
            <div class="col-md">
              <button type="button" class="btn" id="reporte1" style="background-color: #E4C4E8;">Reporte</button>
            </div>
            <div class="col-md-1">
              <label for="fecha" class="form-label">Fecha:</label>
            </div>
            <div class="col-md">
              <input type="date" class="form-control" id="fecha">
            </div>
            <div class="col-md">
              <button type="button" class="btn" id="reporte2" style="background-color: #E4C4E8;">Reporte</button>
            </div>
        </div>
            
      
      <div class="container">
        <!-- Modal trigger button -->
        <div class="row mt-1">
          <div class="col-md-4">
            </div>
            <div class="col-md-12 mt-3">
              <table class="table table-sm table-striped" id="tabla-entrada">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Tipo prenda</th>
                    <th>Descripcion</th>
                    <th>Movimientos</th>
                    <th>Cantidad</th>
                    <th>Observaciones</th>
                    <th>Fecha</th>
                    <th>Usuario</th>
                  </tr>
                </thead>
                <tbody>
  
                </tbody>
              </table>
            </div>
        </div>
      </div>
    </div>         
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const fecha = document.querySelector("#fecha");
    const tabla = document.querySelector("#tabla-entrada");
    const cuerpoTabla = document.querySelector("tbody");
    const cate = document.querySelector("#cate");
    const btreporte = document.querySelector("#reporte1");
    const btreporte2 = document.querySelector("#reporte2");

    function listaCate(){
    const parametros = new URLSearchParams();
    parametros.append("operacion","listarTipoPrenda");
    fetch('../controllers/prendas.controller.php',{
      method: 'POST',
      body: parametros
    })
    .then(response => response.json())
    .then(lista => {
      lista.forEach(element => {
      const optionTag = document.createElement("option"); 
      optionTag.value = element.idtipoprenda;
      optionTag.text= element.tipoprenda;
      cate.appendChild(optionTag);
        })
      }) 
    }

    function filtrarCategoria(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "filtrarTipo");
      parametros.append("idtipoprenda", parseInt(cate.value));

      fetch("../controllers/prendas.controller.php", {
        method: "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        cuerpoTabla.innerHTML = ``;
        datos.forEach(element => {
          const fila = 
        `
        <tr>
          <td>${element.idmovimiento}</td>
          <td>${element.tipoprenda}</td>
          <td>${element.descripcion}</td>
          <td>${element.tipo}</td>
          <td>${element.cantidad}</td>
          <td>${element.observaciones}</td>
          <td>${element.fecha}</td>
          <td>${element.nombres}</td>
        </tr>
        `;
        cuerpoTabla.innerHTML += fila;
        })
      })
    }

    function filtrarfecha(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "filtroFecha");
      parametros.append("fecha", fecha.value);

      fetch("../controllers/registro.controller.php", {
        method: "POST",
        body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        cuerpoTabla.innerHTML = ``;
        datos.forEach(element => {
          const fila = 
          `
          <tr>
          <td>${element.idmovimiento}</td>
          <td>${element.tipoprenda}</td>
          <td>${element.descripcion}</td>
          <td>${element.tipo}</td>
          <td>${element.cantidad}</td>
          <td>${element.observaciones}</td>
          <td>${element.fecha}</td>
          <td>${element.nombres}</td>
        </tr>
          `;
          cuerpoTabla.innerHTML += fila;
        })
      })
      .catch(error => {
        cuerpoTabla.innerHTML = ``;
        alert('No hay datos');
      })
    }

    function listaMovimientos(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "listarMovimientos");

      fetch("../controllers/registro.controller.php", {
      method: "POST",
      body: parametros
      })
      .then(response => response.json())
      .then(datos => {
        cuerpoTabla.innerHTML = ``;
        datos.forEach(element => {
        const fila = 
        `
        <tr>
          <td>${element.idmovimiento}</td>
          <td>${element.tipoprenda}</td>
          <td>${element.descripcion}</td>
          <td>${element.tipo}</td>
          <td>${element.cantidad}</td>
          <td>${element.observaciones}</td>
          <td>${element.fecha}</td>
          
        </tr>
        `;
        cuerpoTabla.innerHTML +=fila;
        })
      })
    }
    function generarPDF1(){
      const parametros = new URLSearchParams();
      parametros.append("idtipoprenda", parseInt(cate.value));
      parametros.append("titulo", cate.options[cate.selectedIndex].text);
      window.open(`../reports/almacen.report.php?${parametros}`, '_blank');
    }

    function generarPDF2(){
      const parametros = new URLSearchParams();
      parametros.append("fecha", fecha.value.toString());
      parametros.append("titulo", fecha.value.toString());
      window.open(`../reports/almacen.report2.php?${parametros}`, '_blank');
    }

    listaCate();
    fecha.addEventListener("change", filtrarfecha)
    cate.addEventListener("change", filtrarCategoria);
    btreporte.addEventListener("click", generarPDF1);
    btreporte2.addEventListener("click", generarPDF2)
  })
</script>
</body>
</html>