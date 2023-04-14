<?php

//var_dump($_POST);

$a=$_POST['txtpaterno'];
$b=$_POST['txtmaterno'];
$c=$_POST['txtnombre'];
$d=$_POST['txtfnacimiento'];
/*
if(isset($_POST['chkestado'])){
    $e=1;
}else{
    $e=0;
}
*/
$e=isset($_POST['chkestado']) ? 1 : 0;

$q="insert into agenda (paterno,materno,nombre,fnacimiento,activo) ";
$q.=" values('$a','$b','$c','$d',$e)";

include('libreria.php');
$ex=ejecutar($q);
if ($ex) {
    header('location: listado.php');
} else {
    echo "Error al insertar: <br>";
    echo $sql;
    echo "<br><br>";
    echo "<a href='listado.php'>Regresar</a>";
}