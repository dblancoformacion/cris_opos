    window.addEventListener("load",(e) => {
    /*  ******************************************************** DECLARO LAS VARIABLES ********************************************************  */
    var correctas = [];
    var preguntas = [];
      /* Meto los temas */
          /* con bootstrap */
    var v1=document.querySelector(".dropdown-menu");
    
    for(var i=0;i<temas.length;i++){
        v1.innerHTML+='<a class="dropdown-item" href="?t_ini='+temas[i].id_tema + "&t_fin=" + temas[i].id_tema + '&n=30">'+ temas[i].tema+"</a>";
    }
    
    /* Dibujo las cajas de las preguntas */

    v2=document.querySelector(".card");
    for(var i=0;i<datos.length;i++){
    	v2[i]+="<div class='card-body'></div>"
    }
    
    /* Escribo las preguntas */ 
    var v3=document.querySelectorAll(".card-body"); // llego a contenedores de preguntas

    var c=0;
    for (var i = 0; i < datos.length; i++) {
        correctas[i] = datos[i].respuesta;
        preguntas[i] = '.preg' + datos[i].id_pregunta;
        v3[i].innerHTML += '<div class="' + preguntas[i] + '"><p>' + (i + 1) + (". ) ") + datos[i].pregunta + '</p><ul><li><input type="radio" id="f' + 1 * [i + 1+c] + '" name="p' + [i + 1] + '" value="1" class="p' + [i + 1] + '" ><label class="c' + [i + 1] + '" for="f' + 1 * [i + 1+c] + '">' + datos[i].op1 + '</label></li><li><input type="radio" id="f' + 2 * [i + 1+c] + '" name="p' + [i + 1] + '" value="2" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="f' + 2 * [i + 1+c] + '">' + datos[i].op2 + '</label></li><li><input type="radio" id="f' + 3 * [i + 1+c] + '" name="p' + [i + 1] + '" value="3" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="f' + 3 * [i + 1+c] + '">' + datos[i].op3 + '</label></li><li><input type="radio" id="f' + 4 * [i + 1+c] + '" name="p' + [i + 1] + '" value="4" class="p' + [i + 1] + '"><label class="c' + [i + 1] + '" for="f' + 4 * [i + 1+c] + '">' + datos[i].op4 + '</label></li></ul></div>';
        correctas[i] = datos[i].respuesta;
         c+=4;

    }

    });

 