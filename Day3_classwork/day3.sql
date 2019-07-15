-- Day 3 SQL 

-- Get a list of authors and books from catalog 

-- Question 1 -- Return a list of books ordered by year_published with the
-- newest books first 
-- use exactly four fields in the result 

SELECT 
title,
author,
year_published,
genre
FROM 
catalog
ORDER BY year_published DESC;

+-------------------+------------------+----------------+------------+
| title             | author           | year_published | genre      |
+-------------------+------------------+----------------+------------+
| A Day in the Life | Carmen Ynez      |           2012 | Literature |
| Under the Dome    | Stephen King     |           2010 | Horror     |
| The Oath          | John Lescroart   |           2008 | Legal      |
| Flash Forward     | Robert J. Sawyer |           2006 | SF         |
| Island            | Richard Laymon   |           2002 | Horror     |
| A Mixed Blessing  | Sally Unger      |           2002 | Politics   |
| Not a Penny More  | Daniel Chambers  |           1980 | Politics   |
| Carpet Baggers    | Lee Sheldon      |           1977 | Drama      |
| Dune              | Frank Herbert    |           1975 | SF         |
| Carrie            | Stephen King     |           1975 | Horror     |
+-------------------+------------------+----------------+------------+
10 rows in set (0.00 sec)

-- Question 2 -- get a list of books in which the letters 
-- 'in' appear somewhere in the title 

SELECT 
title,
author,
year_published,
genre 
FROM 
catalog 
WHERE 
TITLE LIKE '%in%';

+-------------------+-------------+----------------+------------+
| title             | author      | year_published | genre      |
+-------------------+-------------+----------------+------------+
| A Day in the Life | Carmen Ynez |           2012 | Literature |
| A Mixed Blessing  | Sally Unger |           2002 | Politics   |
+-------------------+-------------+----------------+------------+
2 rows in set (0.00 sec)

-- Question 3 - get a list of books published between 
-- 1971 and 2000 inclusive and order the results by 
-- the title in reverse alphabetic order 

SELECT 
title,
author,
year_published,
genre 
FROM 
catalog
WHERE 
1971 <= year_published AND year_published <= 2000
ORDER BY title DESC;

+------------------+-----------------+----------------+----------+
| title            | author          | year_published | genre    |
+------------------+-----------------+----------------+----------+
| Not a Penny More | Daniel Chambers |           1980 | Politics |
| Dune             | Frank Herbert   |           1975 | SF       |
| Carrie           | Stephen King    |           1975 | Horror   |
| Carpet Baggers   | Lee Sheldon     |           1977 | Drama    |
+------------------+-----------------+----------------+----------+
4 rows in set (0.00 sec)

-- Question 4 - get the number of authors in the table 
-- in a field caled num_authors

SELECT 
COUNT(DISTINCT author) as num_authors
FROM
catalog;

+-------------+
| num_authors |
+-------------+
|           9 |
+-------------+
1 row in set (0.00 sec)

-- Question 5 - get a list of books where the author name 
-- ends in King or Chambers 

SELECT 
title,
author,
year_published,
genre 
FROM 
catalog 
WHERE author like '%King' OR author like '%Chambers';

+------------------+-----------------+----------------+----------+
| title            | author          | year_published | genre    |
+------------------+-----------------+----------------+----------+
| Under the Dome   | Stephen King    |           2010 | Horror   |
| Not a Penny More | Daniel Chambers |           1980 | Politics |
| Carrie           | Stephen King    |           1975 | Horror   |
+------------------+-----------------+----------------+----------+
3 rows in set (0.00 sec)


-- Day 2 CATCHUP 

-- LIMIT 

-- get a list of books, but only 3 records 

SELECT 
book_id, title, author, in_print 
FROM 
catalog
LIMIT 3;

+---------+-------------------+----------------+----------+
| book_id | title             | author         | in_print |
+---------+-------------------+----------------+----------+
|       1 | Dune              | Frank Herbert  |        1 |
|       2 | Island            | Richard Laymon |        1 |
|       3 | A Day in the Life | Carmen Ynez    |        1 |
+---------+-------------------+----------------+----------+
3 rows in set (0.00 sec)

