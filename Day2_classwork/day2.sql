-- MySQL DataTypes 

-- Decimal -- fixed place decimal 

 ALTER TABLE catalog
 ADD price DECIMAL(7,2);

 -- ALTER TABLE allows us to change the structure 
 -- of an existing table... add or remove fields 
 -- or change the definition of the field 

-- remove price field from table 
ALTER TABLE 
catalog 
DROP price;  

-- Add a field in a specific positon 

 ALTER TABLE catalog
 ADD price DECIMAL(7,2)
 AFTER genre;

 ALTER TABLE catalog
 ADD title varchar(255)
 AFTER book_id;

-- Add a book 

INSERT INTO 
catalog 
(title, author, genre, year_published, price)
VALUES 
('Dune','Frank Herbert','SF', 1975, 5);

INSERT INTO 
catalog
(title, author, genre, year_published, price)
VALUES 
('Dune Messiah','Frank Herbert','SF', 1975, 5),
('Island','Richard Laymon','Horror', 1993, 7.99),
('Not a penny anymore','Tom Archer','Thriller', 1973, 6.99),
('Gateway','Frederick Phol','SF', 1978, 9.99),
('Black Ice','Frank Herbert','SF', 1975, 5),
('Children of Dune','Frank Herbert','SF',1999,2);

-- Update records with the UPDATE keyword

UPDATE catalog 
SET GENRE = 'Politics'
WHERE book_id = 4;

-- Change the field (price) to have a default of 0 
-- We will use ALTER TABLE to modify the field 

ALTER TABLE catalog 
MODIFY
price DECIMAL(5,2)
NOT NULL DEFAULT 0; 

INSERT INTO 
catalog 
(title, author, genre, year_published)
VALUES
('Marching Frogs', 'Tommy Tunes', 'Children', 2005);

-- 	UPDATE catalog set three books to be not in print 

UPDATE catalog 
SET in_print = false
WHERE book_id % 2 = 0

-- SELECT title, author for books that are in print 

-- NOTE: this is not good 

SELECT 
title, author 
FROM 
catalog 
WHERE 
in_print is true;

-- To order results use ORDER BY clause 
-- (after all other clauses)

SELECT 
title, author, in_print, year_published
FROM 
catalog
ORDER BY title;

-- Order in reverse order 

SELECT 
title, author, in_print, year_published
FROM 
catalog
ORDER BY TITLE DESC;

-- Performing a backup using mysqldump

mysqldump -u root -p people > people.sql

-- Resolves to true for ANY value other than 0 

SELECT * 
FROM tablename 
WHERE fieldname IS true;

-- Resolves to true ONLY for 1 
SELECT * 
FROM tablename 
WHERE fieldname = true;

-- Use people database 

-- Add postal_code field to the user's table,
-- that has a datatype of CHAR and allows only 6 characters 

-- Add a gender field to the users table, 
-- that has a datatype of ENUM and allows only 'm', 'f'

 ALTER TABLE users
 ADD postal_code CHAR(6);

 ALTER TABLE users 
 ADD gender ENUM('m','f'); 

 -- Try inserting a postal code with 6 chars
 -- Inserts data 
 
 -- Try inserting a postal code with 4 chars 
 -- Inserts data 

 -- Try inserting a postal code with 8 chars
 -- Error Data too long ()
 
 -- Try inserting m or f in the gender field 
 -- inserts m in the corresponding field 

 -- Try inserting x in the gender field 
 -- Data truncated 

 INSERT INTO users 
 (postal_code) values  ('r3g2');


 INSERT INTO users 
 (postal_code) values  ('r3g2reqew');

 INSERT INTO users 
 (gender) values ('m');

 -- Renaming our catalog table 

 ALTER TABLE 
 catalog 
 RENAME TO catalog_old;

-- To IMPORT an SQL script 

SOURCE filename.sql;

-- OR, simply copy and paste the content of the 

-- Ordering by one or more fields


SELECT 
title, author, year_published
FROM 
catalog
ORDER BY year_published DESC;

SELECT 
title, author, year_published
FROM 
catalog
ORDER BY author ASC, 
year_published DESC;

-- Using count we get the number of entries 

SELECT COUNT(author) from catalog;

-- use the DISTINCT keyworkd to limit results to distinct entries

SELECT DISTINCT author from catalog;

SELECT COUNT(DISTINCT author) from catalog;

-- Using Aliases using the keyword 'AS'
SELECT COUNT(DISTINCT author) AS num_authors FROM catalog;

SELECT 
title as 'Book title',
author as 'Book Author',
year_published as 'Year Published'
FROM 
catalog
ORDER BY author ASC, 
year_published DESC;

-- One way of searching is with the = 
-- Another way is with the LIKE keyword 

SELECT 
title, author 
FROM 
catalog 
WHERE 
author = 'Stephen King';

-- SEARCHING using LIKE
-- LIKE uses two wildcard characters 
-- % means ANY NUMBER OF CHARACTERS
-- _means ANY SINGLE CHARACTER 
-- Either can be used anywhere in a string 

SELECT 
title, author 
FROM 
catalog 
WHERE 
author LIKE '%ing';



SELECT 
title, author 
FROM 
catalog 
WHERE 
author LIKE 'st%';

-- string has a anywhere inside it 

SELECT 
title, author 
FROM 
catalog 
WHERE 
author LIKE '%a%';


SELECT 
title, author
FROM 
catalog 
WHERE 
title LIKE '_une';

-- SQLITE 

-- TO OUTPUT IN COLUMNS 

.mode columns 

-- SQLITE DATATYPES 

-- NULL - null value 
-- INTEGER - a signed integer value 
-- REAL - a float 
-- TEXT - a string 
-- BLOB - binary data 
-- DATE AND TIME - dateandtime

-- to create a table in SQLITE

CREATE TABLE users(
id INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(255), 
email VARCHAR(255),
password VARCHAR(255),
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(name, email, password)
VALUES 
('dave','dave@example.com','mypass');

-- SHOW TABLES; in SQLite: .tables 
-- .schema users - show how the table was created  
-- .schema by istelf, shows all table creation code 
-- .show display settings 


-- SOME COMMANDS THAT ARE HELPFUL 

-- .mode columns (gives nicer output)
-- .headers on (adds headers to columns)
