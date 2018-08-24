DROP DATABASE if EXISTS cris_opos;
CREATE DATABASE cris_opos;
USE cris_opos;

CREATE TABLE cuerpos(
  id_cuerpo int AUTO_INCREMENT,
  administracion varchar(255),
  cuerpo varchar(255),
  PRIMARY KEY(id_cuerpo)
  );

INSERT INTO cuerpos(administracion,cuerpo) VALUES
  ('General','Cuerpo T�cnico Superior.'),
  ('General','Cuerpos de Gesti�n.'),
  ('General','Cuerpo Administrativo.'),
  ('General','Cuerpo General Auxiliar.'),
  ('General','Cuerpo General Subalterno.'),
  ('Especial','Cuerpo Facultativo Superior.'),
  ('Especial','Cuerpo de Letrados.'),
  ('Especial','Cuerpo Superior de Inspectores de Finanzas de Cantabria.'),
  ('Especial','Cuerpo T�cnico de Finanzas de Cantabria.'),
  ('Especial','Cuerpo de Diplomados y T�cnicos Medios.'),
  ('Especial','Cuerpo de T�cnicos Auxiliares.'),
  ('Especial','Cuerpo de T�cnicos Auxiliares del Medio Natural.'),
  ('Especial','Cuerpo de T�cnicos Auxiliares de Seguridad y Vigilancia.'),
  ('Especial','Cuerpo de Agentes del Medio Natural.'),
  ('Especial','Cuerpo de Agentes de Seguridad.');
  
CREATE TABLE instituciones(
  id_institucion int AUTO_INCREMENT,
  institucion varchar(255),
  PRIMARY KEY(id_institucion)
  );
  INSERT INTO instituciones (institucion) VALUES
  ('Gobierno de Cantabria'),
  ('Ayuntamiento de Santander'),
  ('Ministerio de Administraci�n P�blica');

CREATE TABLE cursos(
  id_curso int AUTO_INCREMENT,
  cuerpo int,
  institucion int,
  FOREIGN KEY (cuerpo) REFERENCES cuerpos(id_cuerpo),
  FOREIGN KEY(institucion) REFERENCES instituciones(id_institucion),
  PRIMARY KEY(id_curso)
  );

INSERT INTO cursos(cuerpo,institucion) VALUES
  (4,1);


CREATE TABLE temas(
  id_tema int AUTO_INCREMENT,
  n_tema int NOT NULL,
  tema varchar(255),
  INDEX(n_tema),
  PRIMARY KEY(id_tema)
  );

INSERT INTO temas(n_tema,tema) VALUES
  (1,'La Constituci�n Espa�ola de 1978.'),
  (2,'La Corona. '),
  (3,'Las Cortes Generales'),
  (4,' El Gobierno y la Administraci�n.'),
  (5,'La organizaci�n territorial del Estado.'),
  (6,'La Uni�n Europea.'),
  (7,'El Poder Judicial y el Tribunal Constitucional.'),
  (8,'Antecedentes hist�ricos de la Comunidad Aut�noma de Cantabria.'),
  (9,'El Estatuto de Autonom�a para Cantabria.'),
  (10,'Los �rganos de gobierno y administraci�n de la Comunidad Aut�noma de Cantabria.'),
  (11,'Las fuentes del derecho.'),
  (12,'El acto administrativo.'),
  (13,'El procedimiento administrativo com�n: Fases. Interesados.'),
  (14,'Nulidad y anulabilidad. Revisi�n. Recursos.'),
  (15,'El personal al servicio de la Administraci�n de la Comunidad Aut�noma de Cantabria.'),
  (16,'TREBEP.'),
  (17,'La Seguridad Social.'),
  (18,'Concepto de inform�tica.'),
  (19,'Estructura y almacenamiento de datos.'),
  (20,'La documentaci�n administrativa.'),
  (21,'El Manual de Atenci�n al Ciudadano y la Carta de Derechos de la Ciudadan�a.'),
  (22,'Transparencia, acceso a la informaci�n p�blica y normas de buen gobierno.'),
  (23,'P.R.L.'),
  (24,'Igualdad. Violencia de g�nero. Discapacidad y dependencia');


CREATE TABLE incluyen (
  curso int,
  tema int,
  FOREIGN KEY(curso) REFERENCES cursos(id_curso),
  FOREIGN KEY(tema) REFERENCES temas(id_tema),
  PRIMARY KEY(curso,tema)
  );