-- LIMIT with OFFSET 

SELECT 
book_id, title, author, in_print
FROM
catalog 
LIMIT 0, 3;


SELECT 
book_id, title, author, in_print
FROM
catalog 
LIMIT 3, 3;

SELECT 
book_id, title, author, in_print 
FROM 
catalog 
LIMIT 6,3;


SELECT 
book_id, title, author, in_print 
FROM 
catalog 
LIMIT 9,3;

-- Some queries result in zero records 
-- This is not an error 
-- Below is an example: 
-- MYSQL will not throw errors based on your own LOGICAL errors 
-- as long as the query is syntactically correct

SELECT * 
FROM 
catalog 
WHERE 
year_published < 1;


-- year_published > 2000 AND year_published < 2008
-- year_published >= 2000 AND year_published <= 2008
SELECT 
year_published 
FROM 
catalog 
WHERE year_published BETWEEN 2000 and 2008;

-- list all books published between 1978 ad 2000

SELECT * FROM 
catalog 
WHERE year_published BETWEEN 2000 and 2008;

-- in -- in_array()
-- find a collection of records where the book_id is one of 3,7,9
-- the alternate to the below code is using OR 
-- This is a slightly more elegant way to execute 

SELECT 
title, author, book_id
FROM 
catalog 
WHERE 
book_id in (3,7,9);

+-------------------+--------------+---------+
| title             | author       | book_id |
+-------------------+--------------+---------+
| A Day in the Life | Carmen Ynez  |       3 |
| A Mixed Blessing  | Sally Unger  |       7 |
| Carrie            | Stephen King |       9 |
+-------------------+--------------+---------+
3 rows in set (0.03 sec)

-- in works with any type of data 
-- not just numbers
SELECT 
title, author, book_id 
FROM 
catalog 
WHERE 
author in ('Stephen King', 'Richard Laymon');

-- A CLOSER LOOK AT ALTER 
create table test(
	id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255));

-- alter table and a sku field that has a max of six characters 
-- unique 

ALTER TABLE test ADD sku CHAR(6) UNIQUE; 

-- TRY DROPPING THE PRIMARY KEY 
ALTER TABLE test DROP PRIMARY KEY;

-- TRY MODIFY THE TABLE AND REMOVE AUTO INCREMENT FROM ID 
ALTER TABLE test MODIFY id INT NOT NULL;

-- 1 - Remove autoincrement from current primary key 
-- 2 - Drop the primary key (by modifying the field)
-- 3 - Add the new primary key 

-- Changing the name of a field with ALTER TABLE 
-- To rename a field, we must use the CHANGE keyword 
-- instead of the MODIFY 

ALTER TABLE 
test 
CHANGE sku -- select the field to change 
product_sku CHAR(6); -- provide a new definition for field 


-- Renaming a table 
ALTER TABLE 
test 
RENAME to test2;

-- CREATE A DUPLICATE TABLE 
CREATE TABLE 
test3
LIKE test2;

-- TO COPY ALL DATA FROM ONE TABLE TO ANOTHER 
INSERT INTO test3 
SELECT * FROM test 2;

-- DATA MODELING 

-- 1. Build a model
-- 2. Look at our entities 
-- 3. Determine Relationships between entities 
-- Conceptual Data model
-- Logic Data Model 
-- Physical Data Model (ERD)

-- Note: Many to Many does not work in databases 
-- Step 1 - Identify entities (tables)
-- Step 2 - Determine relationship between entities (cardinality)


-- Conceptual Data Model 

-- High level view of entites and then relationships
-- Its for clients, not technical members, people who need 
-- understand overview of data 
-- Contains - entities, relationships, cardinality 

-- Note: Foreign key in a relationship always goes on the many side 

-- Logical Data Model

-- Predicate Example 
-- User identified by id, has a name, an email. Was hired on date1 and retired on date2 and attended a school
-- that can be identified by school_id 

