<?php
session_start();

if (isset($_POST['eliminarproducto']) && isset($_POST['eliminarProductoKey'])) {
    $eliminarProductoKey = $_POST['eliminarProductoKey'];

    // Elimina el producto de la cotización utilizando la clave
    if (isset($_SESSION['cotizacion'][$eliminarProductoKey])) {
        unset($_SESSION['cotizacion'][$eliminarProductoKey]);
    }
}

// Redirige de vuelta a la página de cotización
header("Location: ./cotizaciones.php");
