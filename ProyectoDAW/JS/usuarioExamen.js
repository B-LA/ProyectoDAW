
  $(function(){

    function agregarPreguntas(){
      console.log("Hola mundo");
      $.ajax({ //se manda a llamar el metodo ajax
        url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
        type: 'POST', //metodo de envio
        data:{ //datos a enviar
          'codigo': 1, //este sirve unicamente para validar que se envia a una funcion especifica
        },
        success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta
            console.log(response[0].codigo_examen);
                for (let i = 0; i <  Object.keys(response).length; i++) { ///sirve para iterar la respuesta

                    //Esta funcion sirve para agregar los cuestionarios a crear en una tabla
                    document.getElementById("datos").insertRow(-1).innerHTML ='<tr>\n' +
                        '  <input id="seleccionado" name="seleccion" type="radio" value="'+response[i].codigo_examen+'" /> \n'+
                        '            <th>'+response[i].codigo_examen+'</th>\n' +
                        '          </tr>';
                }
                }
        });
    }

    agregarPreguntas();


    ////////////////////Funcion agregar test
  $("#agregar").on('click', function() {
    usuario = $('#nameUsr').val();
    codigo_examen = $('input:radio[name=seleccion]:checked').val(); //se obtienee el valor de un input radio para saber si a sido seleccionado

    if (usuario == "" || codigo_examen == "") { //se valida que los parametros no esten vacios
      alert("Los valores estam vacios")
    }else {
      $.ajax({ //se manda a llamar el metodo ajax
        url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
        type: 'POST', //metodo de envio
        data:{ //datos a enviar
          'definir_usuario': 1, //este sirve unicamente para validar que se envia a una funcion especifica
          'usuario': usuario,
          'codigo_examen': codigo_examen
        },
        success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta
            console.log(response);
        }

    });

    }


});

  ///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
  $("#finalizar").on('click',function() {
      $(location).attr("href","elejir.html"); //se redirecciona a la pagina especifica
    })

});
