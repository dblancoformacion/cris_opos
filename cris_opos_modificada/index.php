<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Document</title>

    <?php 

        include_once "libreria.php";
        if(!isset($_GET['t_ini'])||$_GET['t_ini']<1) $_GET['t_ini']=1;
        if(!isset($_GET['t_fin'])||$_GET['t_fin']<1) $_GET['t_fin']=24;
        if(!isset($_GET['n'])||$_GET['n']<1) $_GET['n']=0;



        sql2js('temas','cris_opos',"
            SELECT n_tema,CONCAT('Tema ',n_tema,': ',tema)tema FROM temas;            
            ");

        sql2js('datos','cris_opos',"
            SELECT * FROM preguntas
                WHERE tema BETWEEN ".($_GET['t_ini']*1)." AND ".($_GET['t_fin']*1)."
                ORDER BY RAND() LIMIT ".($_GET['n']*1).";
            ");

    ?>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="1.css">
    
    <script type="text/javascript" src="1.js"></script>
    
</head>

<body>
    <div class="wrapper">
       <div class="izquierda"> <form>
               <div class="temas">
                   <h1>ENTRENADOR AUXILIAR ADMINISTRATIVO GOBIERNO DE CANTABRIA</h1>
                  <label>Del tema:</label> <input type="text" name="t_ini" >
                  <label>al tema:</label><input type="text" name="t_fin">
                  <label>Nº de preguntas</label><input type="number" name="n" >
                  <input type="submit" name="ir" id="ir" value="Elegir">
                  <div class="cronometro">
                      <div class="digitos" id="h1"></div>
                       <div class="digitos" id="h0"></div>
                       <div class="separador">:</div>
                       <div class="digitos" id="m1"></div>
                       <div class="digitos" id="m0"></div>
                       <div class="separador">:</div>
                       <div class="digitos" id="s1"></div>
                       <div class="digitos" id="s0"></div>
                  </div>
               </div>
               </form>
               <form>
                   <ul>
                       
                   </ul>
                   <input type="button" name="enviar" value="Corregir" id="boton">
               </form>
           </div>
           <div class="mostrarSoluciones">
               <div class="cerrar"><a href="index.php" title=""><i class="fa fa-window-close" aria-hidden="true"></i></a></div>
               <div class="sol"></div>
           </div>
           <div class="derecha">
               <h2>TEST POR TEMAS</h2>
               <ul>
               </ul>
           </div>
    </div>
</body>

</html>