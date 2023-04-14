<?php
$x=$_GET['id'];
//echo "Quieres ver los datos del ID: $x";

$q="select * from agenda where id=$x";

include('libreria.php');
$rpta=consultar($q);

$fila=$rpta[0];

//var_dump($fila);
//die();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EDITAR</title>
</head>

<body>
    <form action="form_actualizar.php" method="post">
        ID: <?=$fila['id']?><br>
        <input type="hidden" name="txtid" value="<?=$fila['id']?>">
        <!--<input type="text" name="txtid" value="<?=$fila['id']?>" readonly><br>-->
        Ap. Paterno: <br>
        <input type="text" name="txtpaterno" value="<?=$fila['paterno']?>" required><br>
        Ap. Materno: <br>
        <input type="text" name="txtmaterno" value="<?=$fila['materno']?>" required><br>
        Nombre: <br>
        <input type="text" name="txtnombre" value="<?=$fila['nombre']?>" required><br>
        F. Nacimiento: <br>
        <input type="date" name="txtfnacimiento" value="<?=$fila['fnacimiento']?>" required><br>
        Estado: <input type="checkbox" name="chkestado" <?=$fila['activo']==1 ? 'checked' : ''?>><br>
        <br>
        <input type="submit" value="Grabar">

    </form>
</body>

</html>