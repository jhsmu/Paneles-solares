<?php
  session_start();
?>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="./css/stylecuerpo.css">
    <link rel="icon" type="image/x-icon" href="./img/logo.png">
    <title>QuibdoSolar: Nosotros</title>
</head>
<body>
  <!-- encabezado -->
    <header>
    <?php include("./componentes/headerinicio.php"); ?>
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
            <img src="./img/presidente.webp" height="200px" alt="">
            <p style="text-align: center;">German Garmendia</p>
            </div>
        </div>
            </div>
        </div>
        <div class="row">
            <!-- Mision -->
        <div class="col-sm-6 mb-3">
        <div>
      <div class="card-body ">
        <h2 class="card-title" style="text-align: center;">Misión</h2>
        <p class="card-text" style="text-align: justify;">Nuestra misión en Quibdosolar es liderar la transición hacia un futuro más sostenible y limpio al proporcionar soluciones de energía solar accesibles y eficientes. Nos esforzamos por empoderar a individuos, comunidades y empresas para que adopten la energía solar como una fuente de energía confiable y respetuosa con el medio ambiente. Buscamos marcar la diferencia al contribuir a la reducción de la huella de carbono y fomentar un mundo más verde y sostenible..</p>
      </div>
    </div>
            </div>
    <!-- Vision -->
            <div class="col-sm-6 mb-3">
        <div>
      <div class="card-body">
        <h2 class="card-title" style="text-align: center;">Visión</h2>
        <p class="card-text" style="text-align: justify;">Nuestra visión en Quibdosolar es ser un referente global en la industria de la energía solar, reconocidos por nuestra innovación, calidad y compromiso con el medio ambiente. Visualizamos un mundo en el que la energía solar sea la fuente de energía dominante, y trabajamos incansablemente para hacer realidad esta visión. Buscamos transformar la forma en que se genera y consume energía, creando un impacto positivo en la sociedad y el planeta al proporcionar soluciones solares accesibles y eficaces para todas las personas y organizaciones..</p>
     
      </div>
    </div>
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
