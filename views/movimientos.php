<?php
  session_start();
  if (!isset($_SESSION['login']) || !$_SESSION['login']['status']){
    header("Location:../");
  }
  $responseJSON = json_encode($_SESSION['login']);
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
      
      <h1 style="text-align: center;" class="mt-3">Registro de movimientos</h1> 
        <div class="row mt-3">
          <div class="col-md-3"></div>
          <div class="col-md-2" >
            <button type="button" class="btn btn-large" data-bs-toggle="modal" data-bs-target="#modalId" style="background-color: #E4C4E8;">Registro</button>
          </div>
          <div class="col-md-1">
            <label for="cate" class="form-label">Categoria:</label>
          </div>
          <div class="col-md-2">
            <select name="cate" id="cate" class="form-select" autofocus>
              <option value="">Seleccione</option>
            </select>
          </div>
          <div class="col-md-1">
            <label for="des" class="form-label">Descripcion:</label>
          </div>
          <div class="col-md-2">
            <select name="des" id="des" class="form-select" autofocus>
              <option value="">Seleccione</option>
            </select>
          </div>
        </div>      
      <div class="container">
        <!-- Modal trigger button -->
        <div class="row mt-1">
          <div class="col-md-4">
            </div>
            <div class="col-md-12 mt-3">
              <table class="table table-sm table-striped"  id="tabla-entrada">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Tipo prenda</th>
                    <th>Descripcion</th>
                    <th>Movimientos</th>
                    <th>Cantidad</th>
                    <th>Observaciones</th>
                    <th>Fecha</th>
                  </tr>
                </thead>
                <tbody>
  
                </tbody>
              </table>
            </div>
        </div>
      </div>
        <!--Formulario de registro de entrada-->
        <!-- Modal Body -->
        <!-- if you want to close by clicking outside the modal, delete the last endpoint:data-bs-backdrop and data-bs-keyboard -->
        <div class="modal fade" id="modalId" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modalTitleId">Registro de entrada y salida</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="" id="form-prendas">
                  <div class="row">
                    <div class="col-md">
                        <label for="movi" class="form-label">Movimiento:</label>
                         <select name="movi" id="movi" class="form-select form-select-sm" autofocus>
                          <option value="">Seleccione</option>
                          <option value="Entrada">Entrada</option>
                          <option value="Salida">Salida</option>
                        </select>
                      </div>
                      <div class="mb-3 row g-2">
                      <div class="col-md">
                        <label for="tipo" class="form-label">Categoria:</label>
                         <select name="tipo" id="tipo" class="form-select form-select-sm" autofocus>
                          <option value="">Seleccione</option>
                        </select>
                      </div>
                      <div class="col-md">
                        <label for="descripcion" class="form-label">Descripcion:</label>
                         <select name="descripcion" id="descripcion" class="form-select form-select-sm" autofocus>
                          <option value="">Seleccione</option>
                        </select>
                      </div>
                    </div>
                    <div class = "mb-3">
                      <label for="observaciones" class="form-label">Observaciones:</label>
                      <input type="text" class="form-control form-control-sm" id="observaciones">
                    </div>
                    <div class="mb-3">
                      <label for="cantidad" class="form-label">Cantidad:</label>
                      <input type="text" class="form-control form-control-sm" id="cantidad">
                    </div>
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <div class="col-md">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button class="btn" type="button" id="guardar" style="background-color: rgb(229, 240, 127);">Guardar</button>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>         
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    //cajas de texto
    const movi = document.querySelector("#movi");
    const tipo = document.querySelector("#tipo");
    const observaciones = document.querySelector("#observaciones");
    const cantidad = document.querySelector("#cantidad");
    const fecha = document.querySelector("#fecha");
    const descripcion = document.querySelector("#descripcion");
    const cate = document.querySelector("#cate");
    const des = document.querySelector("#des");
    //Botones
    const btguardar = document.querySelector("#guardar");
    const btreiniciar = document.querySelector("#reiniciar");
    //Tabla
    const tabla = document.querySelector("#tabla-entrada");
    const cuerpoTabla = document.querySelector("tbody");
    
    function mostrarTipo(){
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
      tipo.appendChild(optionTag);
        })
      }) 
    }

    function mostrarDescripcion(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarDescripcion");
    parametros.append("idtipoprenda", parseInt(tipo.value))

    fetch("../controllers/prendas.controller.php",{
      method: 'POST',
      body: parametros
      })
      .then(response => response.json())
      .then(lista => {
        descripcion.innerHTML = "<option value=''>Seleccione</option>";
        lista.forEach(element => {
          const optionTag = document.createElement("option");
          optionTag.value = element.idprenda;
          optionTag.text = element.descripcion;
          descripcion.appendChild(optionTag);
        })
      })
    }
    
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

    function listaDescrip(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "listarDescripcion");
      parametros.append("idtipoprenda", parseInt(cate.value))

      fetch("../controllers/prendas.controller.php",{
        method: 'POST',
        body: parametros
        })
        .then(response => response.json())
        .then(lista => {
          des.innerHTML = "<option value=''>Seleccione</option>";
          lista.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.idprenda;
            optionTag.text = element.descripcion;
            des.appendChild(optionTag);
          })
        })
    }
    function filtrardes(){
      const parametros = new URLSearchParams();
      parametros.append("operacion", "filtrarDes");
      parametros.append("idtipoprenda", parseInt(cate.value));
      parametros.append("idprenda", parseInt(des.value));

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
          <td></td>
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
            
    function registrarMov(){
      if(confirm('¿Esta seguro de guardar los datos?')){
        const parametros = new URLSearchParams();

        const response = <?php echo $responseJSON;?>;
        const idusuario = response.idusuario;

        parametros.append("operacion","registrarMovimientos");
        parametros.append("idusuario",parseInt(idusuario));
        parametros.append("tipo", movi.value);
        parametros.append("idtipoprenda",tipo.value);
        parametros.append("idprenda", descripcion.value)
        parametros.append("cantidad", cantidad.value);
        parametros.append("observaciones", observaciones.value);

        fetch("../controllers/registro.controller.php", {
          method: 'POST',
          body: parametros
          })
          .then(response => response.json())
          .then(datos => {
            if(datos.status){
            document.querySelector("#form-prendas").reset();
            listaMovimientos();
          }else{
            alert(datos.mensaje)
          }
        })
      }
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

    btguardar.addEventListener("click", registrarMov);
    listaMovimientos();
    listaCate();
    cate.addEventListener("change", listaDescrip);
    des.addEventListener("change", filtrardes);
    tipo.addEventListener("change", mostrarDescripcion);
    mostrarTipo();
  })
</script>
</body>
</html>