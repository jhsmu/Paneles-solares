<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <!-- iconos en fontawesome -->
    <script src="https://kit.fontawesome.com/4b93f520b2.js" crossorigin="anonymous"></script>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@12/dist/sweetalert2.min.css"> -->
    

    <!-- css foote y el header -->
    <link rel="stylesheet" href="./css/footer-header.css">
    <!-- css cuerpo -->
    <link rel="stylesheet" href="./css/style.css">
    <link rel="icon" type="image/x-icon" href="./img/logo.png">
    <title>QuibdoSolar: Nosotros</title>
</head>
<body>
  <!-- encabezado -->
    <header>
    <?php include("./componentes/header.php"); ?>
    </header>

    <div class="container">
        <div class="row">
            <div class="col mt-3 mb-4">
            <div class="d-flex position-relative " >
            <img src="./img/logo.png" height="200px" class="flex-shrink-0 me-3" alt="...">
            <div>
            <h1 style="text-align: center;">QuibdoSolar</h1>
            <p style="text-align: justify;margin-right: 15px;" >Quibdosolar es una empresa dedicada a la venta de paneles solares y soluciones energéticas sostenibles. Nuestra misión es brindar a nuestros clientes acceso a tecnología solar de vanguardia, permitiéndoles aprovechar al máximo la energía del sol para satisfacer sus necesidades energéticas de manera eficiente y respetuosa con el medio ambiente. Con una amplia gama de productos y servicios, Quibdosolar se esfuerza por empoderar a las comunidades y empresas a tomar el control de su consumo de energía y contribuir a un futuro más limpio y sostenible. Nuestra experiencia y compromiso con la calidad hacen de Quibdosolar una elección confiable para aquellos que buscan una fuente de energía renovable y amigable con el planeta.</p>
            </div>
            <div >
            <img src="./img/presidenta.jpeg" height="200px" alt="">
            <p style="text-align: center;">German Garmendia</p>
            </div>
        </div>
            </div>
        </div>
        
        <div class="row">
    <!-- Mision -->
        <div class="col-sm-6 mb-3">
      <div class="card border-0">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="./img/mision.svg" class="img-fluid rounded-start" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
            <h2 class="card-title" style="text-align: center;">Misión</h2>
            <p class="card-text" style="text-align: justify;">Empoderar a las personas y empresas a través de soluciones de energía solar confiables y asequibles, contribuyendo así a la transición hacia un futuro más sostenible.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
      
    <!-- Vision -->
    
    <div class="col-sm-6 mb-3">
      <div class="card border-0">
        <div class="row g-0">
          <div class="col-md-4">
            <img src="./img/vision.svg" class="img-fluid rounded-start" alt="...">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h2 class="card-title" style="text-align: center;">Visión</h2>
              <p class="card-text" style="text-align: justify;">Ser reconocidos a nivel mundial como un referente en energía solar, liderando el camino hacia un mundo donde la energía solar sea la principal fuente de energía, promoviendo la sostenibilidad y la reducción de la huella de carbono.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

        </div>

        <div class="lineaarriba"></div>
    </div>

    <div class="container">
  <div class="row">
    <div class="col-lg-6 offset-lg-3">
      <div class="d-flex flex-column justify-content-center align-items-center text-black fs-1">
        <h1 style="font-size: 0.9em;">Contactanos</h1>
      </div>
      <p class="">Aqui puedes contactarte con nosotros por alguna queja, sugerencia o algun inconveniente presentado con tu pedido</p>
        <div class="lineaarriba"></div>
          <form action="https://formsubmit.co/quibdosolar@gmail.com" method="POST">
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="nombre" class="form-label">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Tu nombre" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="apellido" class="form-label">Apellido</label>
              <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Tu apellido" required>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="telefono" class="form-label">Teléfono</label>
              <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Tu teléfono" required>
            </div>
            <div class="col-md-6 mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Tu correo" required>
            </div>
            <div class="mb-3">
              <label for="descripcion" class="form-label">Descripción</label>
              <textarea class="form-control" id="descripcion" name="descripcion" rows="4" placeholder="Escribe tu mensaje" ></textarea>
            </div>
            <div class="text-center mb-3"> <!-- Agregamos la clase text-center para centrar el botón -->
              <button type="submit" class="btn btn-primary">Contactar</button>
            </div>
          </div>
          <input type="hidden" name="_template" value="box">
          <input type="hidden" name="_next" value="http://localhost/paneles-solares/nosotros.php">
          <input type="hidden" name="_captcha" value="false">
        </form>
    </div>
  </div>
</div>

  <!-- Pie de pagina -->
    <footer>
        <?php include("./componentes/footer.php")?>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- Añade el script de SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@12/dist/sweetalert2.all.min.js"></script>

<!-- <script>
document.getElementById("myForm").addEventListener("submit", function(event) {
    fetch(this.action, {
        method: this.method,
        body: new FormData(this)
    })
    .then(function(response) {
        if (response.ok) {
            // Formulario enviado con éxito, muestra la alerta
            Swal.fire({
                icon: 'success',
                title: 'Correo enviado',
                text: 'Tu correo se ha enviado con éxito.',
                confirmButtonText: 'Aceptar'
            });

            // Redirige al usuario después de mostrar la alerta
            setTimeout(function() {
                window.location = 'http://localhost/paneles-solares/nosotros.php';
            }, 2000);
        } else {
            // Hubo un error en la solicitud, muestra una alerta de error si es necesario
            console.error("Hubo un error al enviar el correo");
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Hubo un error al enviar el correo. Inténtalo de nuevo.',
                confirmButtonText: 'Aceptar'
            });
        }
    });
});
</script> -->
</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<!-- Añade axios en tu HTML -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</html>
