<?php

include_once "crud.php";

$objetoPDO = new $objetoPDO();

$consulta = "Select from administrador";

$resultado = $objetoPDO->query($consulta);

while($registro = $resultado->fetch()) {
    echo "NOMBRE: " . $registro['nombre'] . ", PASS: " . $registro['pass'] . "<br>";
}


 ?>
