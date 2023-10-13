<?php

$dbname="quibdosolar";
$dbuser="root";
$dbhost="localhost";
$dbpass="root";

$conexion=mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

try{
    $DB_con = new PDO("mysql:host={$dbhost};dbname={$dbname};charset=UTF8",$dbuser,$dbpass);
    $DB_con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }
  catch(PDOException $e){
    echo $e->getMessage();
  }

?>
