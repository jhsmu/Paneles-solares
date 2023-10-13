<?php
    include './carro/carrito.php';


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <!-- iconos en fontawesome -->
    <script src="https://kit.fontawesome.com/4b93f520b2.js" crossorigin="anonymous"></script>
    <!-- css footer y el header -->
    <link rel="stylesheet" href="./css/footer-header.css">
    <!-- css cuerpo -->
    <link rel="stylesheet" href="./css/style_cuerpo.css">
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Lato|Liu+Jian+Mao+Cao&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="./css/estilos.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link rel="icon" type="image/x-icon" href="./img/logo.png">   
    <title>Quibdosolar: Carrito</title>
</head>

<body>
    <header>
        <?php
        include("./componentes/heeader.php");
        ?>
    </header>
    <div class="container">
        <br><br>
        <h2>Lista de compra</h2>
        <br>
        <table class="table table-light table-bordered">
            <tbody>
                <tr>
                    <th width="40%">Producto</th>
                    <th width="15%" class="text-center">Precio</th>
                    <th width="20%" class="text-center">Cantidad</th>
                    <th width="20%" class="text-center">Total</th>
                    <th width="5%">Acción</th>
                </tr>
                <?php
                if (!empty($_SESSION['carrito'])) {
                    $total = 0;
                    foreach ($_SESSION['carrito'] as $indice => $producto) {
                ?>
                        <tr>
                            <td width="40%"><?php echo $producto['producto'] ?></td>
                            <td width="15%" class="text-center"><?php echo number_format($producto['precio'], 2) ?></td>
                            <td width="20%" class="text-center">

                                <form action="" method="get">
                                    <input type="text" name="id" value="<?php echo $producto['id']; ?>" hidden>
                                    <div class="input-group mb-3" style="max-width: 120px;">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-outline-primary js-btn-minus btnIncrementar" type="submit" name="botonAdd1" value="disminuir">&minus;</button>
                                        </div>
                                        <input type="text" readonly class="form-control text-center" data-precio="" data-id="" value="<?php echo $producto['cantidad'] ?>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-primary js-btn-plus btnIncrementar" type="submit" name="botonAdd1" value="aumentar">&plus;</button>
                                        </div>
                                    </div>
                                </form>

                            </td>
                            <td width="20%" class="text-center">$ <?php echo number_format($producto['precio'] * $producto['cantidad'], 2) ?></td>
                            <td width="5%">
                                <form action="" method="get">
                                    <input type="text" name="id" value="<?php echo $producto['id']; ?>" hidden>
                                    <button class="btn btn-danger" type="submit" name="botonAdd1" value="eliminar">
                                        Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>
                    <?php
                        $total += $producto['precio'] * $producto['cantidad'];
                    }
                    ?>
                    <tr>
                        <td colspan="3" align="right">
                            <h3>Total</h3>
                        </td>
                        <td align="right">
                            <h3>$<?php echo number_format($total, 2); ?></h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">

                        <form action="./Carro/pagar.php" method="post">
                                <div class="alert alert-success">
                                    <div class="form-group">
                                        <label for="persona">Cliente</label>
                                        <input type="text" name="cliente" id="cliente" class="form-control" value="<?php echo $_SESSION['usuario']; ?>" disabled>
                                    </div>
                                    <small class="form-text text-muted">
                                        Los productos se le venderán a este cliente
                                    </small>
                                </div>
                                <button class="btn btn-primary btn-lg btn-block" type="submit" name="botonAdd" value="proceder">Comprar</button>
                            </form>

                        </td>
                    </tr>
                <?php
                } else {
                ?>
                    <tr>
                        <td colspan="5">
                            <div class="alert alert-success">
                                No hay productos en el carrito
                            </div>
                        </td>
                    </tr>

                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

</body>
<script src="./validaciones/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
</html>

