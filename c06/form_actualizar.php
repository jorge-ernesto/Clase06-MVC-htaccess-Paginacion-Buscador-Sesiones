<?php

//var_dump($_POST);
$a=$_POST['txtpaterno'];
$b=$_POST['txtmaterno'];
$c=$_POST['txtnombre'];
$d=$_POST['txtfnacimiento'];

$e=isset($_POST['chkestado']) ? 1 : 0;

$f=$_POST['txtid'];


$q="update agenda set paterno='$a', materno='$b', nombre='$c',";
$q.="fnacimiento='$d', activo=$e where id=$f";

include('libreria.php');
$w=ejecutar($q);
if ($w) {
    header('location: listado.php');
} else {
    echo "Error al ACTUALIZAR: <br>";
    echo $sql;
    echo "<br><br>";
    echo "<a href='listado.php'>Regresar</a>";
}
