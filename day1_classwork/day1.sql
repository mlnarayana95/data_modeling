-- Day 1 SQL 

-- Some Basic DML Commands

-- See a list of existing databases 

SHOW DATABASES;

-- To create a new database, we use the CREATE command 

CREATE DATABASE people;

-- To use a database, USE databasename;

USE people;

-- Once we are using a database, we can use these commands: 

-- Show a list of tables 

SHOW TABLES;

-- Deleting a table

DROP TABLE tablename;

-- Create a new table
-- BIG INT (8 bytes) 
-- SMALL INT ()
-- TINY INT  
-- Create a USERS table in the PEOPLE database

CREATE TABLE users(user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
				  name VARCHAR(255), 
				  email VARCHAR(255),
				  password VARCHAR(255));

-- Show how a table was created 

SHOW CREATE TABLE tablename;

-- And also...

DESCRIBE tablename;

-- Adding a field called 'ISACTIVE' using alter table to modify an existing table 

ALTER TABLE users ADD is_active BOOLEAN NOT NULL DEFAULT true;

ALTER TABLE users ADD created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;


-- We add records to table using the INSERT statement 

INSERT INTO users
(name,email,password) 
VALUES 
('Davey Jones','dave@example.com','mypass');

-- Select all records from table 

select * from tablename;

INSERT INTO users
(name,email,password) 
VALUES 
('Davey Jones','dave@example.com','mypass'),
('The One','neo@matrix.com','mypass'),
('Luke Skywalker','badbrother@theforce.com','mypass');

-- Granting privileges on a database 
-- Should not manipulate database with the root user. Root user only for administrative purposes 
-- .* denotes all tables of the people database 

CREATE USER 'web_user'@'localhost' identified by 'mypass';

GRANT ALL on people.*
to 'web_user'@'localhost'
identified by 'mypass';

-- to select specific columns from table 

select column names from tablename;

-- Create a table with a utf8 default character set 

CREATE DATABASE books DEFAULT CHARSET utf8mb4;

-- CURRENT_TIMESTAMP can be replaced by NOW 
create table catalog(
	book_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	author VARCHAR(255),
 	genre VARCHAR(255),
 	year_published INT(4),
 	in_print BOOLEAN DEFAULT true,
 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
	) engine=InnoDB;
