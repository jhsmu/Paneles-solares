<?php
    //Para poder usar la clase Database y su función connect
    require('../database/basededatos.php');

    //Creamos un objeto del tipo Database
    $db = new Database();
    $connection = $db->connect(); //Creamos la conexión a la BD

    if (isset($_POST['id'])) {
        $id = $_POST['id'];

        //Consultamos para obtener las imagenes
        $consulta3 = $connection->prepare('SELECT * FROM imagenes WHERE producto_id=?');
        $consulta3->execute([$id]);
        $imagenes = $consulta3->fetchAll(PDO::FETCH_ASSOC);

        //Validación de archivos
        foreach ($_FILES['imagen']['tmp_name'] as $key => $value) {
            
            $imagenActual = $imagenes[$key]["url"];
	
            $imgFile = $_FILES['imagen']['name'][$key];
            $tmp_dir = $_FILES['imagen']['tmp_name'][$key];
            $imgSize = $_FILES['imagen']['size'][$key];
    
            $upload_dir = '../imagenes/'; // upload directory
        
            $imgExt = strtolower(pathinfo($imgFile,PATHINFO_EXTENSION)); // get image extension
            
            // valid image extensions
            $valid_extensions = array('jpeg', 'jpg', 'png', 'gif', 'webp'); // valid extensions
            
            // rename uploading image
            $userpic = $imgFile;

            if (empty($imgFile)){
                continue;
            } else {
                    
                // allow valid image file formats
                if(in_array($imgExt, $valid_extensions)){			
                    // Check file size '1MB'
                    if($imgSize < 1500000){
                        unlink($upload_dir . $imagenActual);
                        move_uploaded_file($tmp_dir, $upload_dir . $userpic);
                        $editar=$connection->prepare('UPDATE imagenes SET url=:ruta WHERE id_imagenes=:id');
                        $editar->bindParam(':ruta', $userpic);
                        $editar->bindParam(':id', $imagenes[$key]["id_imagenes"]);
                        $editar->execute();
                    }
                    else{
                        header("location:../admin/actualizarProducto.php?id=".$_POST["id"]."&error2=Su archivo es muy grande.");
                        die();
                    }
                }
                else{
                    header("location:../admin/actualizarProducto.php?id=".$_POST["id"]."&alerta2=Solo archivos JPG, JPEG, PNG, GIF & WEBP son permitidos.");
                    die();		
                }

            }
            
        }

        
        $serial=$_POST["serial"];
        $producto=$_POST["producto"];
        $descripcion=$_POST["descripcion"];
        $caracteristicas=$_POST["caracteristicas"];
        $cantidad=$_POST["cantidad"];
        $precio=$_POST["precio"];
        $id_categoria=$_POST["categoria"];
        $estado=$_POST["estado"];
        
        try {
            $query = $connection->prepare("UPDATE producto SET producto=?, descripcion=?, caracteristicas=?, cantidad=?, precio=?, id_categoria=?, estado_producto=? WHERE id_producto=?");// Traduzco mi petición
            $actualizar = $query->execute([$producto, $descripcion, $caracteristicas, $cantidad, $precio, $id_categoria, $estado, $id ]); //Ejecuto mi petición
        } catch (\Throwable $th) {
            session_start();
            $_SESSION["error3"]="Producto existente";
            header("location: ../admin/actualizarProducto.php?id=".$id."");
            die();
        }

        if ($actualizar) {
            session_start();
            $_SESSION['actualizar_producto'] = 'registro';
            header("location: ../admin/productos.php");
        } else {
            session_start();
            $_SESSION['actualizar_error'] = 'registro';
            header("location: ../admin/productos.php");
        }
    }
?>