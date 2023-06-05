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
            <a class="nav-link active" href="../controllers/usuario.controller.php?operacion=destroy">Cerrar sesion</a>
          </li>
          <li class="nav-item">
            <label for=""><?=$_SESSION['login']['nombres'] ?></label>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>