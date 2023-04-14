<?php

include('libreria.php');


$query="select * from agenda";
$registros=consultar($query);

var_dump($registros);