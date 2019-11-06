
$(function(){
	var numeroAg = 1;

$("#finalizar").on("click",function(){
	$(location).attr('href',"elejir.html");
});

$("#agregar").on('click',function(){

  numeroAg++;
  $("#mostrar").html(numeroAg); //mostramos el # de pregunta agregada
  var principal = $("#principal").val(); //optenemos el valor de la pregunta
  var correcta = $("#correcta").val(); //obtenemos el valor de la respuesta correcta
  var opU = $("#opU").val(); //el valor de la respuesta incorrecta
  var opD = $("#opD").val(); //el valor de la respuesta opcional Uno
  var opT = $("#opT").val(); //el valor de la respuesta opcional Dos
  var time = $("#segundos").val();

	if ((principal  && correcta && opU &&time) == "") {
		alert("Datos requeridos vacios");
	} else if((principal || correcta || opU || time ) == ""){
		alert("Algunos datos requedidos estan vacios");
	}else{
  $.ajax({ //se manda a llamar el metodo ajax
		url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
		type: 'POST', //metodo de envio
		data:{ //datos a enviar
		  'preguntas': 1, //este sirve unicamente para validar que se envia a una funcion especifica
		  'principal': principal,
		  'correcta': correcta,
		  'opU': opU,
		  'opD': opD,
		  'opT': opT,
			'tiempo': time
		},
		success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta

		}
	  });
}//fin del  else
    $('.form')[0].reset(); //Esta funcion sirve para que el formulario se vacie

}); // fin del metodo crear


/*
$.ajax({
	  url: 'conexiones/conexion.php',
	  type: 'POST',
	  data: {
		'validar': 1,
		'nombre': nombre,
		'pass': pass
	  },
	  success: function(response){
		alert(response);
	  }
	});
*/

}); //fin de la funcion raiz
