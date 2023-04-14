<?php

$x=$_GET['id'];
$q="delete from agenda where id=$x";

include('libreria.php');
$w=ejecutar($q);

if ($w) {
    header('location: listado.php');
} else {
    echo "Error al BORRAR: <br>";
    echo $sql;
    echo "<br><br>";
    echo "<a href='listado.php'>Regresar</a>";
}
