<!-- <php
session_start();

// Aquí no necesitas inicializar $_SESSION['cotizacion'] ya que lo hicimos en el archivo anterior

// Redirige a donde quieras después de agregar el producto
header("Location: ./cotizaciones.php");
?> -->
<?php
session_start(); // Inicia la sesión si no está iniciada

// Inicializa una variable de mensaje
$mensaje = '';

// Verifica si se hizo clic en el botón "agregarproducto"
if (isset($_POST['agregarproducto'])) {
    // Recopila la información del producto seleccionado
    $producto = $_POST['nombreproducto'];
    $precioCompra = $_POST['preciocompra'];
    $cantidadCompra = $_POST['cantidadcompra'];
    $idProducto = $_POST['idProducto'];

    // Crea un array para representar el producto seleccionado
    $nuevoProducto = array(
        'producto' => $producto,
        'precioCompra' => $precioCompra,
        'cantidadCompra' => $cantidadCompra,
        'idProducto' => $idProducto
    );

    // Almacena el producto en la sesión para mantener un registro de los productos seleccionados
    $_SESSION['cotizacion'][] = $nuevoProducto;

    // Construye el mensaje a mostrar
    $mensaje = "Producto agregado a la cotización:<br>";
    $mensaje .= "Producto: " . $producto . "<br>";
    $mensaje .= "Precio de compra: $" . $precioCompra . "<br>";
    $mensaje .= "Cantidad: " . $cantidadCompra . "<br>";
}

// Redirige de vuelta a la página anterior o a donde desees mostrar la cotización
header("Location: ./cotizaciones.php"); // Cambia 'pagina_anterior.php' por la URL adecuada

// Muestra el mensaje después de la redirección
echo $mensaje;
?> 