INSERT INTO incluyen(curso,tema) VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (1,5),
  (1,6),
  (1,7),
  (1,8),
  (1,9),
  (1,10),
  (1,11),
  (1,12),
  (1,13),
  (1,14),
  (1,15),
  (1,16),
  (1,17),
  (1,18),
  (1,19),
  (1,20),
  (1,21),
  (1,22),
  (1,23),
  (1,24);


CREATE TABLE preguntas(
  id_pregunta int AUTO_INCREMENT,
  pregunta text,
  op1 text,
  op2 text,
  op3 text,
  op4 text,
  respuesta int,
  tema int,
  FOREIGN KEY (tema) REFERENCES temas(n_tema),
  PRIMARY KEY(id_pregunta)
  ); 
INSERT INTO preguntas (pregunta, op1, op2, op3, op4, respuesta,tema)
  VALUES (
  '(99/2003) Si varios ordenadores est�n conectados en red pueden (se�alar la respuesta incorrecta)',
  'Conectarles con un ordenador que no est� dentro de la red',
  'Compartir un esc�ner',
  'Compartir una impresora',
  'Compartir informaci�n entre ellos',
  1,18),(
  '(100/2003) En t�rminos inform�ticos �Que es una carpeta?',
  'Un documento de texto',
  'Espacio del disco duro de un ordenador destinado a almacenar informaci�n del usuario',
  'Una p�gina de una hoja de calculo',
  'Una parte de la base de datos',
  2,18),(
  '(85/2007) Durante su ejecuci�n, un programa reside en:',
  'En la pantalla del ordenador',
  'La memoria principal del ordenador',
  'El bus',
  'El disco duro',
  2,18),(
  'Se�ala la correcta:',
  'los poderes p�blicos est�n sujetos a la Constituci�n y al resto del ordenamiento jur�dico',
  'los ciudadanos est�n sujetos a la Constituci�n y al resto del ordenamiento jur�dico',
  'los ciudadanos y los poderes p�blicos est�n sujetos a la Constituci�n',
  'los ciudadanos y los poderes p�blicos est�n sujetos a la Constituci�n y al resto del ordenamiento jur�dico',
  4,1),(
  'Regular� las bases de la organizaci�n militar conforme a los principios de la presente Constituci�n:',
  'una ley org�nica',
  'un decreto ley',
  'una norma con rango de ley',
  'una ley de bases',
  1,1),(
  'La bandera de Espa�a est� formada por:',
  'tres franjas horizontales, roja, amarilla y roja, siendo la amarilla de doble anchura que cada una de las rojas',
  'tres franjas horizontales, amarilla, roja y amarilla, siendo la roja la mitad que cada una de las amarillas',
  'tres franjas horizontales, roja, amarilla y roja, siendo la amarilla la mitad que cada una de las rojas',
  'tres franjas horizontales, amarilla, roja y amarilla, siendo la roja de doble anchura que cada una de las amarillas',
  1,1),(
  'Tiene como misi�n garantizar la soberan�a e independencia de Espa�a, defender su integridad territorial y el ordenamiento constitucional:',
  'el Gobierno',
  'el Jefe de Estado',
  'los tribunales',
  'las Fuerzas Armadas',
  4,1),(
  'La forma pol�tica del Estado espa�ol es:',
  'la Monarqu�a parlamentaria',
  'la soberan�a nacional',
  'el pluralismo pol�tico',
  'la sociedad democr�tica',
  1,1),
  (
  'El Jefe de Estado es',
  'el Rey',
  'el Presidente del Gobierno',
  'el Presidente del Congreso',
  'el Defensor del Pueblo',
  '1',
  '2'
  ),
  (
  'Extinguidas todas las l�neas llamadas en Derecho, proveer� a la sucesi�n en la Corona en la forma que m�s convenga a los intereses de Espa�a:',
  'el Congreso de los Diputados',
  'el Senado',
  'las Cortes Generales',
  'el Presidente del Gobierno',
  '3',
  '2'
  ),
  (
  'Las abdicaciones y renuncias y cualquier duda de hecho o de derecho que ocurra en el orden de sucesi�n a la Corona se resolver�n:',
  'mediante Decreto-Ley',
  'por Ley Org�nica',
  'por el Presidente del Gobierno',
  'mediante refer�ndum',
  '2',
  '2'
  ),
  (
  'Para ejercer la Regencia es preciso:',
  'ser espa�ol de nacimiento y mayor de 21 a�os',
  'ser espa�ol y mayor de edad',
  'ser espa�ol de nacimiento y mayor de edad',
  'ser espa�ol y mayor de 21 a�os',
  '2',
  '2'
  ),

