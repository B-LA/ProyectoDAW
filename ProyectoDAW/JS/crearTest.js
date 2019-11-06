$(function(){

  function agregarPreguntas(){
    console.log("Hola mundo");
    $.ajax({ //se manda a llamar el metodo ajax
      url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
      type: 'POST', //metodo de envio
      data:{ //datos a enviar
        'tablaU': 1, //este sirve unicamente para validar que se envia a una funcion especifica
      },
      success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta
          console.log(response[0].id); //se muestra que los datos no sean vacios
              for (let i = 0; i <  Object.keys(response).length; i++) {

                  document.getElementById("datos").insertRow(-1).innerHTML ='<tr>\n' + //se agregan los datos a una tabla
                      '  <input id="seleccionado" name="seleccion" type="checkbox" value="'+response[i].id+'" /> \n'+
                      '            <th>'+response[i].pregunta+'</th>\n' +
                      '            <th>'+response[i].respuestaCorrecta+'</th>\n' +
                      '            <th>'+response[i].tiempo+'</th>\n' +
                      '          </tr>';
              }
              }
      });//fin del la funcion ajax
  }//fin de la funcion principal

  agregarPreguntas(); //se ejecuta la funcion al cargar la pagina

  //////////////Sirve para redireccionar automaticamente sin usar <a>
  $("#volver").on('click',function () {
    $(location).attr("href","elejir.html");//se redirige a la pagina especifica
  });

    //////////////Sirve para redireccionar automaticamente sin usar <a>
  $('#botonado').on('click',function() {
    let codigo = $("#codigo_examen").val(); //se obtiene el codigo del examen a crear

  var arr = $('#seleccionado:checked').map(function(){
    return this.value;
  }).get();
if ((codigo || arr) == "") {
  alert("Datos vacios ");
} else {
    $.ajax({
      url: 'conexiones/conexion.php', ////se agrega el url donde se envian los datos
      type: 'POST',//metodo de envio
      data:{//datos a enviar
        'contar': 1,//este sirve unicamente para validar que se envia a una funcion especifica
        'codigo_examen': codigo, ///Se manda el codigo del nuevo examen
        'array' : JSON.stringify(arr) //se conviene
      },
      success: function(data){
        alert(data);
      }
    });
  });
}////fin del else

});//fin de la funcion root
