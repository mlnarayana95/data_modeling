DROP TABLE IF EXISTS `catalog`;

CREATE TABLE `catalog` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year_published` int(11) NOT NULL,
  `num_pages` int(11) NOT NULL,
  `in_print` tinyint(1) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_country` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `publisher_phone` varchar(255) NOT NULL,
  `publisher_city` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `format` varchar(255) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`book_id`)
); 

INSERT INTO `catalog` VALUES (1,'Dune',1975,556,1,'Frank Herbert','USA','Ballantine','775-1234','New York','SF',5.99,'Paper','2013-02-10 14:59:47'),(2,'Island',2002,345,1,'Richard Laymon','USA','Dell','766-1313','New York','Horror',4.99,'Paper','2013-02-10 14:59:47'),(3,'A Day in the Life',2012,704,1,'Carmen Ynez','Canada','Penguin','445-0987','Toronto','Literature',22.99,'Hardcover','2013-02-10 14:59:47'),(4,'Under the Dome',2010,1200,1,'Stephen King','USA','Ballantine','775-1234','New York','Horror',17.99,'Trade Paper','2013-02-10 14:59:47'),(5,'Carpet Baggers',1977,340,0,'Lee Sheldon','USA','Putnam','234-8876','New York','Drama',3.99,'Paper','2013-02-10 14:59:47'),(6,'Not a Penny More',1980,300,1,'Daniel Chambers','England','Delacorte','555-1212','London','Politics',5.99,'Paper','2013-02-10 14:59:47'),(7,'A Mixed Blessing',2002,450,1,'Sally Unger','Africa','Sun Press','654-1234','johannesburg','Politics',12.99,'Trade Paper','2013-02-10 14:59:47'),(8,'The Oath',2008,500,1,'John Lescroart','USA','Dell','766-1313','New York','Legal ',24.99,'Hardcover','2013-02-10 14:59:47'),(9,'Carrie',1975,300,0,'Stephen King','USA','Ballantine','775-1234','New York','Horror',4.99,'Paper','2013-02-10 14:59:47'),(10,'Flash Forward',2006,417,1,'Robert J. Sawyer','Canada','DAW','543-1234','New York','SF',19.99,'Trade Paper','2013-02-10 14:59:47');
