<?php
    error_reporting( ~E_NOTICE ); // avoid notice
	
	include '../database/conexion.php';

    //Validación de archivos
    foreach ($_FILES['imagen']['tmp_name'] as $key => $value) { 
	
        $imgFile = $_FILES['imagen']['name'][$key];
        $tmp_dir = $_FILES['imagen']['tmp_name'][$key];
        $imgSize = $_FILES['imagen']['size'][$key];

        if(empty($imgFile)){
            header("location:../admin/productos.php?error=Archivo vacio");
            die();
        }
        else
        {
            $upload_dir = '../imagenes/'; // upload directory
    
            $imgExt = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION)); // get image extension
        
            // valid image extensions
            $valid_extensions = array('jpeg', 'jpg', 'png', 'gif', 'webp'); // valid extensions
        
            // rename uploading image
            $userpic = $imgFile;
                
            // allow valid image file formats
            if(in_array($imgExt, $valid_extensions)){			
                // Check file size '1MB'
                if($imgSize < 1500000)				{
                    continue;
                }
                else{
                    session_start();
                    $_SESSION["error"]="Su archivo es muy grande.";
                    header("location:../admin/productos.php");
                    die();
                }
            }
            else{
                session_start();
                $_SESSION["alerta"]="Solo archivos JPG, JPEG, PNG, GIF & WEBP son permitidos.";
                header("location:../admin/productos.php");
                die();		
            }
        }
        
    }

    //Definimos las variables
    $estado=1;
    $serial=$_POST["serial"];
    $producto=$_POST["producto"];
    $descripcion=$_POST["descripcion"];
    $caracteristicas=$_POST["caracteristicas"];
    $cantidad=$_POST["cantidad"];
    $precio=$_POST["precio"];
    $id_categoria=$_POST["categoria"];
    $total=$cantidad*$precio;

    try {
        //Primero agregamos el producto en la tabla producto
        $agregar=$DB_con->prepare('INSERT INTO producto(serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES(:serial, :producto, :descripcion, :caracteristicas, :cantidad, :precio, :categoria, :estado_producto)');
        $agregar->bindParam(':serial', $serial);
        $agregar->bindParam(':producto', $producto);
        $agregar->bindParam(':descripcion', $descripcion);
        $agregar->bindParam(':caracteristicas', $caracteristicas);
        $agregar->bindParam(':cantidad', $cantidad);
        $agregar->bindParam(':precio', $precio);
        $agregar->bindParam(':categoria', $id_categoria);
        $agregar->bindParam(':estado_producto', $estado);
        $agregar->execute(); 
    } catch (\Throwable $th) {
        session_start();
        $_SESSION["error2"]="Producto existente";
        header("location:../admin/productos.php");
        die();
    }
    

    $idProducto=$DB_con->lastInsertId();


    foreach ($_FILES['imagen']['tmp_name'] as $key => $value) { 
	
        $imgFile = $_FILES['imagen']['name'][$key];
        $tmp_dir = $_FILES['imagen']['tmp_name'][$key];
        $imgSize = $_FILES['imagen']['size'][$key];

        if(empty($imgFile)){
            $errMSG = "Seleccione el archivo de imagen.";
        }
        else
        {
            $upload_dir = '../imagenes/'; // upload directory
    
            $imgExt = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION)); // get image extension
        
            // valid image extensions
            $valid_extensions = array('jpeg', 'jpg', 'png', 'gif', 'webp'); // valid extensions
        
            // rename uploading image
            $userpic = $imgFile;
                
            // allow valid image file formats
            if(in_array($imgExt, $valid_extensions)){			
                // Check file size '1MB'
                if($imgSize < 1000000)				{
                    move_uploaded_file($tmp_dir,$upload_dir.$userpic);
                }
                else{
                    $errMSG = "Su archivo es muy grande.";
                }
            }
            else{
                $errMSG = "Solo archivos JPG, JPEG, PNG, GIF & WEBP son permitidos.";		
            }
        }
        
        
        // if no error occured, continue ....
        if(!isset($errMSG))
        {
            $agregar=$DB_con->prepare('INSERT INTO imagenes(producto_id, url) VALUES(:producto, :ruta)');
            $agregar->bindParam(':producto', $idProducto);
            $agregar->bindParam(':ruta', $userpic);
            $agregar->execute();
        }
    }


    $compra=$DB_con->prepare('INSERT INTO compra( id_producto, cantidad, precio, total) VALUES(:producto, :cantidad, :precio, :total)');
    $compra->bindParam(':producto', $idProducto);
    $compra->bindParam(':cantidad', $cantidad);
    $compra->bindParam(':precio', $precio);
    $compra->bindParam(':total', $total);

    if ($compra->execute()) {
        session_start();
        $_SESSION["producto"]="Registro correcto";
        header("location:../admin/productos.php");
    } else {
        session_start();
        $_SESSION["producto_error"]="Registro";
        header("location:../admin/productos.php");
    }