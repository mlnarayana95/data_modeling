-- Write the query that will generate the following results 
-- result (book_id, title, genre, author, price)
-- Only show results when price <= 9.99

SELECT 
book.book_id, book.title,
genre.name, author.name, book.price 
FROM 
book
JOIN author ON(book.author_id = author.author_id)
JOIN genre ON (book.genre_id = genre.genre_id)
WHERE book.price <= 9.99;

------

## Group By

-- Write the query to create the following result set: 
-- result(publisher, num_books, avg_price, max_price, min_price)

SELECT 
publisher.name as publisher,
count(book.title) as num_books,
avg(book.price) as avg_price,
max(book.price) as max_price,
min(book.price) as min_price
FROM 
book
JOIN publisher USING (publisher_id)
GROUP BY publisher;

+------------------+-----------+-----------+-----------+-----------+
| publisher        | num_books | avg_price | max_price | min_price |
+------------------+-----------+-----------+-----------+-----------+
| Ballantine Books |         4 |  7.990000 |     17.99 |      2.99 |
| DAW              |         1 | 19.990000 |     19.99 |     19.99 |
| Delacorte        |         4 | 17.740000 |     33.99 |      4.99 |
| Dell             |         2 | 14.990000 |     24.99 |      4.99 |
| Penguin Books    |         1 | 22.990000 |     22.99 |     22.99 |
| Putnam           |         1 |  3.990000 |      3.99 |      3.99 |
| Sun Press        |         1 | 12.990000 |     12.99 |     12.99 |
+------------------+-----------+-----------+-----------+-----------+
7 rows in set (0.00 sec)

-------

-- but also show the num_books, avg_price, max_price and min_price
-- per author by publisher 

-- You must group by every 

SELECT 
publisher.name as publisher,
author.name as author,
count(book.title) as num_books,
FORMAT(avg(book.price),2) as avg_price,
max(book.price) as max_price,
min(book.price) as min_price
FROM 
book
JOIN publisher USING (publisher_id)
JOIN author USING (author_id)
GROUP BY publisher, author;

-- Write the query to create the following result set: 
-- result(publisher, num_books, avg_price, max_price, min_price)
-- but only show publishers with less than 4 books

SELECT 
publisher.name as publisher,
count(book.title) as num_books,
FORMAT(avg(book.price),2) as avg_price,
max(book.price) as max_price,
min(book.price) as min_price
FROM 
book
JOIN publisher USING (publisher_id)
GROUP BY publisher
HAVING num_books < 4;

-- show author who have more than 1 book in our database 
-- result (author, num_books)

SELECT 
author.name as author,
count(book.title) as num_books
FROM 
book
JOIN author USING (author_id)
GROUP BY author.name
HAVING num_books > 1;

-- show all authors and a count of their books, but also show authors who have no books

RIGHT OUTER 
LEFT OUTER 

SELECT 
author.name as author,
count(book.title) as num_books
FROM 
book
RIGHT OUTER JOIN author USING (author_id)
GROUP BY author.name;

-- show all books and yourself as the author 
-- result(title, author)


SELECT 
book.title as title,
'Narain' as Author
FROM 
book;

-- Add a new book to the book table with the following information: 

title is 'A Day in the Sun'
Number of Pages is 325 
Year published is 2015 
Price is 20 dollars
Book is in print 
A line of lorem ipsum for the description
Genre is literature 
Author is Stephen King 
Publisher is Ballantine 
Format is Paper

INSERT INTO 
book(title,num_pages,year_published,price,in_print,description,genre_id,author_id,publisher_id,format_id)
values
("A Day in the Sun",325,2015,20.00,1,"Lorem Ipsum",3,4,1,1);


-- Update books set in_print to false if the publisher is Daw

UPDATE book
SET in_print = false
WHERE publisher_id = (select publisher_id from publisher where name = 'Daw');

-- Rename the name field to genre 

ALTER TABLE genre 
CHANGE name genre VARCHAR(255);

-- VIEWS
-- Views are virtual tables. We can compose a view by querying and or joining one or more other tables. 
-- It result of the query becomes a virtual table we can then use. 

CREATE VIEW catalog
AS 
SELECT 
book.book_id, book.title, 
author.name as author,
genre.genre as genre,
format.name as format,
publisher.name as publisher,
book.price 
FROM 
book
JOIN author USING(author_id)
JOIN genre USING(genre_id)
JOIN format USING(format_id)
JOIN publisher USING(publisher_id);

-- The view is linked to its base tables 
-- Any changes to the base tables, will be reflected 
-- in the view 


-- Updates to the view, will impact the base tables...
-- not always intuitively

-- Try updating the author of the book with the id of 1 to 
-- 'Big Bird' in the view 

UPDATE catalog 
SET title = 'Big Bird' where book_id = "1";

-- Another kind of virtual table in MySQL in the temporary table 
-- Only available for the session

CREATE TEMPORARY TABLE titles
AS 
SELECT title from book;

-- TRANSACTIONS
-- MySQL transaction allows you to execute a set of MySQL operations to ensure that the database never contains the
-- result of partial operations.
-- In a set of operations, if one of them fails, the rollback occurs to restore the database to its original state.
-- Commit/ Rollback is what the outcome would be
-- A - Atomicity -- all or nothing 
-- C - Consistency -- valid before and after
-- I - Isolation (Every transaction has to happen in isolation) -- isolated from rest of DB
-- D - Durability (Has to be saved into a medium that is stable) -- saved to a durable medium

START TRANSACTION -- BEGIN
  UPDATE author SET name = 'Binky Bink'
  WHERE author_id = 1; 
 -- OR ROLLBACk



