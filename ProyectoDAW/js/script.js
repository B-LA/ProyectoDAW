//AM180012
//HM172434
//LV191781
//MA191063
//RF190623
var currentQuestion = 0;
var score = 0;
var totQuestions = questions.length;

var container = document.getElementById('testContainer');
var questionEl = document.getElementById('pregunta');
var op1 = document.getElementById('opt1');
var op2 = document.getElementById('opt2');
var op3 = document.getElementById('opt3');
var op4 = document.getElementById('opt4');
var nextButton = document.getElementById('next');
var resulCont = document.getElementById('resultado');



function loadQuestion (questionIndex) {
    var q = questions[questionIndex];
    questionEl.textContent = (questionIndex + 1) + '. ' + q.question;

    op1.textContent = q.option1;
    op2.textContent = q.option2;
    op3.textContent = q.option3;
    op4.textContent = q.option4;
}

function loadNextQuestion(){
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
        container.style.display = 'none';
        resulCont.style.display = '';
        resulCont.style.marginTop = '20%';
        resulCont.textContent ='Acerto ' + score + ' Preguntas';
        return;
    }
    loadQuestion(currentQuestion);
}

loadQuestion(currentQuestion);

function obligatorio(){

    var contra = document.getElementById('conUser').value;
    var nomb = document.getElementById('nomUser').value;
    var btn = document.getElementById('reg');

    if(nomb === ""){
        alert("Seleccione un nombre");
        return false;
    }

}
