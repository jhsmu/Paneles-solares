<?php
    session_start();

    if (isset($_POST["sesion"])) {
        header('location:login-registro.php');
    }

    require_once './database/conexion.php';

    $consulta1 = $DB_con->prepare('SELECT * FROM producto');
    $consulta1->execute();
    $productos = $consulta1->fetchAll(PDO::FETCH_ASSOC);
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
    <!-- iconos en fontawesome -->
    <script src="https://kit.fontawesome.com/4b93f520b2.js" crossorigin="anonymous"></script>
    <!-- css footer y el header -->
    <link rel="stylesheet" href="./css/footer-header.css">
    <!-- css cuerpo -->
    <link rel="stylesheet" href="./css/style_cuerpo.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="icon" type="image/x-icon" href="./img/logo.png">
    <title>QuibdóSolar</title>
</head>

<body>
    <!-- encabezado -->
    <header class="vh-100 over-flow-hidden">
        <?php include("./componentes/headerinicio.php"); ?>
    </header>

            <!-- cuerpo -->
            <div class="container ">
            <div class="row mt-4 mb-4">
                <!-- card 1 -->
                <!-- Este foreach es para iterar y traer los productos de la base de datos -->
                <?php
                $limite = 6;
                $principio = 3;
                $numero = 1;
                foreach ($productos as $key => $producto) {
                    if ($producto["estado_producto"]==0) {
                        $principio++;
                        $limite++;
                        continue;
                    } else {
                ?>
                <div class="col-md-4">
                    <div class="card">
                        <figure>
                            <?php //Este script sirve para poner solo la primera imagen
                                $consulta2 = $DB_con->prepare('SELECT * FROM imagenes WHERE producto_id=:id');
                                $consulta2->bindParam(":id", $producto["id_producto"]);
                                $consulta2->execute();
                                $imagenes = $consulta2->fetchAll(PDO::FETCH_ASSOC);
                                ?>
                            <img src="./imagenes/<?php echo $imagenes[0]['url'] ?>" height="200px" class="card-img-top"
                                alt="...">
                        </figure>

                        <div class="card-body">
                            <h5 class="card-title"><strong><?php echo $producto['producto'] ?></strong></h5>
                            <!-- <p style="text-align: justify;"><php echo $producto['descripcion_breve'] ?></p> -->
                            <p name="precio" id="precio" style="margin-left: 13rem; color:grey">
                                $ <?php echo number_format($producto['precio']) ?></p>
                        </div>
                        <div class="card-footer">
                            <a style="margin-left: 7rem;"
                                href="./descripcion.php?id=<?php echo $producto['id_producto'] ?>"
                                class="btn btn-primary">Comprar</a>                       
                         </div>
                    </div>

                </div>

                <?php
                        if ($numero % 3 == 0) {
                            break;
                        } else {
                            $numero++;
                        }
                    }
                }
                ?> 
                <div class="linea-arriba">

                </div>
                <!-- carusel -->
                <div id="carouselExampleAutoplaying" class="carousel slide mt-3 mb-3" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="./img/fondo2.jpeg" height="250px" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="./img/fondo.jpeg"
                                height="250px" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="./img/fondo1.jpeg" height="250px" class="d-block w-100" alt="...">
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

                <div class="linea-abajo">

                </div>

                <!-- card 3 -->
                <?php
                for ($i = $principio; $i < $limite; $i++) {
                    if ($productos[$i]["estado_producto"]==0) {
                        $limite++;
                        continue;
                    } else {
                ?>

                <div class="col-md-4">
                    <div class="card">
                        <figure>
                            <?php //Este script sirve para poner solo la primera imagen
                                $consulta2 = $DB_con->prepare('SELECT * FROM imagenes WHERE producto_id=:id');
                                $consulta2->bindParam(":id", $productos[$i]["id_producto"]);
                                $consulta2->execute();
                                $imagenes = $consulta2->fetchAll(PDO::FETCH_ASSOC);
                                ?>
                            <img src="./imagenes/<?php echo $imagenes[0]['url'] ?>" height="200px" class="card-img-top"
                                alt="...">
                        </figure>
                        <div class="card-body">
                            <h5 class="card-title"><strong><?php echo $productos[$i]['producto'] ?></strong></h5>
                            <!-- <p style="text-align: justify;"><php echo $productos[$i]['descripcion_breve'] ?></p> -->
                            <p name="precio" id="precio" style="margin-left: 13rem; color:grey">
                                $ <?php echo number_format($productos[$i]['precio']) ?></p>
                        </div>
                        <div class="card-footer">
                            <a style="margin-left: 7rem;"
                                href="./descripcion.php?id=<?php echo $producto['id_producto'] ?>"
                                class="btn btn-primary">Comprar</a>                       
                         </div>
                    </div>
                </div>
                <?php
                    }
                }
                ?>
            </div>
        </div>
        <footer>
            <?php include("./componentes/footer.php")?>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.2/dist/sweetalert2.all.min.js"></script>

</body>

</html>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>
<script src="/js/app.js"></script>
<script src="./js/animacion.js"></script>

<?php
    if (isset($_SESSION["error_cambio"])) {
        echo ('<script>Swal.fire({
            title: "Error de inhabilitar",
            text: "error al inhabilitar",
            icon: "info" 
        });
        </>');
        unset($_SESSION["error_cambio"]);
    }
    
    if (isset($_SESSION['compra'])) {
        if ($_SESSION['compra'] == true) {
            echo'<script>Swal.fire({
                title: "Tú Orden fue creada",
                text: "Revisa tus Pedidos para más información",
                icon: "success" 
                });
                </script>';
            $_SESSION['compra'] = false;
        }
    }
    ?>