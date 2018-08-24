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
  ('General','Cuerpo Técnico Superior.'),
  ('General','Cuerpos de Gestión.'),
  ('General','Cuerpo Administrativo.'),
  ('General','Cuerpo General Auxiliar.'),
  ('General','Cuerpo General Subalterno.'),
  ('Especial','Cuerpo Facultativo Superior.'),
  ('Especial','Cuerpo de Letrados.'),
  ('Especial','Cuerpo Superior de Inspectores de Finanzas de Cantabria.'),
  ('Especial','Cuerpo Técnico de Finanzas de Cantabria.'),
  ('Especial','Cuerpo de Diplomados y Técnicos Medios.'),
  ('Especial','Cuerpo de Técnicos Auxiliares.'),
  ('Especial','Cuerpo de Técnicos Auxiliares del Medio Natural.'),
  ('Especial','Cuerpo de Técnicos Auxiliares de Seguridad y Vigilancia.'),
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
  ('Ministerio de Administración Pública');

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
  (1,'La Constitución Española de 1978.'),
  (2,'La Corona. '),
  (3,'Las Cortes Generales'),
  (4,' El Gobierno y la Administración.'),
  (5,'La organización territorial del Estado.'),
  (6,'La Unión Europea.'),
  (7,'El Poder Judicial y el Tribunal Constitucional.'),
  (8,'Antecedentes históricos de la Comunidad Autónoma de Cantabria.'),
  (9,'El Estatuto de Autonomía para Cantabria.'),
  (10,'Los órganos de gobierno y administración de la Comunidad Autónoma de Cantabria.'),
  (11,'Las fuentes del derecho.'),
  (12,'El acto administrativo.'),
  (13,'El procedimiento administrativo común: Fases. Interesados.'),
  (14,'Nulidad y anulabilidad. Revisión. Recursos.'),
  (15,'El personal al servicio de la Administración de la Comunidad Autónoma de Cantabria.'),
  (16,'TREBEP.'),
  (17,'La Seguridad Social.'),
  (18,'Concepto de informática.'),
  (19,'Estructura y almacenamiento de datos.'),
  (20,'La documentación administrativa.'),
  (21,'El Manual de Atención al Ciudadano y la Carta de Derechos de la Ciudadanía.'),
  (22,'Transparencia, acceso a la información pública y normas de buen gobierno.'),
  (23,'P.R.L.'),
  (24,'Igualdad. Violencia de género. Discapacidad y dependencia');


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
  '(99/2003) Si varios ordenadores están conectados en red pueden (señalar la respuesta incorrecta)',
  'Conectarles con un ordenador que no esté dentro de la red',
  'Compartir un escáner',
  'Compartir una impresora',
  'Compartir información entre ellos',
  1,18),(
  '(100/2003) En términos informáticos ¿Que es una carpeta?',
  'Un documento de texto',
  'Espacio del disco duro de un ordenador destinado a almacenar información del usuario',
  'Una página de una hoja de calculo',
  'Una parte de la base de datos',
  2,18),(
  '(85/2007) Durante su ejecución, un programa reside en:',
  'En la pantalla del ordenador',
  'La memoria principal del ordenador',
  'El bus',
  'El disco duro',
  2,18),(
  'Señala la correcta:',
  'los poderes públicos están sujetos a la Constitución y al resto del ordenamiento jurídico',
  'los ciudadanos están sujetos a la Constitución y al resto del ordenamiento jurídico',
  'los ciudadanos y los poderes públicos están sujetos a la Constitución',
  'los ciudadanos y los poderes públicos están sujetos a la Constitución y al resto del ordenamiento jurídico',
  4,1),(
  'Regulará las bases de la organización militar conforme a los principios de la presente Constitución:',
  'una ley orgánica',
  'un decreto ley',
  'una norma con rango de ley',
  'una ley de bases',
  1,1),(
  'La bandera de España está formada por:',
  'tres franjas horizontales, roja, amarilla y roja, siendo la amarilla de doble anchura que cada una de las rojas',
  'tres franjas horizontales, amarilla, roja y amarilla, siendo la roja la mitad que cada una de las amarillas',
  'tres franjas horizontales, roja, amarilla y roja, siendo la amarilla la mitad que cada una de las rojas',
  'tres franjas horizontales, amarilla, roja y amarilla, siendo la roja de doble anchura que cada una de las amarillas',
  1,1),(
  'Tiene como misión garantizar la soberanía e independencia de España, defender su integridad territorial y el ordenamiento constitucional:',
  'el Gobierno',
  'el Jefe de Estado',
  'los tribunales',
  'las Fuerzas Armadas',
  4,1),(
  'La forma política del Estado español es:',
  'la Monarquía parlamentaria',
  'la soberanía nacional',
  'el pluralismo político',
  'la sociedad democrática',
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
  'Extinguidas todas las líneas llamadas en Derecho, proveerá a la sucesión en la Corona en la forma que más convenga a los intereses de España:',
  'el Congreso de los Diputados',
  'el Senado',
  'las Cortes Generales',
  'el Presidente del Gobierno',
  '3',
  '2'
  ),
  (
  'Las abdicaciones y renuncias y cualquier duda de hecho o de derecho que ocurra en el orden de sucesión a la Corona se resolverán:',
  'mediante Decreto-Ley',
  'por Ley Orgánica',
  'por el Presidente del Gobierno',
  'mediante referéndum',
  '2',
  '2'
  ),
  (
  'Para ejercer la Regencia es preciso:',
  'ser español de nacimiento y mayor de 21 años',
  'ser español y mayor de edad',
  'ser español de nacimiento y mayor de edad',
  'ser español y mayor de 21 años',
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
  'Señala la correcta:',
  'nadie podrá ser miembro de las dos Cámaras simultáneamente',
  'es compatible el acta de una Asamblea de Comunidad Autónoma con la de Diputado al Congreso',
  'los miembros de las Cortes Generales estarán ligados por mandato imperativo',
  'las reuniones de Parlamentarios que se celebren sin convocatoria reglamentaria vincularán a las Cámaras',
  '1',
  '3'
  ),
