<?php
include_once('libreria.php');

#registros por pagina a mostrarse
$rxp =3;

#calcular el total de registros
$q="select COUNT(*) AS cant from agenda";
$tempo=consultar($q);
$tot=$tempo[0]['cant'];

#calcular nro de paginas a mostrarse
$pag=ceil($tot/$rxp);

$ver=(isset($_GET['pag']) ? $_GET['pag'] : 1);
$inicio=($ver-1)*$rxp;

$q="select * from agenda limit $inicio,$rxp";
$data=consultar($q);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agenda</title>
</head>

<body>
    <br>
    <a href='form_nuevo.html'>Nuevo</a>
    <table border=1>
        <tr>
            <td>ID</td>
            <td>PATERNO</td>
            <td>MATERNo</td>
            <td>NOMBRE</td>
            <td>CUMPLEAÑOS</td>
            <TD>ACTIVO</TD>
            <TD>ACCIONES</TD>
        </tr>
        <?php foreach ($data as $x) { ?>
        <tr>
            <td><?=$x['id']?></td>
            <td><?=$x['paterno']?></td>
            <td><?=$x['materno']?></td>
            <td><?=$x['nombre']?></td>
            <td><?=date('d-m-Y', strtotime($x['fnacimiento']))?></td>
            <TD><?=$x['activo']?></TD>
            <td>
                <a href="form_editar.php?id=<?=$x['id']?>">Editar</a>
                <a href="borrar.php?id=<?=$x['id']?>" onclick="return confirm('Seguro de borrar?')">Borrar</a>
            </td>
        </tr>
        <?php } ?>
    </table>
    <?php
for ($w=1;$w<=$pag;$w++) {
    echo "<a href=?pag=$w>$w</a>" . '&nbsp;&nbsp;&nbsp;' ;
}
?>
</body>

</html>