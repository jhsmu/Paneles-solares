<?php
    session_start();
    require('./database/basededatos.php');
    //Creamos un objeto del tipo Database

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $db = new Database();
    $connection = $db->connect(); //Creamos la conexión a la BD

    $query2 = $connection->prepare("SELECT * FROM categoria");
    $query2->execute();

    $categorias = $query2->fetchAll(PDO::FETCH_ASSOC);

    if (isset($_POST["categoria"])) {
        $_SESSION["id_categoria"]=$_POST["categoria"];
        $query3 = $connection->prepare("SELECT * FROM producto
        WHERE id_categoria=:categoria");
        $query3->bindParam(":categoria", $_POST["categoria"]);
        $query3->execute();

        $_SESSION["productos"] = $query3->fetchAll(PDO::FETCH_ASSOC);
    }

    if (isset($_POST["producto"])) {
        $_SESSION["id_producto"]=$_POST["producto"];
        $query4 = $connection->prepare("SELECT id_producto, serial, producto, cantidad, precio, estado_producto, id_categoria
        FROM producto
        WHERE id_producto=:producto");
        $query4->bindParam(":producto", $_SESSION["id_producto"]); 
        $query4->execute();

        $product = $query4->fetch(PDO::FETCH_ASSOC);

        $query5 = $connection->prepare('SELECT * FROM imagenes WHERE producto_id=:id');
        $query5->bindParam(":id", $_SESSION["id_producto"]);
        $query5->execute();
        $imagenes = $query5->fetchAll(PDO::FETCH_ASSOC);
    }
    }
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- css bootstrap -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- iconos en fontawesome -->
    <script src="https://kit.fontawesome.com/4b93f520b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
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
            <div class="d-flex flex-column justify-content-center align-items-center text-black fs-1">
                <h1 style="font-size: 0.9em;">Cotizacion</h1>
            </div>
            <p class="">Si eres nuevo en esto de energia renobable puedes cotizar nuestros servicios, costos de mano de obra, mantenimiento, etc </p>
            <div class="lineaarriba">

            </div>
            <!-- primer formulario -->
            <div class="col-7">
                
            <div class="row">
                <div class="col-md-6">
                    <!-- Formulario de selección de categoría -->
                    <form method="post">
                        <div class="mb-3">
                            <select class="form-select" aria-label="Default select example" name="categoria" onchange="cambio()">
                                <option value="" selected type="hidden">Selecciona una categoría</option>
                                <?php
                                foreach ($categorias as $key => $categoria) {
                                    if ($categoria["estado_categoria"] == 1) {
                                        if (isset($_SESSION["id_categoria"]) && $_SESSION["id_categoria"] == $categoria["id_categoria"]) {
                                            ?>
                                            <option value="<?php echo $categoria["id_categoria"] ?>" selected><?php echo $categoria["categoria"] ?></option>
                                        <?php
                                        } else {
                                            ?>
                                            <option value="<?php echo $categoria["id_categoria"] ?>"><?php echo $categoria["categoria"] ?></option>
                                        <?php
                                        }
                                    } else {
                                        continue;
                                    }
                                }
                                ?>
                            </select>
                        </div>
                        <button type="submit" id="boton" hidden>Enviar</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <!-- Formulario de selección de producto -->
                    <form method="post">
                        <div class="mb-3">
                            <select class="form-select" aria-label="Default select example" name="producto" onchange="cambio2()">
                                <option value="" selected type="hidden">Selecciona un producto</option>
                                <?php
                                foreach ($_SESSION["productos"] as $key => $producto) {
                                    if ($producto["estado_producto"] == 0) {
                                        continue;
                                    } else {
                                        if (isset($_SESSION["id_producto"]) && $_SESSION["id_producto"] == $producto["id_producto"]) {
                                            ?>
                                            <option value="<?php echo $producto["id_producto"] ?>" selected><?php echo $producto["producto"] ?></option>
                                        <?php
                                        } else {
                                            ?>
                                            <option value="<?php echo $producto["id_producto"] ?>"><?php echo $producto["producto"] ?></option>
                                        <?php
                                        }
                                    }
                                }
                                ?>
                            </select>
                        </div>
                        <button type="submit" id="boton2" hidden></button>
                    </form>
                </div>
            </div>                 
                <!-- Verifica si hay elementos en la cotización -->
                <div class="">
                <?php if (!empty($_SESSION['cotizacion'])) : ?>
                    <h2>Cotización Actual</h2>
                    <table class="table table-light table-bordered">
                        <tbody>
                            <tr>
                                <th width="40%">Producto</th>
                                <th width="15%" class="text-center">Precio de compra</th>
                                <th width="20%" class="text-center">Cantidad</th>
                                <th width="20%" class="text-center">Total</th>
                                <th width="5%">Acción</th>
                            </tr>
                            <?php
                            $total = 0;
                            foreach ($_SESSION['cotizacion'] as $key => $item) {
                                $producto = $item['producto'];
                                $precioCompra = $item['precioCompra'];
                                $cantidadCompra = $item['cantidadCompra'];
                                $totalProducto = $precioCompra * $cantidadCompra;
                                ?>
                                <tr>
                                    <td width="40%"><?php echo $producto; ?></td>
                                    <td width="15%" class="text-center">$<?php echo number_format($precioCompra, 2); ?></td>
                                    <td width="20%" class="text-center"><?php echo $cantidadCompra; ?></td>
                                    <td width="20%" class="text-center">$<?php echo number_format($totalProducto, 2); ?></td>
                                    <td width="5%">
                                        <form action="./eliminar.php" method="post">
                                            <input type="hidden" name="eliminarProductoKey" value="<?php echo $key; ?>">
                                            <button type="submit" name="eliminarproducto" class="btn btn-danger">Eliminar</button>
                                        </form>
                                    </td>
                                </tr>
                                <?php
                                $total += $totalProducto;
                            }
                            ?>
                            <tr>
                                <td colspan="2" aling="right">
                                    <h3>Total</h3>
                                </td>
                                <td colspan="1"></td>
                                <td aling="right">
                                    <h3>$<?php echo number_format($total, 2); ?></h3>
                                </td>
                                <td colspan="1"></td>
                                
                            </tr>
                            <tr>
                                <td colspan="5" class="text-right">
                                <button type="button" class="btn btn-primary detalle-button" data-bs-toggle="modal" data-bs-target="#exampleModal"     data-row="<?php echo $key; ?>">Detalle</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <?php else : ?>
                    <!-- Mensaje a mostrar cuando no hay elementos en la cotización -->
                    <tr>
                        <td colspan="5">
                            <div class="alert alert-success">
                            No hay productos en la cotización.
                            </div>
                        </td>
                    </tr>
                <?php endif; ?>
                </div>
            </div>

            <!-- segundo formulario -->
            <div class="col-5">
                <form action="./agregar.php" method="post">
                    <?php
                        if (isset($product)) {
                    ?>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <img src="./imagenes/<?php echo $imagenes[0]['url'] ?>" alt="" class="img-fluid">
                            </div>
                            <div class="col-md-6 ">
                                <div class="mb-2">
                                    <h3 class="text-dark  mb-2"  style="font-size: 0.7rem;"><?php echo $product['producto'] ?></h3>
                                    <input type="text" name="nombreproducto" value="<?php echo $product['producto'] ?>"  hidden>
                                    <p class="text-gray-700 text-base" style="font-size: 0.6rem;">
                                        Precio: $<?php echo number_format($product["precio"] * 0.6) ?></p>
                                    <input  type="number" name="preciocompra" id="" value="<?php echo $product["precio"] ?>" hidden>
                                    <input type="number" name="idProducto" id=""
                                        value="<?php echo $product["id_producto"] ?>" hidden>

                                </div>
                            </div>
                            <div class="row">
                            <div class="col-6 mb-3">
                            <input type="number" class="form-control" style="width: 60px;" name="cantidadcompra" id="cantidadUsu" required onchange="cantidad123()" placeholder="0">
                            </div>
                            <div class="col-4 mb-3">
                            <button class="btn btn-primary" name="agregarproducto" class="rounded">agregar</button>    
                            </div>
                            </div>
                        </div>
                    </div>
                    <?php
                        }
                    ?>
                </form>
            </div>
        </div>
    </div>
    <!-- Pie de pagina -->
    <footer>
        <?php include("./componentes/footer.php")?>
    </footer>

    <!-- Modal único para mostrar detalles -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detalle del producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="detalleModalBody">
                <!-- Aquí se mostrará la información de la fila específica -->
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
<!-- funcion para mostrar informacion a el modal -->
<script>
    // JavaScript para mostrar información de todos los productos en el modal
    document.querySelectorAll(".detalle-button").forEach(function(button) {
        button.addEventListener("click", function() {
            // Obtén todas las filas de la tabla (personaliza esto según tu estructura de datos)
            var filas = <?php echo json_encode($_SESSION['cotizacion']); ?>;
            var total = 0;

            // Construye el contenido del modal con la información de todas las filas
            var contenidoModal = "<h2>Detalle de la Cotización</h2>";
            contenidoModal += "<table>";
            contenidoModal += "<tr><th>Producto</th><th>Cantidad</th><th>Precio U</th><th>Total</th></tr>";

            // Itera a través de las filas y agrega la información a la tabla
            filas.forEach(function(fila) {
                var producto = fila.producto;
                var cantidad = fila.cantidadCompra;
                var precio = fila.precioCompra;
                var totalProducto = cantidad * precio;

                contenidoModal += "<tr>";
                contenidoModal += "<td>" + producto + "</td>";
                contenidoModal += "<td>" + cantidad + "</td>";
                contenidoModal += "<td>$" + precio + "</td>";
                contenidoModal += "<td>$" + totalProducto + "</td>";
                contenidoModal += "</tr>";

                total += totalProducto;
            });

            contenidoModal += "<tr  style=' border-top: 5px solid #F8F9FA; margin:2px 0;'><td>Total a pagar</td><td></td><td></td><td>$" + total + "</td></tr>";
            contenidoModal += "</table>";

            // Actualiza el cuerpo del modal con el contenido
            document.getElementById("detalleModalBody").innerHTML = contenidoModal;
        });
    });
</script>




<!-- organizacion de tabla -->
<script>
    $(document).ready(function() {
        $('#dataTable').DataTable({
            "language": {
            "url":"//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json"
        },
        "lengthMenu": [5, 10, 25, 50],
        "pageLength":5
        });
    });
</script>
</html> 


    <script>
        function cambio() {
            document.getElementById("boton").click();
            return false; // Evita el envío por defecto
        }

        function cambio2() {
            document.getElementById("boton2").click();
            return false; // Evita el envío por defecto
        }
    </script>
