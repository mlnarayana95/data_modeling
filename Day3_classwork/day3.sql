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

