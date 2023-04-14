<?php

session_start();
echo session_id();

$_SESSION['curso']='PHP1';
$_SESSION['anio']=2022;
$_SESSION['aprobado']=true;
?>
<br>
<a href="sesion_02.php">Siguiente</a>