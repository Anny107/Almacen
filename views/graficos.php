<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['status']){
    header("Location:../");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Almacen Jony's</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light" style="background-color:rgb(229, 240, 127);">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Almacen Jony's</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
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
  <div class="row mt-3">
      <div class="col-md-6">
        <!--grafico 1-->
        <canvas id="grafico1">

        </canvas>
      </div>
      <div class="col-md-6">
        <!--grafico 2-->
          <canvas id="grafico2">

          </canvas>
      </div>
    </div>
  </div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const grafico1 = document.querySelector("#grafico1");
    const grafico2 = document.querySelector("#grafico2");

    const graficoBarras = new Chart(grafico1, {
        type: 'line',
        data: {
          labels:[],
          datasets: [
            {        
              label: 'Entradas',
              data: [],
              backgroundColor: ['#2FAABB', '#347E9E','#49B080','#D29F59','#D9B954','#6C5BDD','#DD5B88']
            }
          ]
        }
      })

      const graficoBarras2= new Chart(grafico2, {
        type: 'bar',
        data: {
          labels:[],
          datasets: [
            {        
              label: 'Salida',
              data: [],
              backgroundColor: ['#2FAABB', '#347E9E','#49B080','#D29F59','#D9B954','#6C5BDD','#DD5B88']
            }
          ]
        }
      })

      function datosBarras() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "grafico1")
        fetch("../controllers/prendas.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          graphic(datos);
        });
      }

      function datosBarras2() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "grafico2")
        fetch("../controllers/prendas.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          graphic2(datos);
        });
      }

      function graphic(coleccion = []){
        let etiquetas = []; // Eje x
        let datos = []; // Eje Y

        coleccion.forEach(element => {
          etiquetas.push(element.tipoprenda + ' '+ element.descripcion);
          datos.push(element.cantidad);
        });
        //Asignar datos
        graficoBarras.data.labels = etiquetas;
        graficoBarras.data.datasets[0].data = datos;
        graficoBarras.update();
      }

      function graphic2(coleccion = []){
        let etiquetas = []; // Eje x
        let datos = []; // Eje Y

        coleccion.forEach(element => {
          etiquetas.push(element.tipoprenda + ' '+ element.descripcion);
          datos.push(element.cantidad);
        });
        //Asignar datos
        graficoBarras2.data.labels = etiquetas;
        graficoBarras2.data.datasets[0].data = datos;
        graficoBarras2.update();
      }
      datosBarras2();
      datosBarras();
  })
</script>