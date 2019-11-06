$(function(){

  var nombre = $("#nombre").val();
  var pass = $("#pass").val();

///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
$("#hacer").on("click",function(){
    var usuario = $("#usuarioD").val();
    if(usuario == ""){ //valida que el usuario no este vacio para hacer el examen
      alert("El usuario no puede ser vacio");
    }else {
    $(location).attr("href","test.html?id="+usuario);//se redirecciona a la pagina especifica con la unica variante que esta manda el nombre de usuario para el text
  }
    });

///Esta funcion sirve para desplazarse entre paginas sin usar la etiqueta <a></a>
$("#ingresar").on('click',function () {
    $(location).attr('href',"elejir.html");//se redirecciona a la pagina especifica
});

});
