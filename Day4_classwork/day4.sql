-- using related tables

-- writing complex queries 

-- Step 1 - write the basic form 
SELECT 
book.book_id, book.title,
book.num_pages, book.year_published,
book.in_print, book.image, book.price 
from 
book;

-- Two Types of JOINS 
-- Explicit Joins 
-- Add the field you one in the SELECT clause 
-- from the table you are going to join 
-- Then add that table as a JOIN clause

SELECT 
book.book_id, book.title,
book.num_pages, book.year_published,
book.in_print, book.image, book.price, 
author.name, author.country
from 
book
JOIN author ON (book.author_id = author.author_id);


SELECT 
book.book_id, book.title, 
book.num_pages, book.year_published, 
book.in_print, book.image, book.price,
author.name as author, author.country,
publisher.name as publisher, publisher.city,
genre.name as genre, format.name as format 
FROM 
book 
JOIN author ON(book.author_id = author.author_id)
JOIN publisher ON (book.publisher_id = publisher.publisher_id)
JOIN genre ON (book.genre_id = genre.genre_id)
JOIN format ON (book.format_id = format.format_id);


-- This is a specific kind of join: 
-- Returns the elements COMMON to both tables being joined 

-- PRACTICE QUERIES 

-- GET list of books (title, author, genre, publisher, format)
-- ORDER by title in alphabetic order 

SELECT 
book.title, author.name as author, genre.name as genre, 
publisher.name as publisher, format.name as format 
FROM 
book 
JOIN author ON(book.author_id = author.author_id)
JOIN publisher ON (book.publisher_id = publisher.publisher_id)
JOIN genre ON (book.genre_id = genre.genre_id)
JOIN format ON (book.format_id = format.format_id)
ORDER BY title ASC;

+---------------------+------------------+------------+------------------+-------------+
| title               | author           | genre      | publisher        | format      |
+---------------------+------------------+------------+------------------+-------------+
| A Day in the Life   | Carmen Ynez      | Literature | Penguin Books    | Hardcover   |
| A Mixed Blessing    | Sally Unger      | Politics   | Sun Press        | Trade Paper |
| Carpet Baggers      | Lee Sheldon      | Drama      | Putnam           | Paper       |
| Carrie              | Stephen King     | Horror     | Ballantine Books | Paper       |
| Castle of Adventure | Enid Blyton      | SF         | Delacorte        | Hardcover   |
| Caves of Steel      | Isaac Asimov     | SF         | Delacorte        | Hardcover   |
| Dune                | Frank Herbert    | SF         | Ballantine Books | Paper       |
| Dune Messiah        | Frank Herbert    | SF         | Ballantine Books | Paper       |
| Flash Forward       | Robert Sawyer    | SF         | DAW              | Hardcover   |
| Island              | Richard Laymon   | Horror     | Dell             | Paper       |
| Not a Penny More    | Daniel Chambers  | Politics   | Delacorte        | Paper       |
| The Black Box       | Michael Connelly | Literature | Delacorte        | Hardcover   |
| The Oath            | John Lescroart   | Legal      | Dell             | Hardcover   |
| Under the Dome      | Stephen King     | Horror     | Ballantine Books | Trade Paper |
+---------------------+------------------+------------+------------------+-------------+
14 rows in set (0.00 sec)


-- Question 2
-- Get list of books where year_published between 1978 and 2000 inclusive 
-- title, author, publisher, format, year_published

SELECT 
book.title, author.name as author,
publisher.name as publisher, format.name as format,
book.year_published
FROM 
book 
JOIN author ON(book.author_id = author.author_id)
JOIN publisher ON (book.publisher_id = publisher.publisher_id)
JOIN format ON (book.format_id = format.format_id)
WHERE 
1978 <= book.year_published AND book.year_published <= 2000; 
+------------------+-----------------+-----------+--------+----------------+
| title            | author          | publisher | format | year_published |
+------------------+-----------------+-----------+--------+----------------+
| Not a Penny More | Daniel Chambers | Delacorte | Paper  |           1980 |
+------------------+-----------------+-----------+--------+----------------+
1 row in set (0.00 sec)