(
  'Corresponde aprobar los Presupuestos del Estado a:',
  'el Rey',
  'las Cortes Generales',
  'el Congreso de los Diputados',
  'el Presidente del Gobierno',
  '2',
  '3'
  ),
(
  'Se�ala la correcta:',
  'nadie podr� ser miembro de las dos C�maras simult�neamente',
  'es compatible el acta de una Asamblea de Comunidad Aut�noma con la de Diputado al Congreso',
  'los miembros de las Cortes Generales estar�n ligados por mandato imperativo',
  'las reuniones de Parlamentarios que se celebren sin convocatoria reglamentaria vincular�n a las C�maras',
  '1',
  '3'
  ),
(
  'Dirige la pol�tica interior y exterior, la Administraci�n civil y militar y la defensa del Estado:',
  'el Rey',
  'el Gobierno',
  'el Presidente del Gobierno',
  'el Congreso',
  '2',
  '4'
  ),
(
  'El estatuto e incompatibilidades de los miembros del Gobierno se regular�:',
  'por ley',
  'mediante reglamento',
  'por ley org�nica',
  'por Decreto-Ley',
  '1',
  '4'
  ),
(
  'Corresponde proponer un candidato a la Presidencia del Gobierno, a trav�s del Presidente del Congreso a:',
  'el Gobierno',
  'el Rey',
  'el Ministro de Interior',
  'el Senado',
  '1',
  '4'
  ),
(
  'El Gobierno se compone de:',
  'el Presidente del Gobierno y los Vicepresidentes',
  'los Ministros',
  'los miembros que establezca la ley',
  'todas son correctas',
  '4',
  '4'
  ),
(
  'El candidato a la Presidencia del Gobierno necesitar�:',
  'el voto de la mayor�a simple de los miembros del Congreso de los Diputados',
  'el voto de la mayor�a absoluta de los miembros del Congreso de los Diputados',
  'el voto favorable de dos terceras partes de los miembros del Congreso de los Diputados',
  'el voto favorable de tres quintas partes de los miembros del Congreso de los Diputados',
  '2',
  '4'
  ),
(
  'El Rey disolver� ambas C�maras y convocar� nuevas elecciones con el refrendo del Presidente del Congreso, si ning�n candidato hubiere obtenido la confianza del Congreso, una vez transcurrido el plazo de:',
  '1 mes',
  '2 meses',
  '20 d�as',
  '10 d�as',
  '2',
  '4'
  ),
(
  'El Titulo VIII de la Constituci�n Espa�ola se llama:',
  'Del Poder Judicial',
  'Econom�a y Hacienda',
  'De la organizaci�n territorial del Estado',
  'De las relaciones entre el Gobierno y las Cortes Generales',
  '3',
  '5'
  ),
(
  '�Cu�ntos cap�tulos tiene el T�tulo VIII de la Constituci�n Espa�ola?:',
  '1',
  '2',
  '3',
  '4',
  '3',
  '5'
  ),
(
  ' El Estado se organiza territorialmente en:',
  'ciudades, provincias y las Comunidades Aut�nomas que se constituyan',
  'cabildos, comarcas y las provincias que se constituyan',
  'municipios, comarcas y las provincias que se constituyan',
  'municipios, provincias y las Comunidades Aut�nomas que se constituyan',
  '4',
  '5'
  ),
(
  'Velando por el establecimiento de un equilibrio econ�mico, adecuado y justo, entre las diversas partes del territorio espa�ol, el Estado garantiza la realizaci�n efectiva del principio de',
  'solidaridad',
  'igualdad',
  'seguridad jur�dica',
  'justicia universal',
  '1',
  '5'
  ),
(
  'Se�ala la incorrecta:',
  'las diferencias entre los Estatutos de las distintas Comunidades Aut�nomas podr�n implicar privilegios econ�micos o sociales',
  'todos los espa�oles tienen los mismos derechos y obligaciones en cualquier parte del territorio del Estado',
  'ninguna autoridad podr� adoptar medidas que directa o indirectamente obstaculicen la libertad de circulaci�n y establecimiento de las personas y la libre circulaci�n de bienes en todo el territorio espa�ol',
  'los municipios gozan de autonom�a para la gesti�n de sus respectivos intereses',
  '1',
  '5'
  ),
