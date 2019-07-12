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

+---------------------+----------------+----------------+----------+
| title               | author         | year_published | genre    |
+---------------------+----------------+----------------+----------+
| Marching Frogs      | Tommy Tunes    |           2005 | Children |
| Children of Dune    | Frank Herbert  |           1999 | SF       |
| Island              | Richard Laymon |           1993 | Horror   |
| Gateway             | Frederick Phol |           1978 | SF       |
| Dune                | Frank Herbert  |           1975 | SF       |
| Dune Messiah        | Frank Herbert  |           1975 | SF       |
| Black Ice           | Frank Herbert  |           1975 | SF       |
| Not a penny anymore | Tom Archer     |           1973 | Politics |
+---------------------+----------------+----------------+----------+
8 rows in set (0.00 sec)