<?php
session_start();
if (isset($_SESSION['login']) && $_SESSION['login']['status']){
  header('Location:./views/');
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
  <section class="vh-100" style="background-color: #E4C4E8;">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card bg-dark text-white" style="border-radius: 1rem;">
            <div class="card-body p-5 text-center">
              
              <div class="mb-md-5 mt-md-4 pb-5">
                
                <h2 class="fw-bold mb-2 text-uppercase">Inicio de sesión</h2>
                <p class="text-white-50 mb-5">Ingrese su usuario y contraseña</p>

                <div class="form-outline form-white mb-4">
                  <label for="email" class="form-label">Nombre usuario:</label>
                  <input type="email" id="email" class="form-control form-control-lg" placeholder="correo@gmail.com" >
                </div>

                <div class="form-outline form-white mb-4">
                  <label for="contraseña" class="form-label">Contraseña:</label>
                  <input type="password" id="contraseña" class="form-control form-control-lg">
                </div>

                <button class="btn btn-outline-light btn-lg px5 mt-3" id="login" type="submit">Login</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <script>
    document.addEventListener("DOMContentLoaded", () => {
      const email = document.querySelector("#email");
      const clave = document.querySelector("#contraseña")
      const btLogin = document.querySelector("#login")

      function inicioSesion(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "iniciarSesion");
        parametros.append("email",email.value);
        parametros.append("clave", clave.value);

        fetch('./controllers/usuario.controller.php', {
          method: 'POST',
          body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
          if(datos.status){
            alert(`Bienvenido: ${datos.apellidos} ${datos.nombres}`)
            window.location.href = './views/graficos.php';
          }
          else{
            alert(datos.mensaje)
          }
        })

      }
      btLogin.addEventListener("click",inicioSesion);
    })
  </script>
</body>
</html>