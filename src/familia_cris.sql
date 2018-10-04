DROP DATABASE IF EXISTS familia;
CREATE DATABASE familia;
USE familia;

CREATE TABLE personas(
  id_persona int AUTO_INCREMENT,
  persona varchar(127),
  id_padre int,
  nacimiento int,
  PRIMARY KEY(id_persona),
  FOREIGN KEY(id_padre) REFERENCES personas(id_persona)
  );

INSERT INTO personas (persona, id_padre,nacimiento)
  VALUES ('Juan Carlos I',NULL,1938),('Elena',1,1963),('Cristina',1,1965),('Felipe VI',1,1968),
  ('Froil�n',2,1998),('Juan Valent�n',3,1999),('Victoria Federica',2,2000),
  ('Pablo Nicol�s',3,2000),('Miguel',3,2002),('Irene',3,2005),('Leonor',4,2005),('Sof�a',4,2007);
 
-- Busco el 1�
  CREATE FUNCTION padre()
    RETURNS int
    BEGIN
      RETURN (SELECT id_persona FROM personas WHERE id_padre IS NULL); 
    END;
     SELECT padre();



 -- SELECT * FROM personas;
CREATE PROCEDURE hijos ()
  BEGIN
   
    SELECT * FROM personas WHERE
      id_padre=SELECT padre(); 
  END;


 SELECT * FROM personas
  WHERE id_padre=SELECT padre();