<?php

echo "Continuamos con la session<br>";
session_start();
echo $_SESSION['curso'];
?>
<br>
<a href="sesion_03.php">Siguiente</a>