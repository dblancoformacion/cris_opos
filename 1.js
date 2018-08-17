window.addEventListener('load', () => {

/*  ******************************************************** DECLARO LAS VARIABLES ********************************************************  */
    var correctas = [];
    var preguntas = [];
    var res = [];
    var aciertos = 0;
    var vacias = 0;
    var fallos = 0;
    var cont = 0;

    var v = document.querySelector('form ul');
    /* Fin declaración de variables */

/*  ********************************************************  MOSTRAR PREGUNTAS ********************************************************   */

    for (var i = 0; i < datos.length; i++) {
        correctas[i] = datos[i].respuesta;
        preguntas[i] = '.preg' + datos[i].id_pregunta;
        v.innerHTML += '<li><div class="' + preguntas[i] + '"><p>' + (i + 1) + (". ) ") + datos[i].pregunta + '</p><ul><li><input type="radio" id="f' + 1 * [i + 4] + '" name="p' + [i + 1] + '" value="1" class="p' + [i + 1] + '" ><label class="c' + [i + 1] + '" for="f' + 1 * [i + 4] + '">' + datos[i].op1 + '</label></li><li><input type="radio" id="f' + 2 * [i + 4] + '" name="p' + [i + 1] + '" value="2" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="f' + 2 * [i + 4] + '">' + datos[i].op2 + '</label></li><li><input type="radio" id="f' + 3 * [i + 4] + '" name="p' + [i + 1] + '" value="3" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="f' + 3 * [i + 4] + '">' + datos[i].op3 + '</label></li><li><input type="radio" id="f' + 4 * [i + 4] + '" name="p' + [i + 1] + '" value="4" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="f' + 4 * [i + 4] + '">' + datos[i].op4 + '</label></li></ul></div></li>';
        correctas[i] = datos[i].respuesta;
    }

    if (datos.length > 0) {
        document.querySelector("#boton").style.opacity = 1;

    }
   /* Fin mostrar preguntas en  pantalla */

/*   ******************************************************** INTRODUCIR TÍTULOS DE LOS TEMAS  ********************************************************  */
    var v1 = document.querySelector(".derecha ul");
    console.log("temas",temas);
    console.log("v1", v1);
    for (var i = 0; i < temas.length; i++) {
        v1.innerHTML += "<li><a href='?t_ini=" + temas[i].n_tema + "&t_fin=" + temas[i].n_tema + "&n=5'>"+ temas[i].tema+"</a></li>";
    }



/*  ******************************************************** SELECCIONAR LAS RESPUESTAS HACIENDO CLIC EN EL LABEL  *********************************************************/
    var enlaces = document.querySelectorAll("ul>li>div>ul>li");
    console.log("enlaces", enlaces);
    var contador = 0;

    enlaces.forEach((va) => {
        va.addEventListener("click", (event) => {
            contador++;
            /* Comenzar a contar el cronómetro (cuando empiece a hacer el test, es decir, cuando haga click en alguna respuesta) */
            if (contador == 1) {
    /* ******************************************************** CRONÓMETRO ********************************************************  */

                /* ********************** DECLARO LAS VARIABLES**********************  */
                var s0 = 1;
                var s1 = 1;
                var m0 = 1;
                var m1 = 1;
                var h0 = 1;
                var h1 = 1;


                /*  ********************** inicializo el reloj a 0.  **********************  */
                var dig = document.querySelectorAll(".digitos");
                for (var i = 0; i < dig.length; i++) {
                    dig[i].innerHTML = "0";
                }
                /* ********************** SEGUNDOS  ********************** */
                setInterval(() => {
                    document.querySelector("#s0").innerHTML = s0;
                    if(contador) s0++;
                    if (s0 == 10) {
                        s0 = 0;
                    }
                }, 1000);

                setInterval(() => {
                    document.querySelector("#s1").innerHTML = s1;
                    if(contador)s1++;
                    if (s1 == 6) {
                        s1 = 0;
                    }
                }, 10000);

                /*  **********************  MINUTOS  **********************  */
                setInterval(() => {
                    document.querySelector("#m0").innerHTML = m0;
                    if(contador)m0++;
                    if (m0 == 10) {
                        m0 = 0;
                    }
                }, 60000);

                setInterval(() => {
                    document.querySelector("#m1").innerHTML = m1;
                   if(contador) m1++;
                    if (m1 == 6) {
                        m1 = 0;
                    }
                }, 600000);

                /*  **********************  HORAS  **********************  */

                setInterval(() => {
                    document.querySelector("#h0").innerHTML = h0;
                   if(contador) h++;
                    if (h0 == 10) {
                        h0 = 0;
                    }
                }, 3600000);

                setInterval(() => {
                    document.querySelector("#h1").innerHTML = h1;
                   if(contador) h1++;
                    if (h1 == 3) {
                        h1 = 0;
                    }
                }, 36000000);

                /* ******************************************************** FIN CRONÓMETRO ********************************************************  */
            }

            var elemeto = event.target;
            var indice = elemeto.getAttribute("for");
            console.log(indice);
            document.querySelector(".cronometro").style.opacity = 1; /* LO MUESTRO CUANDO HAGA CLICK*/
  
        })

    });
/*  ******************************************************** FUNCIÓN ENVÍA  ********************************************************  */
    document.querySelector("#boton").addEventListener("click", () => {
        var cuenta = 0;
        var longitud = preguntas.length;
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




    /*  ******************************************************** FUNCIÓN LEER  ******************************************************** */
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

    /*  ******************************************************** FUNCIÓN CORREGIR ********************************************************  */
    function corregir(corr, resp) {
        var v;
        var cont;
        var selector;
        var sel2;
        var listanodos = 0;
        contador=0;
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