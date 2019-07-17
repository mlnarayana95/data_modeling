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