/* Preguntas tema 6 Uni�n Europea*/
(
'El Tratado de la Uni�n Europea:',
'Se compone de tres pilares.',
'Entr� en vigor en 1991.',
'Est� compuesto por seis T�tulos y un Pre�mbulo.',
'Todas son correctas.',
1,
6
),
(
'El Tratado de Par�s:',
'Se firm� el 18 de abril de 1952.',
'Se firm� el 18 de abril de 1951.',
'Instituye la CEE.',
'Todas son incorrectas.',
2,
6
),
(
'El Consejo Europeo se re�ne:',
'4 veces al a�o.',
'2 veces al a�o.',
'Al menos 3 veces al a�o.',
'3 veces al a�o.',
1,
6

),
(
'La presidencia del Consejo se ejerce de forma rotatoria cada:',
'6 meses seg�n un orden fijado por unanimidad del Consejo.',
'4 meses seg�n un orden fijado por mayor�a cualificada del Consejo.',
'6 meses seg�n un orden fijado por mayor�a cualificada del Consejo.',
'4 meses seg�n un orden fijado por unanimidad del Consejo.',
1,
6
),
(
'Los intereses comunitarios los representa por excelencia:',
'La Comisi�n.',
'El Consejo.',
'El Parlamento Europeo.',
'Las tres anteriores son falsas.',
1,
6
),
(
'La Comisi�n est� formada por:',
'27 miembros designados por los Gobiernos de los estados miembros.',
'30 miembros elegidos por su competencia t�cnica.',
'29 miembros elegidos por sus garant�as de independencia.',
'Todas son incorrectas.',
4,
6
),
(
'Para constituir un Grupo en el Parlamento Europeo es necesario al menos:',
'25 parlamentarios que pertenezcan a 1/4 de los Estados miembros.',
'28 parlamentarios que pertenezcan a un Estado miembro.',
'14 parlamentarios si pertenezcan a un Estado miembro.',
'13 parlamentarios si pertenezcan a tres o m�s Estados miembros.',
1,
6
),
(
'El Tribunal de Primera Instancia de las Comunidades Europeas:',
'Est� formado por 16 miembros.',
'El mandato del Presidente ser� renovable.',
'El per�odo de mandato de sus miembros es de 5 a�os.',
'Todas son correctas.',
2,
6
),
(
'�En qu� fechas entraron en vigor respectivamente el TCEE y el TCEEA firmados en Roma?',
'El 1 de enero de 1958 y el 3 de abril de 1960.',
'El 1 de enero de 1956 y el 1 de enero de 1958.',
'El 1 de enero de 1952 y el 1 de enero de 1958.',
'Ambos entraron en vigor el 1 de enero de 1958.',
4,
6
),
(
'�En qu� fecha se firm� el Tratado sobre la Uni�n Europea o Tratado de Maastricht?',
'El 1 de noviembre de 1993.',
'El 7 de febrero de 1992.',
'El 9 de diciembre de 1991.',
'El 30 de junio de 1994.',
2,
6
),
(
'No es un �rgano del Parlamento europeo:',
'El Pleno.',
'La Mesa.',
'Las Comisiones.',
'El Consejo de Gobierno.',
4,
6
),
(
'�Cu�l ha sido la m�s reciente modificaci�n del Tratado de la Uni�n Europea?',
'El Tratado de Niza.',
'El Tratado de Amsterdam.',
'La Carta Europea de Derechos Humanos.',
'Ninguna es correcta.',
4,
6
),
(
'�En qu� fecha fue firmado oficialmente el Tratado de �msterdam?',
'El 1 de noviembre de 1995.',
'El 2 de mayo de 1996.',
'El 23 de diciembre de 1997.',
'El 2 de octubre de 1997.',
4,
6
),
(
'Las decisiones de la Comisi�n se adoptar�n, por regla general:',
'Por mayor�a de sus miembros.',
'Cuando voten a favor de los acuerdos las 3/5 partes de los Comisarios.',
'Por mayor�a simple.',
'Por voto favorable de los 2/3 de los Comisarios.',
1,
6
),
(
'�Cu�ntos miembros tiene el Parlamento Europeo en la actualidad?',
'620.',
'751',
'587.',
'590.',
2,
6
),
(
'�Cada cu�nto tiempo se ejerce la Presidencia del Consejo de Ministros por parte de un
determinado Estado miembro de la Uni�n Europea?',
'De forma rotatoria cada seis meses.',
'De forma aleatoria cada seis meses.',
'De forma aleatoria cada tres meses.',
'De forma rotatoria cada tres meses.',
1,
6
),
(
'�Qui�nes componen el Consejo Europeo?',
'Los Ministros de Asuntos Exteriores de cada uno de los Estados miembros y el Presidente de la
Comisi�n.',
'Los Jefes de Estado y/o de Gobierno de los Estados miembros acompa�ados por el Presidente de
la Comisi�n, asistidos por los Ministros de Asuntos Exteriores de cada uno de los Estados miembros y
un miembro de la Comisi�n.',
'Los miembros de la Comisi�n y los Jefes de Estado y/o de Gobierno de los Estados miembros.',
'Los Ministros de Asuntos Exteriores de cada uno de los Estados miembros y los miembros de la
Comisi�n asistidos por el COREPER.',
2,
6
),
(
'�Cu�ntos miembros tiene la Comisi�n Europea en la actualidad tras la �ltima ampliaci�n de
la Uni�n?',
'17 miembros.',
'27 miembros.',
'Tantos como Estados miembros.',
'Ninguna es correcta.',
3,
6
),
(
'�Cu�nto tiempo dura el mandato del Presidente de la Comisi�n y, por tanto, del resto de sus
miembros, al ser un �rgano colegiado?',
'4 a�os.',
'6 a�os.',
'5 a�os.',
'3 a�os.',
3,
6
),
(
'�Qu� instituci�n de la actual Uni�n Europea tiene el monopolio de la iniciativa legislativa?',
'El Consejo Europeo.',
'El COREPER.',
'El Consejo.',
'Ninguna es correcta.',
4,
6
),
(
'�Cu�nto dura el mandato del Presidente del Parlamento Europeo?',
'5 a�os.',
'El mismo tiempo que el Presidente de la Comisi�n.',
'3 a�os.',
'Dos a�os y medio.',
4,
6
),
(
'�Cu�les son los diferentes procedimientos de participaci�n del Parlamento Europeo en el
proceso legislativo comunitario?',
'El procedimiento de consulta, el procedimiento de concertaci�n, el procedimiento de control y el
procedimiento de armonizaci�n.',
'El procedimiento de concertaci�n, el procedimiento de consulta, el de dictamen conforme y el
procedimiento de codecisi�n.',
'El procedimiento de consulta, el de concertaci�n, el del art�culo 189 del TCE, el de codecisi�n y el
de dictamen conforme.',
'El procedimiento de consulta conforme, el de concertaci�n, el de codecisi�n, el de dictamen y el de
cooperaci�n.',
3,
6
),
(
'�Cu�nto dura el mandato de los jueces del Tribunal de Justicia de la Comunidad europea?',
'Tres a�os.',
'Cuatro a�os renovable parcialmente cada dos a�os.',
'Cinco a�os.',
'Seis a�os renovable parcialmente cada tres.',
4,
6
),
(
'�Cu�les son los recursos directos del TJUE referidos al control de los �rganos
comunitarios?',
'Los recursos de anulaci�n, plena jurisdicci�n y carencia.',
'Los recursos de anulaci�n, casaci�n y omisi�n.',
'Los recursos de carencia, incumplimiento y cuesti�n prejudicial.',
'Los recursos de anulaci�n, excepci�n de ilegalidad y carencia.',
2,
6
),
(
'�Cu�ntos jueces forman en 2018 el Tribunal General y en qu� fecha empez� a funcionar de
manera efectiva?',
'Lo forman 47 jueces y comenz� a funcionar el 1 de noviembre de 1989.',
'Lo forman 28 jueces y comenz� a funcionar el 1 de noviembre de 1993.',
'Lo forman 56 jueces y comenz� a funcionar el 1 de enero de 1994.',
'Ninguna es correcta.',
1,
6
)



  /*
(
  '',
  '',
  '',
  '',
  '',
  '',
  ''
  ),
(
  '',
  '',
  '',
  '',
  '',
  '',
  ''
  ),
(
  '',
  '',
  '',
  '',
  '',
  '',
  ''
  )
  
  
  */
  
  
  
  /*,
(
  '',
  '',
  '',
  '',
  '',
  '',
  ''
  )*/

  ;

SELECT * FROM preguntas
  WHERE tema BETWEEN 1 AND 3
  ORDER BY RAND() LIMIT 5;



SELECT n_tema,CONCAT('Tema ',n_tema,': ',tema) tema FROM temas;