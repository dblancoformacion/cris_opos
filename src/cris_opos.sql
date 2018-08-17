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