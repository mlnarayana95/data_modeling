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

--