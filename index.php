<!doctype html>
<html lang="en">
  <head>
    <script type="text/javascript" src="1.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Oposiciones</title>
    <?php 

        include_once "libreria.php";
        if(!isset($_GET['t_ini'])||$_GET['t_ini']<1) $_GET['t_ini']=1;
        if(!isset($_GET['t_fin'])||$_GET['t_fin']<1) $_GET['t_fin']=$_GET['t_ini'];
        if(!isset($_GET['n'])||$_GET['n']<1) $_GET['n']=0;



        sql2js('temas','cris_opos_nuevo',"
                      SELECT id_tema,CONCAT('Tema ',n_tema,': ',tema) tema 
                        FROM (SELECT id_tema, n_tema,temas.tema FROM incluyen
                                JOIN 
                                temas
                                ON
                                 incluyen.tema=id_tema
                                WHERE oposicion=1)c1;
            ");

        sql2js('datos','cris_opos_nuevo',"
            SELECT * FROM preguntas
                WHERE tema BETWEEN ".($_GET['t_ini']*1)." AND ".($_GET['t_fin']*1)."
                ORDER BY RAND() LIMIT ".($_GET['n']*1).";
            ");

    ?>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="1.css">
    
    <script type="text/javascript" src="1.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

  </head>
  <body>
    
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <div class="container mt-2 mt-sm-4 p-3 bg-primary text-white">
              <nav class="navbar m-2 navbar-expand-lg navbar-dark bg-info" >
            <a class="navbar-brand" href="#">Entrenador Auxiliar administrativo</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Test por temas
        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                           <!--  lo meto por JS -->
                        </div>
                    </li>
                    
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </nav>
    </div>
    <div class="jumbotron text-primary">
            <h1 class="display-4">ENTRENADOR AUXILIAR ADMINISTRATIVO GOBIERNO DE CANTABRIA</h1>
</div>

<div class="card-deck text-primary">
            <div class="card">
              
               
            </div>
        </div>



    
  </body>
</html>