(
  'Dirige la política interior y exterior, la Administración civil y militar y la defensa del Estado:',
  'el Rey',
  'el Gobierno',
  'el Presidente del Gobierno',
  'el Congreso',
  '2',
  '4'
  ),
(
  'El estatuto e incompatibilidades de los miembros del Gobierno se regulará:',
  'por ley',
  'mediante reglamento',
  'por ley orgánica',
  'por Decreto-Ley',
  '1',
  '4'
  ),
(
  'Corresponde proponer un candidato a la Presidencia del Gobierno, a través del Presidente del Congreso a:',
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
  'El candidato a la Presidencia del Gobierno necesitará:',
  'el voto de la mayoría simple de los miembros del Congreso de los Diputados',
  'el voto de la mayoría absoluta de los miembros del Congreso de los Diputados',
  'el voto favorable de dos terceras partes de los miembros del Congreso de los Diputados',
  'el voto favorable de tres quintas partes de los miembros del Congreso de los Diputados',
  '2',
  '4'
  ),
(
  'El Rey disolverá ambas Cámaras y convocará nuevas elecciones con el refrendo del Presidente del Congreso, si ningún candidato hubiere obtenido la confianza del Congreso, una vez transcurrido el plazo de:',
  '1 mes',
  '2 meses',
  '20 días',
  '10 días',
  '2',
  '4'
  ),
(
  'El Titulo VIII de la Constitución Española se llama:',
  'Del Poder Judicial',
  'Economía y Hacienda',
  'De la organización territorial del Estado',
  'De las relaciones entre el Gobierno y las Cortes Generales',
  '3',
  '5'
  ),
(
  '¿Cuántos capítulos tiene el Título VIII de la Constitución Española?:',
  '1',
  '2',
  '3',
  '4',
  '3',
  '5'
  ),
(
  ' El Estado se organiza territorialmente en:',
  'ciudades, provincias y las Comunidades Autónomas que se constituyan',
  'cabildos, comarcas y las provincias que se constituyan',
  'municipios, comarcas y las provincias que se constituyan',
  'municipios, provincias y las Comunidades Autónomas que se constituyan',
  '4',
  '5'
  ),
(
  'Velando por el establecimiento de un equilibrio económico, adecuado y justo, entre las diversas partes del territorio español, el Estado garantiza la realización efectiva del principio de',
  'solidaridad',
  'igualdad',
  'seguridad jurídica',
  'justicia universal',
  '1',
  '5'
  ),
