$(function(){

  function agregarPreguntas(){
    //console.log("Hola mundo");
    $.ajax({ //se manda a llamar el metodo ajax
      url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
      type: 'POST', //metodo de envio
      data:{ //datos a enviar
        'codigo': 'uno' //este sirve unicamente para validar que se envia a una funcion especifica
      },
      success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta
      //  console.log(response);
          //console.log(JSON.stringify(response));

              for (let i = 0; i <  Object.keys(response).length; i++) { //todos los datos de la respuesta son contados

                  document.getElementById("datos").insertRow(-1).innerHTML ='<tr>\n' + //se insertan los datos en una tabla
                      '  <input id="seleccionado" name="seleccion" type="checkbox" value="'+response[i].codigo_examen+'" /> \n'+
                      '            <th>'+response[i].codigo_examen+'</th>\n'+
                      '          </tr>';


              }

              }

      });


  }

  agregarPreguntas();//se ejecuta la funcion fuera de todo


});
