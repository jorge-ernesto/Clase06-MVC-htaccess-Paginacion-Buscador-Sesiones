<?php

include('config.php');

# conjunto de funciones
# creadas por el desarrollador

$cnx='';

function conectar()
{
    #conectarser a la BD
    global $cnx;
    $cnx=mysqli_connect(HOST, USER, PASS, BASE, PORT);
    mysqli_query($cnx, 'set names utf8');
}
function desconectar()
{
    #desconectare de la BD
    global $cnx;
    mysqli_close($cnx);
}
function consultar($sql)
{
    # SELECT | Trae datos
    global $cnx;
    conectar();

    $caja=mysqli_query($cnx, $sql);

    # pasar la caja a una estructura
    $datos=array();
    while ($fila=mysqli_fetch_assoc($caja)) {
        $datos[]=$fila;
    }
    desconectar();
    return $datos;
}
function ejecutar($sql)
{
    # INSERT, UPDATE, DELETE
    # No trae datos

    global $cnx;
    conectar();
    $exito=mysqli_query($cnx, $sql);
    desconectar();
    //return $exito ? 1 : 0;
    if ($exito) {
        return 1;
    } else {
        return 0;
    }
}