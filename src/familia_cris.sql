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
  VALUES ('Juan Carlos I',NULL,1938),('Margarita',NULL,1930),('Elena',1,1963),('Cristina',1,1965),('Felipe VI',1,1968),
  ('Froilán',2,1998),('Juan Valentín',3,1999),('Victoria Federica',2,2000),
  ('Pablo Nicolás',3,2000),('Miguel',3,2002),('Irene',3,2005),('Leonor',4,2005),('Sofía',4,2007);
 
-- procedimiento familia
CREATE PROCEDURE familia()
  BEGIN
    DECLARE n,id,grado int;
    DECLARE c1 CURSOR FOR
      SELECT id_persona FROM personas WHERE id_padre IS NULL;
    SELECT COUNT(*) INTO n FROM personas WHERE id_padre IS NULL;
    CREATE TEMPORARY TABLE famlia(
      id int AUTO_INCREMENT,
      id_persona int,
      grado int,
      PRIMARY KEY(id)
    );
    SET grado=1;
    open c1;
    SET @@max_sp_recursion_depth=50;
    WHILE n>0 DO 
      FETCH c1 INTO id;
      INSERT INTO famlia (id_persona,grado) VALUES (id,grado);
      CALL hijos(id,grado);
      set n=n-1;
    END WHILE;
    SET @@max_sp_recursion_depth=0;
    close c1;
    SELECT * FROM famlia JOIN personas USING(id_persona);
  END;

CREATE PROCEDURE hijos(id int,grado int)
  BEGIN
     DECLARE n,id_hijo int ;
     DECLARE c2 CURSOR FOR
      SELECT id_persona FROM personas WHERE id_padre=id;
    SELECT COUNT(*) INTO n FROM personas WHERE id_padre=id;
    open c2;
    WHILE n>0 DO
      fetch c2 INTO id_hijo;
      INSERT INTO famlia (id_persona,grado) VALUES (id_hijo,grado+1);
      CALL hijos(id_hijo,grado+1);
      set n=n-1;    
    END WHILE;
    
  END;

CALL familia();