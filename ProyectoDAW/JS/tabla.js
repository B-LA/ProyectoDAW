$(function () {

    function agregarPreguntas(){
      console.log("Hola mundo");
      $.ajax({ //se manda a llamar el metodo ajax
    		url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
    		type: 'POST', //metodo de envio
    		data:{ //datos a enviar
    		  'tablaU': 1, //este sirve unicamente para validar que se envia a una funcion especifica
    		},
    		success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta
    		    console.log(response);
                for (let i = 0; i <  Object.keys(response).length; i++) { ///Se optiene el numero de datos devueltos de la consulta

                    document.getElementById("datos").insertRow(-1).innerHTML ='<tr>\n' + //se aregan a la tabla
                        '            <th>'+response[i].id+'</th>\n' +
                        '            <th>'+response[i].pregunta+'</th>\n' +
                        '            <th>'+response[i].respuestaCorrecta+'</th>\n' +
                        '            <th>'+response[i].tiempo+'</th>\n' +
                        '          </tr>';


                }
              }//fin de la funcion response

    	  });


    }//fin de la funcion

    agregarPreguntas(); //Se ejecuta automaticamente la funcion

    ///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
    $("#salir").on("click",function(){
      $(location).attr('href',"index.html");//se redirecciona a la pagina especifica
    });

    ///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
    $("#agregar_p").on("click",function(){
      $(location).attr('href',"preguntas.html");//se redirecciona a la pagina especifica
    });

    ///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
    $("#test").on("click",function () {
       $(location).attr('href',"crearTest.html");//se redirecciona a la pagina especifica
    });

    ///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
    $("#def_ex").on("click",function () {
        $(location).attr('href',"usuarioExamen.html");//se redirecciona a la pagina especifica
    });
/*
    $('#botonado').on('click',function(){
      console.log($('#seleccionado:checked').val());
    alert("Hola mundo");
  });
*/
});
