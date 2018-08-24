window.addEventListener('load', () => {

    /* Declaro las variables */
    var correctas = [];
    var preguntas = [];
    var res = [];
    var aciertos = 0;
    var vacias = 0;
    var fallos = 0;
    var cont = 0;

    var v = document.querySelector('ul');
    /* Fin declaración de variables */



    for (var i = 0; i < datos.length; i++) {
        correctas[i] = datos[i].respuesta;
        preguntas[i] = '.preg' + datos[i].id_pregunta;
        v.innerHTML += '<li><div class="' + preguntas[i] + '"><p>' + datos[i].pregunta + '</p><ul><li><input type="radio" name="p' + [i + 1] + '" value="1" class="p' + [i + 1] + '" ><label class="c' + [i + 1] + '" for="p' + [i + 1] + '">' + datos[i].op1 + '</label></li><li><input type="radio" name="p' + [i + 1] + '" value="2" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="p' + [i + 1] + '">' + datos[i].op2 + '</label></li><li><input type="radio" name="p' + [i + 1] + '" value="3" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="p' + [i + 1] + '">' + datos[i].op3 + '</label></li><li><input type="radio" name="p' + [i + 1] + '" value="4" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="p' + [i + 1] + '">' + datos[i].op4 + '</label></li></ul></div></li>';
        correctas[i] = datos[i].respuesta;
    }

    if (datos.length > 0) {
        document.querySelector("#boton").style.opacity = 1;
       
    }
     

    /* ************************** Función envía **************************  */
    document.querySelector("#boton").addEventListener("click", () => {
        var cuenta = 0;
        var longitud = preguntas.length;
        //leer(preguntas);
        leer();
        corregir(correctas, res);
        var puntuacion = (aciertos * (10 / longitud) - fallos * 0.5 * (10 / longitud)); // calcula la puntuación: acierto +1 fallo -0.5

        document.querySelector(".sol").innerHTML = "Contestadas: " + (aciertos + fallos) + "<br>" + "Aciertos: " + aciertos + "<br>" + " Fallos: " + fallos + "<br>" + " Preguntas en blanco: " + vacias + "<br>" + "Puntuación: " + puntuacion
        document.querySelector(".mostrarSoluciones").style.opacity = 1; // muestro la ventana
        cuenta++;
        console.log(cuenta);

        if (cuenta > 1) {
            res = [];
        };
    });



    /* Fin función envía */




    /* ************************** Función leer************************** */
    // puedo prescindir del array con las clases
    function leer() {
        var contestado = 0;

        for (i = 0; i < datos.length; i++) {
            var cajas = document.querySelectorAll(".p" + (i + 1)); // le sumo 1 porque las id empiezan en 1 y la i que es el contador en 0
            for (var j = 0; j < cajas.length; j++) {
                if (cajas[j].checked) {
                    res.push(cajas[j].value);
                    contestado = 1;
                }
            }
            if (contestado == 0) {
                res.push("blanco");
            }
            contestado = 0;
        }
        console.log(res);
        console.log(cajas);
    }

    /* Fin función leer  */

    /* ************************** Función que corrige las respuestas **************************  */
    function corregir(corr, resp) {
        var v;
        var cont;
        var selector;
        var sel2;
        var listanodos = 0;
        for (i = 0; i < corr.length; i++) {
            selector = ".c" + [i + 1];
            v = parseInt(document.querySelector(selector).value = corr[i]);
            cont = parseInt(document.querySelector(selector).value = resp[i]);

            listanodos = document.querySelectorAll("li>" + selector);

            /* Si acierta la pregunta */
            if (corr[i] == resp[i]) {
                aciertos++;
                listanodos[v - 1].style.backgroundColor = "#ABEBC6";
                /* Si la deja en blanco*/
            } else if (resp[i] == "blanco") {
                vacias++;
                listanodos[v - 1].style.backgroundColor = "red";
            } else { /* Si falla */
                fallos++;
                listanodos[v - 1].style.backgroundColor = "#ABEBC6";
                listanodos[v - 1].style.fontWeight = "bold";
                listanodos[cont - 1].style.backgroundColor = "red";
            }

        }
    }
    /* Fin función corregir */


    /* ************************** Temporizador ************************** */

    function temporizador() {
        setTimeout(function() {
            alert("Fin del tiempo");
        }, 100000);
    }

    /* fin del temporizador */


});