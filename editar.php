<?php
session_start();
include("./editar/conexion.php");

$consulta=$DB_con->prepare('SELECT email FROM cliente');
$consulta->execute();
$emails=$consulta->fetchAll(PDO::FETCH_ASSOC);

$id = $_SESSION["id_usuario"];
error_reporting(0);

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
    <link rel="stylesheet" href="./css/edit.css">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.2/dist/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
    function confirmar() {
        return confirm('¿Estas seguro de inhabilitar la cuenta?');
    }
    </script>
    <link rel="icon" type="image/x-icon" href="./img/logo/icono.png">
    <title>QuibdoSolar: Actualizar Datos</title>

</head>

<body>
    <!-- <header>
        <php
        include("./componentes/headerinicio.php")
        ?>
    </header> -->
    <?php
 session_start();
 include("./editar/conexion.php");
 
 $consulta = $DB_con->prepare('SELECT email FROM cliente');
 $consulta->execute();
 $emails = $consulta->fetchAll(PDO::FETCH_ASSOC);
 
 $id = $_SESSION["id_usuario"];
 error_reporting(0);
 
 if (isset($_POST['enviar'])) {
     // Entra si le das al botón "enviar"
     $id = $_POST['id'];
     $nombre = $_POST['nombre'];
     $apellido = $_POST['apellido'];
     $direccion = $_POST['direccion'];
     $telefono = $_POST['telefono'];
     $email = $_POST['email'];
     $contrasena = $_POST['contrasena'];
 
     // Actualizar los datos en la base de datos
     $sql = "UPDATE cliente SET nombre='$nombre', apellido='$apellido', direccion='$direccion', telefono='$telefono', email='$email', contrasenia='$contrasena' WHERE id='$id'";
     $resultado = mysqli_query($conexion, $sql);
 
     if ($resultado) {
         // Recuperar los nuevos valores de la base de datos
         $sql = "SELECT * FROM cliente WHERE id='$id'";
         $resultado = mysqli_query($conexion, $sql);
         $fila = mysqli_fetch_assoc($resultado);
 
         // Asignar los nuevos valores a las variables del formulario
         $id = $fila["id"];
         $nombre = $fila["nombre"];
         $apellido = $fila["apellido"];
         $direccion = $fila["direccion"];
         $email = $fila["email"];
         $telefono = $fila["telefono"];
         $contrasena = $fila["contrasenia"];
 
         echo "<script language='JavaScript'>
             alert('Los datos se actualizaron correctamente');
             location.assign('./inicio.php');</script>";
 
         error_reporting(0);
     } else {
         echo "<script language='JavaScript'>
             alert('Los datos NO se actualizaron :(');
             location.assign('./editar.php');</script>";
         error_reporting(0);
     }
     mysqli_close($conexion);
 } else {
     // No le ha dado al botón "enviar"
     $id;
     $sql = "SELECT * FROM cliente WHERE id='$id'";
     $resultado = mysqli_query($conexion, $sql);
 
     $fila = mysqli_fetch_assoc($resultado);
     $id = $fila["id"];
     $nombre = $fila["nombre"];
     $apellido = $fila["apellido"];
     $direccion = $fila["direccion"];
     $email = $fila["email"];
     $telefono = $fila["telefono"];
     $contrasena = $fila["contrasenia"];
     mysqli_close($conexion);
     error_reporting(0);
 
    ?>

    <div class="container">
        <div class="form">
            <form action="<?= $_SERVER["PHP_SELF"] ?>" method="post" enctype="multipart/form-data">
                <div class="form-header">
                    <div class="title">
                        <h1>Editar Perfil</h1>
                    </div>
                </div>
                <div class="input-group">
                    <div class="input-box">
                        <label for="">Nombres</label>
                        <input type="text" name="nombre" id="nombre" required onchange="nombre1()"
                            value="<?php echo $nombre; ?>">
                    </div>
                    <div class="input-box">
                        <label for="">Apellidos</label>
                        <input type="text" name="apellido" id="apellido" value="<?php echo $apellido; ?>" required
                            onchange="apellido1()">
                    </div>
                    <div class="input-box">
                        <label for="direccion">Dirección</label>
                        <input id="direccion" type="text" name="direccion" value="<?php echo $direccion; ?>" required
                            onchange="direccion1()">
                    </div>
                    <div class="input-box">
                        <label for="telefono">Teléfono</label>
                        <input id="telefono" disabled type="text" name="telefono" value="<?php echo $telefono; ?>"
                            onchange="telefono1()">
                    </div>
                    <div class="input-box">
                        <label for="email">Email</label>
                        <input disabled type="email" name="email" id="correo" value="<?php echo $email; ?>"
                            onchange="ValidacionCorreo()">
                    </div>
                    <div class=" input-box">
                        <label for="password">Contraseña</label>
                        <input type="password" id="clave" name="contrasena" value="<?php echo $contrasena; ?>" required
                            onchange="contraseña()">
                    </div>
                    <span>
                        <i class="fa fa-eye" style="color:#D8D8D8" id="eye"></i>
                    </span>
                </div>

                <div class="continue-button">
                    <button type="submit" name="enviar" value="ACTUALIZAR">Actualizar</button>
                    <?php echo "<button class='elimina'><a href='./editar/eliminar_cliente.php?id=" . $fila['id'] . "' onclick='return confirmar()'>Inhabilitar</a></button>"; ?>
                </div>

            </form>
        </div>
    </div>

    <?php
    }
    ?>

    <footer>
        <?php include("./componentes/footer.php") ?>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>

    <script>
    var eye = document.getElementById('eye');
    var input = document.getElementById('clave');

    eye.addEventListener('click', mostrar);

    function mostrar() {
        if (input.type == "password") {
            input.type = "text"
            eye.style.color = "#383838"
        } else {
            input.type = "password"
            eye.style.color = "#D8D8D8"
        }
    }


    function alerta() {
        Swal.fire({
            title: "Exito",
            text: "Tus datos han sido actualizados",
            icon: "success"
        });
    }
    </script>

    <script src="./js/validaciones.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.2/dist/sweetalert2.all.min.js"></script>

</body>

</html>
