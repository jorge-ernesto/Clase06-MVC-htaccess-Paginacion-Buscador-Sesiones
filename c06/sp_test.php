<?php

include('libreria.php');
$dato=8;
$query="call sp_persona($dato)";

$tempo=consultar($query);
var_dump($tempo);