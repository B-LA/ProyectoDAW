$(function () {


    ////////////////////////////Funcion para obtener el usuario desde la URL
    function getQueryVariable(variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable) {


                return pair[1];


            }
        }
        return false;
    }////Finaliza la funcion

     var id = getQueryVariable("id");//Guardamos el valor en una variable

    agregarPreguntas(id); //Ejecutamos la funcion

    function agregarPreguntas(){ //Inicio de la funcion
      console.log("Hola mundo");

       $.ajax({ //se manda a llamar el metodo ajax
    		url: 'conexiones/conexion.php', //se agrega el url donde se envian los datos
    		type: 'POST', //metodo de envio
    		data:{ //datos a enviar
    		  'tabla': 1, //este sirve unicamente para validar que se envia a una funcion especifica
          'usuario':id //Pasamos el parametro
    		},
    		success: function(response){ //al obtener una respuesta favorable este metodo se ejecuta
    		    console.log(JSON.stringify(response)); //Lo mostramos en consola por cualquier error
            agregarDatos(response); //se ejecuta la funcion extra
        }
    	  });

        }


        //////////////////////////Esta funcion pasa los parametros de las preguntas para agregarlas al form
    function agregarDatos(response){
      var questions = [];
      for (var i = 0; i < Object.keys(response).length; i++) { //iteramos la respuestra del ajax
        var pregunta = { //array para guardar las preguntas
              "question": response[i].pregunta,
              "option1": response[i].respuestaCorrecta,
              "option2": response[i].respuestaUno,
              "option3": response[i].respuestaDos,
              "option4": response[i].respuestaTres,
              "answer": "1"
        };
        questions.push(pregunta); //Se las pasamos al final del array creado
      }

      cuestionario(questions); //Se pasan las preguntas a otra funcion extra

    }


      ////////////////////////////////////////////Esta funcion valida las preguntas para iterarlas
    function cuestionario(questions){
      var currentQuestion = 0;
      var score = 0;
      var totQuestions = questions.length;

      ////////////////////Variables
      var container = document.getElementById('testContainer');
      var questionEl = document.getElementById('pregunta');
      var op1 = document.getElementById('opt1');
      var op2 = document.getElementById('opt2');
      var op3 = document.getElementById('opt3');
      var op4 = document.getElementById('opt4');
      var nextButton = document.getElementById('next');
      var resulCont = document.getElementById('resultado');


      ////////////////////////Sirve para cargar las preguntas al form
      function loadQuestion(currentQuestion) {

          var q = questions[currentQuestion];
          questionEl.textContent = (currentQuestion + 1) + '. ' + q.question; //////Obtenemos la pregunta especififca

          op1.textContent = q.option1;
          op2.textContent = q.option2;
          op3.textContent = q.option3;
          op4.textContent = q.option4;
      }
      /////////////////////////////////////////////////Esta funcion es para cambiar a la siguiente pregunta
      $("#next").on('click', function(){
          var selectdOption = document.querySelector('input[type=radio]:checked');
          if(!selectdOption){
              alert('Seleccione una Respuesta');
              return;
          }

          var answer = selectdOption.value;
          if(questions[currentQuestion].answer == answer){
              score += 1;
          }

          selectdOption.checked = false;
          currentQuestion++;
          if(currentQuestion == totQuestions - 1){
              next.textContent = 'Finalizar';
          }
          if(currentQuestion == totQuestions){
              /////////////////////////////Los estilos se vuelven vacios para mostrar los aciertos de las preguntas
              container.style.display = 'none';
              resulCont.style.display = '';
              resulCont.style.marginTop = '20%';
              resulCont.textContent ='Acerto ' + score + ' Preguntas';
              return;
          }
          loadQuestion(currentQuestion);
      }
    );

      loadQuestion(currentQuestion);
      }

    }////fun de la funcio

//   agregarPreguntas();



/*
    var questions = [{
        "question": "La primera guerra mundial sucedió entre los años",
        "option1": "1914-1918",
        "option2": "1970-1918",
        "option3": "1914-2000",
        "option4": "1914-2000",
        "answer": "1"
    },
*/

});
