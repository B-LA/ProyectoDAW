<?php

$user = "root";
$pass = "";
$objetoPDO = new PDO('mysql:host=localhost;dbname=TallerDaw', $user, $pass);
if (!$objetoPDO) {
  die('Connection failed ');
}
if(isset($_POST['validar'])){
    $name = $_POST['nombre'];
  	$passw = $_POST['pass'];
    $consulta = "select id from administrador were nombre = ? and pass = ?";
    $resultado = $objetoPDO->prepare($consulta);
    $resultado->execute([$name,$passw]);
    $resultados = $resultado->fetchAll();
    if (isset($resultados)) {
      echo "Bienvenido";
    }
}
if(isset($_POST['preguntas'])){//valida que el parametro no este vacio
  $principal = $_POST['principal']; //se guarda el parametro enviado por post
  $correcta = $_POST['correcta'];//se guarda el parametro enviado por post
  $opU = $_POST['opU'];//se guarda el parametro enviado por post
  $opD = $_POST['opD'];//se guarda el parametro enviado por post
  $opT = $_POST['opT'];//se guarda el parametro enviado por post
  $tiempo = $_POST['tiempo'];//se guarda el parametro enviado por post

  $consulta = "insert into preguntas values(?,?,?,?,?,?,?)"; //Se crea una consulta a la base de datos
  $resultado = $objetoPDO->prepare($consulta); //Esta es una funcion de PDO para preparar la consulta para obtener valores
  $resultado->execute([null,$principal,$opU,$opD,$opT,$correcta,$tiempo]); //Se ejecuta la consulta pero al mismo tiempo se le pasan las variables capturada

  echo "Agregada"; //Se retorna un mensaje para saber si se ejecuto la consulta y este bloque de codigo

}
if(isset($_POST['tabla'])){//valida que el parametro no este vacio

  $usuario = $_POST['usuario'];
  $consultaUno = "SELECT codigo_examen FROM usuario where nombre = ?"; //se crea una consulta sql
  $resultadoUno = $objetoPDO->prepare($consultaUno); //Se prepara la consulta
  $resultadoUno->execute([$usuario]); //Se pasa el parametro de usuario
  $resultadosU = $resultadoUno->fetchAll(); //se obtienen todos los datos de la consulta en un avariable
  $variableDos; //se crea una nueva variabe
  foreach ($resultadosU as $key) { //se iteran los resultados
    $variableDos = $key['codigo_examen']; //se obtiene el valor especifico de la consulta
  }
  //var_dump($variableDos);
  $consultaDos = "SELECT id_pregunta FROM cuestionario WHERE codigo_examen = ?"; //se crea otra consulta
  $resultadoDos = $objetoPDO->prepare($consultaDos); //se prepara la consulta
  $resultadoDos->execute([$variableDos]); //se pasa la variable a la consulta
  $resultadosD = $resultadoDos->fetchAll();//se obtienen todos los datos de la consulta en un avariable

  $codigos = array();//se crea una nueva variabe
  foreach ($resultadosD as $key) {//se iteran los resultados
    array_push($codigos,$key['id_pregunta']);//se obtiene el valor especifico de la consulta
  }
  $array = array();//se crea una nueva variabe
  $consultaTres = "SELECT * FROM preguntas where id_pregunta = ?";//se crea otra consulta
  $resultadoTres = $objetoPDO->prepare($consultaTres); //se prepara la consulta
  for ($i=0; $i < count($codigos) ; $i++) {//se iteran los resultados
    //echo $codigos[$i]."Valores";
    $resultadoTres->execute([$codigos[$i]]);//Se pasa el dato especifico de la posicion especifica
    $resultadosT = $resultadoTres->fetchAll(); //Se optienen los datos de la consulta

    foreach ($resultadosT as $key) { //se iteran los datos optenidos
         array_push($array, array(
          'pregunta' => $key['pregunta'],
          'respuestaUno' => $key['respuestaUno'],
          'respuestaDos' => $key['respuestaDos'],
          'respuestaTres' => $key['respuestaTres'],
          'respuestaCorrecta' => $key['respuestaCorrecta'],
          'tiempo' => $key['tiempo']
        )); ///se agregan los datos a ua variable especifica
      }


  }
  ///////////////////Esto es necesaio para convertir a los datos en formato JSON
    header('Content-Type: application/json');
    $valor = json_encode($array,JSON_FORCE_OBJECT); //Se convierte el ARRAY

    echo $valor; //se envia el array
  }
  if (isset($_POST['contar'])) {
    $codigo_examen = $_POST['codigo_examen'];//Se optiene el codigo del examen
    $conjunto = json_decode($_POST['array']); //se convierte a array el json enviado
    $consulta = "insert into cuestionario values (?,?,?)"; //se crea la consulta
    //$resultado = $objetoPDO->prepare($consulta);
      $array = array(); //se crea una variable array
      foreach ($conjunto as $key) { //se itera el conjunto de valores
          array_push($array,$key); //se guardan en un array nuevo
      }

    foreach ($array as $key) {// se itera el array
        $resultado = $objetoPDO->prepare($consulta);//Se prepara la consulta
        $resultado->execute([null,$codigo_examen,$key]); //se ejecuta
    }

    echo "Examen agregado satisfactoriamente";
  }else if (isset($_POST['codigo'])) {
    $consulta = "SELECT DISTINCT codigo_examen from cuestionario";
    $resultado = $objetoPDO->prepare($consulta);
    $resultado->execute();
    $resultados = $resultado->fetchAll();
    $array = array();
    foreach ($resultados as $key) {
       array_push($array, array(
        'codigo_examen' => $key['codigo_examen']
      ));
    }
    header('Content-Type: application/json');
    $valor = json_encode($array, JSON_FORCE_OBJECT);

    echo $valor;
  }
if (isset($_POST['definir_usuario'])) {// este metodo unicamente crea un susaurio con un codigo de examen
  $usuario = $_POST['usuario'];
  $codigo_examen = $_POST['codigo_examen'];
  $consulta = "INSERT INTO usuario VALUES (?,?,?)";
  $resultado = $objetoPDO->prepare($consulta);
  $resultado->execute([null,$usuario,$codigo_examen]);

  echo "Guardado";
}
if(isset($_POST['tablaU'])){//este metodo solo rellena una tabla
  $consulta = "SELECT * FROM preguntas";
  $resultado = $objetoPDO->prepare($consulta);
  $resultado->execute();
  $resultados = $resultado->fetchAll();
  $array = array();
  foreach ($resultados as $key) {
     array_push($array, array(
       'id' => $key['id_pregunta'],
      'pregunta' => $key['pregunta'],
      'respuestaCorrecta' => $key['respuestaCorrecta'],
      'tiempo' => $key['tiempo']
    ));
  }
  header('Content-Type: application/json');
  $valor = json_encode($array, JSON_FORCE_OBJECT);

  echo $valor;
}


 ?>