-- Question 3 
-- Get list of books where author has the letters 'in' anywhere 
-- in the author name 
-- title, author, genre, format 

SELECT 
book.title, author.name as author, genre.name as genre, format.name as format
FROM 
book
JOIN author ON(book.author_id = author.author_id)
JOIN genre ON (book.genre_id = genre.genre_id)
JOIN format ON (book.format_id = format.format_id)
WHERE 
author.name LIKE "%in%";

+----------------+--------------+--------+-------------+
| title          | author       | genre  | format      |
+----------------+--------------+--------+-------------+
| Under the Dome | Stephen King | Horror | Trade Paper |
| Carrie         | Stephen King | Horror | Paper       |
+----------------+--------------+--------+-------------+
2 rows in set (0.00 sec)

-- Question 4 
-- Get a list of publishers and the number of books for each 
-- publisher in the database, 
-- publisher, num_books


SELECT 
book.book_id, book.title, 
book.num_pages, book.year_published,
book.in_print, book.image, book.price,
author.name as author, author.country as author_country, 
publisher.name as publisher, publisher.city as publisher_city,
genre.name as genre, format.name as format
FROM 
book 
JOIN author ON(book.author_id = author.author_id)
JOIN publisher ON (book.publisher_id = publisher.publisher_id)
JOIN format ON (book.format_id = format.format_id)
WHERE 

-- IMPLICIT JOINS 
SELECT 
book.book_id, book.title, 
book.num_pages, book.year_published,
book.in_print, book.image, book.price,
author.name as author, author.country as author_country, 
publisher.name as publisher, publisher.city as publisher_city,
genre.name as genre, format.name as format
FROM
book, author, publisher, format, genre
WHERE 
book.author_id  = author.author_id
AND 
book.publisher_id = publisher.publisher_id
AND 
book.format_id = format.format_id
AND 
book.genre_id = genre.genre_id;


-- INNER JOIN returns results of common records 
-- between tables;


-- INNER JOIN only returns results 
SELECT book.title, author.name FROM 
book
JOIN author using(author_id);

-- OUTER JOIN
	-- LEFT OUTER JOIN 
	-- RIGHT OUTER JOIN
-- They show us everything on one side of the join 
SELECT book.title, author.name FROM 
book
RIGHT OUTER JOIN author using(author_id);


SELECT book.title, author.name FROM 
book
RIGHT OUTER JOIN author using(author_id)
WHERE 
book.title IS NULL;

SELECT book.title, author.name as author
FROM 
book 
LEFT OUTER JOIN author USING(author_id);

-- CROSS JOIN -- not used often 
-- matches every record in one table with 
-- every record in the other table EVEN IF 
-- THE KEYS DON'T MATCH

SELECT book.title,author.name as author 
FROM 
book
JOIN author;

-- Multiply number of records in one table, with number
-- of records in another table, to determine the number 
-- of rows in the result 

-- AGGREGATE FUNCTIONS 
-- GROUPING 

-- Aggregate functions work across groups of rows 

-- COUNT -- count number of records/ rows 
-- MIN -- returns the minimum value of the field 
-- MAX - returns the maximum value of the field 
-- AVG - Average value of a field 
-- SUM - Sum of values in a field 
-- DISTINCT -- Returns only unique results 

-- get the average price of books in the database

SELECT avg(price) as average from book;

-- get the minimum price of books 

SELECT min(price) from book;

-- get the maximum price of books 

SELECT max(price) from book;

-- get the average, minimum ,maximum price of books 

SELECT 
 FORMAT(avg(price),2) as avg_price,
 min(price) as min_price, 
 max(price) as max_price 
from book;

-- get the min, max , avg price per publisher 
-- you must use group by for every non aggregate field in your query 

