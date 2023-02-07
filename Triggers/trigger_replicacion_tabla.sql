--replicar las actualizaciones realizados en una tabla a otra de respaldo
CREATE TABLE books (
    Name_book varchar2(50)
);

CREATE TABLE books_backup AS SELECT * FROM books WHERE 1=2;

CREATE or REPLACE trigger Books_Replication
BEFORE INSERT OR DELETE OR UPDATE ON books
FOR EACH ROW
ENABLE 
BEGIN
  IF INSERTING THEN
    INSERT INTO books_backup (NAME_BOOK) VALUES (:NEW.NAME_BOOK);  
  ELSIF DELETING THEN
    DELETE FROM books_backup WHERE NAME_BOOK =:old.name_book; 
  ELSIF UPDATING THEN
    UPDATE books_backup 
    SET NAME_BOOK =:new.name_book WHERE NAME_BOOK =:old.name_book;
  END IF;
END;
/
--Bloque de codigo para provocar el trigger
INSERT INTO BOOKS (name_book) values('Iliadas de romeo_del');

UPDATE
   BOOKS
SET
    name_book = 'Ilidias de romeo_up';

DELETE FROM BOOKS 
    WHERE name_book = 'Iliadas de romeo_del';
    
--Verificacion
select * from books_backup;