<?php
session_start();
error_reporting(~E_NOTICE); // avoid notice
require_once './database/conexion.php';
// include './Carro/carrito.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- iconos en fontawesome -->
    <script src="https://kit.fontawesome.com/4b93f520b2.js" crossorigin="anonymous"></script>
    <!-- css cuerpo -->
    <link rel="stylesheet" href="./css/style.css">
    <!-- css footer y el header -->
    <link rel="stylesheet" href="./css/footer-header.css">
    <link rel="icon" type="image/x-icon" href="./img/logo.png">
    <title>Quibdosolar: Categorías</title>
</head>

<body>
    <header>
        <?php include("./componentes/heeader.php"); ?>
    </header>
    <?php


  require_once './database/conexion.php';
  if (isset($_GET['id'])) {
    $consulta1 = $DB_con->prepare('SELECT * FROM categoria WHERE id_categoria=:id_categoria');
    $consulta1->bindParam(':id_categoria', $_GET['id']);
    $consulta1->execute();
    $categoria = $consulta1->fetch(PDO::FETCH_ASSOC);

    $consulta2 = $DB_con->prepare('SELECT * FROM producto WHERE id_categoria=:categoria');
    $consulta2->bindParam(':categoria', $_GET['id']);
    $consulta2->execute();
    $productos = $consulta2->fetchAll(PDO::FETCH_ASSOC);

    $consulta3 = $DB_con->prepare('SELECT * FROM imagenes');
    $consulta3->execute();
    $imagenes = $consulta3->fetchAll(PDO::FETCH_ASSOC);
  }
  ?>

    <div class="container">
        <br>
        <div class="texto">
            <h2 style="text-align: center;"><?php echo $categoria['categoria'] ?></h2>
        </div>
        <div class="row ">
            <!-- card 1 -->
            <?php
        $ayudante = 0;
        $limite=3;
        foreach ($productos as $key => $producto) {;
        if($producto["estado_producto"]==0){
            $limite++;
            continue;
        }else {
            if ($key < $limite) {
      ?>
            <div class="col-md-4 mt-md-4 mb-md-4">
                <div class="card">
                    <?php
              foreach ($imagenes as $key => $imagen) {
                if (($producto['id_producto'] == $imagen['producto_id']) and ($producto['id_producto'] != $ayudante)) {
                  $ayudante++;
              ?>
                    <img src="./imagenes/<?php echo $imagen['url'] ?>" height="250px" width="300px"
                        alt="ImagneDeLosProductos">
                    <?php
                  break;
                }
              }
              ?>
                    <div class="card-body">
                        <h5 class="card-title"><strong><?php echo $producto['producto'] ?></strong></h5>
                        <p name="precio" id="precio" style="margin-left: 13rem; color:grey">
                            $ <?php echo number_format($producto['precio']) ?></p>
                    </div>
                    <div class="card-footer">
                        <a style="margin-left: 7rem;"
                        href="./categoriaDescripcion.php?id=<?php echo $producto['id_producto'] ?>"
                        class="btn btn-primary">Comprar</a>
                    </div>
                </div>
            </div>
            <?php
                }
            }
            }
            ?>
            <!-- carusel -->

            <div id="carouselExampleAutoplaying" class="carousel slide mb-3" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./img/fondo.jpeg"
                            height="200px" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./img/fondo1.jpeg"
                            height="200px" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./img/fondo2.jpeg"
                            height="200px" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- card 6 -->
            <?php
      foreach ($productos as $key => $producto) {
        if ($producto["estado_producto"]==0 ){
            continue;
        }else {
        if ($key >= $limite) {

      ?>
            <div class="col-md-4 mt-md-4 mb-md-4">
                <div class="card">

                    <?php
              foreach ($imagenes as $key => $imagen) {
                if (($producto['id_producto'] == $imagen['producto_id']) and ($producto['id_producto'] != $ayudante)) {
                  $ayudante++;
              ?>
                    <img src="./imagenes/<?php echo $imagen['url'] ?>" height="350px" width="300px"
                        alt="ImagenDeLosProductos">

                    <?php
                  break;
                }
              }
              ?>

                    <div class="card-body">
                        <h5 class="card-title"><strong><?php echo $producto['producto'] ?></strong></h5>
                        <p name="precio" id="precio" style="margin-left: 13rem; color:grey">
                            $ <?php echo number_format($producto['precio']) ?></p>
                        <div class="col-md-6">
                        </div>
                    </div>
                    <div class="card-footer">
                        <a style="margin-left: 7rem;"
                        href="./categoriaDescripcion.php?id=<?php echo $producto['id_producto'] ?>"
                        class="btn btn-primary">Comprar</a>
                    </div>
                </div>
            </div>
            <?php
                }
            }
            }
            ?>
        </div>
    </div>

    <footer>
        <?php include("./componentes/footer.php")?>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>
</body>

</html>