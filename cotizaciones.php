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
    <div class="col-lg-6 offset-lg-3">
      <div class="d-flex flex-column justify-content-center align-items-center text-black fs-1">
        <h1 style="font-size: 0.9em;">Cotizacion</h1>
      </div>
      <p class="">Si eres nuevo en esto de energia renobable puedes cotizar nuestros servicios, costos de mano de obra, mantenimiento, etc </p>
      <div class="lineaarriba"></div>
      <form>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="nombre" class="form-label">Nombre y apellido </label>
            <input type="text" class="form-control" id="nombres" placeholder="Tu nombre y apellido" required>
          </div>
          <div class="col-md-6 mb-3">
            <label for="telefono" class="form-label">Teléfono</label>
            <input type="tel" class="form-control" id="telefono" placeholder="Tu teléfono" required>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="direccion" class="form-label">Direccion</label>
            <input type="tel" class="form-control" id="direccion" placeholder="Tu Direccion" required>
          </div>
          <div class="col-md-6 mb-3">
            <label for="correo" class="form-label">Correo Electrónico</label>
            <input type="email" class="form-control" id="correo" placeholder="Tu correo" required>
          </div>
        </div>
        <div class="row">

          <div class="col-md-6 mb-3">
          <select class="form-select" aria-label="Default select example">
                <option selected> Tipo de instancia</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
          </div>

          <div class="col-md-6 mb-3">
          <select class="form-select" aria-label="Default select example">
                <option selected>Categoria</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
          </div>

          <div class="col-md-6 mb-3">
          <select class="form-select" aria-label="Default select example">
                <option selected>Producto</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
          </div>
          <div class="col-md-2 mb-3">
            <input type="number" class="form-control" style="height:100%" name="cantidad" id="cantidadUsu" value="1" min="1" max="<?php echo $producto['cantidad'] ?>" onchange="cantidad123()" required>
          </div>

          <div class="col-md-3 mb-3">
          <button type="submit" class="btn btn-primary">Agregar</button>
          </div>

            <div class="row">
            <h4>Cuenta con conexion de la red</h4>
                <div class="col-md-6 mb-3">
                    
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">Si</label>
                    </div>
                    <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                            <label class="form-check-label" for="inlineRadio2">No</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="mb-3">
          <label for="descripcion" class="form-label">Descripción</label>
          <textarea class="form-control" id="descripcion" rows="4" placeholder="Escribe tu mensaje" ></textarea>
        </div>
        <div class="text-center mb-3"> <!-- Agregamos la clase text-center para centrar el botón -->
          <button type="submit" class="btn btn-primary">Cotizar</button>
        </div>
      </form>
    </div>
  </div>
</div>

 <!-- Pie de pagina -->
    <footer>
        <?php include("./componentes/footer.php")?>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper(".mySwiper", {
    effect: "coverflow",
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: "auto",
    coverflowEffect: {
      rotate: 0,
      stretch: 0,
      depth: 300,
      modifier: 1,
      slideShadows: false,
    },
    pagination: {
      el: ".swiper-pagination",
    },
  });
</script>

</body>
</html>