(
  'Señala la incorrecta:',
  'las diferencias entre los Estatutos de las distintas Comunidades Autónomas podrán implicar privilegios económicos o sociales',
  'todos los españoles tienen los mismos derechos y obligaciones en cualquier parte del territorio del Estado',
  'ninguna autoridad podrá adoptar medidas que directa o indirectamente obstaculicen la libertad de circulación y establecimiento de las personas y la libre circulación de bienes en todo el territorio español',
  'los municipios gozan de autonomía para la gestión de sus respectivos intereses',
  '1',
  '5'
  ),
/* Preguntas tema 6 Unión Europea*/
(
'El Tratado de la Unión Europea:',
'Se compone de tres pilares.',
'Entró en vigor en 1991.',
'Está compuesto por seis Títulos y un Preámbulo.',
'Todas son correctas.',
1,
6
),
(
'El Tratado de París:',
'Se firmó el 18 de abril de 1952.',
'Se firmó el 18 de abril de 1951.',
'Instituye la CEE.',
'Todas son incorrectas.',
2,
6
),
(
'El Consejo Europeo se reúne:',
'4 veces al año.',
'2 veces al año.',
'Al menos 3 veces al año.',
'3 veces al año.',
1,
6

),
(
'La presidencia del Consejo se ejerce de forma rotatoria cada:',
'6 meses según un orden fijado por unanimidad del Consejo.',
'4 meses según un orden fijado por mayoría cualificada del Consejo.',
'6 meses según un orden fijado por mayoría cualificada del Consejo.',
'4 meses según un orden fijado por unanimidad del Consejo.',
1,
6
),
(
'Los intereses comunitarios los representa por excelencia:',
'La Comisión.',
'El Consejo.',
'El Parlamento Europeo.',
'Las tres anteriores son falsas.',
1,
6
),
(
'La Comisión está formada por:',
'27 miembros designados por los Gobiernos de los estados miembros.',
'30 miembros elegidos por su competencia técnica.',
'29 miembros elegidos por sus garantías de independencia.',
'Todas son incorrectas.',
4,
6
),
(
'Para constituir un Grupo en el Parlamento Europeo es necesario al menos:',
'25 parlamentarios que pertenezcan a 1/4 de los Estados miembros.',
'28 parlamentarios que pertenezcan a un Estado miembro.',
'14 parlamentarios si pertenezcan a un Estado miembro.',
'13 parlamentarios si pertenezcan a tres o más Estados miembros.',
1,
6
),
(
'El Tribunal de Primera Instancia de las Comunidades Europeas:',
'Está formado por 16 miembros.',
'El mandato del Presidente será renovable.',
'El período de mandato de sus miembros es de 5 años.',
'Todas son correctas.',
2,
6
),
(
'¿En qué fechas entraron en vigor respectivamente el TCEE y el TCEEA firmados en Roma?',
'El 1 de enero de 1958 y el 3 de abril de 1960.',
'El 1 de enero de 1956 y el 1 de enero de 1958.',
'El 1 de enero de 1952 y el 1 de enero de 1958.',
'Ambos entraron en vigor el 1 de enero de 1958.',
4,
6
),
(
'¿En qué fecha se firmó el Tratado sobre la Unión Europea o Tratado de Maastricht?',
'El 1 de noviembre de 1993.',
'El 7 de febrero de 1992.',
'El 9 de diciembre de 1991.',
'El 30 de junio de 1994.',
2,
6
),
(
'No es un órgano del Parlamento europeo:',
'El Pleno.',
'La Mesa.',
'Las Comisiones.',
'El Consejo de Gobierno.',
4,
6
),
(
'¿Cuál ha sido la más reciente modificación del Tratado de la Unión Europea?',
'El Tratado de Niza.',
'El Tratado de Amsterdam.',
'La Carta Europea de Derechos Humanos.',
'Ninguna es correcta.',
4,
6
),
(
'¿En qué fecha fue firmado oficialmente el Tratado de Ámsterdam?',
'El 1 de noviembre de 1995.',
'El 2 de mayo de 1996.',
'El 23 de diciembre de 1997.',
'El 2 de octubre de 1997.',
4,
6
),
(
'Las decisiones de la Comisión se adoptarán, por regla general:',
'Por mayoría de sus miembros.',
'Cuando voten a favor de los acuerdos las 3/5 partes de los Comisarios.',
'Por mayoría simple.',
'Por voto favorable de los 2/3 de los Comisarios.',
1,
6
),
(
'¿Cuántos miembros tiene el Parlamento Europeo en la actualidad?',
'620.',
'751',
'587.',
'590.',
2,
6
),
(
'¿Cada cuánto tiempo se ejerce la Presidencia del Consejo de Ministros por parte de un
determinado Estado miembro de la Unión Europea?',
'De forma rotatoria cada seis meses.',
'De forma aleatoria cada seis meses.',
'De forma aleatoria cada tres meses.',
'De forma rotatoria cada tres meses.',
1,
6
),
(
'¿Quiénes componen el Consejo Europeo?',
'Los Ministros de Asuntos Exteriores de cada uno de los Estados miembros y el Presidente de la
Comisión.',
'Los Jefes de Estado y/o de Gobierno de los Estados miembros acompañados por el Presidente de
la Comisión, asistidos por los Ministros de Asuntos Exteriores de cada uno de los Estados miembros y
un miembro de la Comisión.',
'Los miembros de la Comisión y los Jefes de Estado y/o de Gobierno de los Estados miembros.',
'Los Ministros de Asuntos Exteriores de cada uno de los Estados miembros y los miembros de la
Comisión asistidos por el COREPER.',
2,
6
),
(
'¿Cuántos miembros tiene la Comisión Europea en la actualidad tras la última ampliación de
la Unión?',
'17 miembros.',
'27 miembros.',
'Tantos como Estados miembros.',
'Ninguna es correcta.',
3,
6
),
(
'¿Cuánto tiempo dura el mandato del Presidente de la Comisión y, por tanto, del resto de sus
miembros, al ser un órgano colegiado?',
'4 años.',
'6 años.',
'5 años.',
'3 años.',
3,
6
),
(
'¿Qué institución de la actual Unión Europea tiene el monopolio de la iniciativa legislativa?',
'El Consejo Europeo.',
'El COREPER.',
'El Consejo.',
'Ninguna es correcta.',
4,
6
),
(
'¿Cuánto dura el mandato del Presidente del Parlamento Europeo?',
'5 años.',
'El mismo tiempo que el Presidente de la Comisión.',
'3 años.',
'Dos años y medio.',
4,
6
),
(
'¿Cuáles son los diferentes procedimientos de participación del Parlamento Europeo en el
proceso legislativo comunitario?',
'El procedimiento de consulta, el procedimiento de concertación, el procedimiento de control y el
procedimiento de armonización.',
'El procedimiento de concertación, el procedimiento de consulta, el de dictamen conforme y el
procedimiento de codecisión.',
'El procedimiento de consulta, el de concertación, el del artículo 189 del TCE, el de codecisión y el
de dictamen conforme.',
'El procedimiento de consulta conforme, el de concertación, el de codecisión, el de dictamen y el de
cooperación.',
3,
6
),
(
'¿Cuánto dura el mandato de los jueces del Tribunal de Justicia de la Comunidad europea?',
'Tres años.',
'Cuatro años renovable parcialmente cada dos años.',
'Cinco años.',
'Seis años renovable parcialmente cada tres.',
4,
6
),
(
'¿Cuáles son los recursos directos del TJUE referidos al control de los órganos
comunitarios?',
'Los recursos de anulación, plena jurisdicción y carencia.',
'Los recursos de anulación, casación y omisión.',
'Los recursos de carencia, incumplimiento y cuestión prejudicial.',
'Los recursos de anulación, excepción de ilegalidad y carencia.',
2,
6
),
(
'¿Cuántos jueces forman en 2018 el Tribunal General y en qué fecha empezó a funcionar de
manera efectiva?',
'Lo forman 47 jueces y comenzó a funcionar el 1 de noviembre de 1989.',
'Lo forman 28 jueces y comenzó a funcionar el 1 de noviembre de 1993.',
'Lo forman 56 jueces y comenzó a funcionar el 1 de enero de 1994.',
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