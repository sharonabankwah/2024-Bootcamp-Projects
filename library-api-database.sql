CREATE DATABASE library;
USE library;

CREATE TABLE books (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(200),
    publishing_year INT,
    isbn VARCHAR(50)
); 

INSERT INTO books
(title, author, publishing_year, isbn)
VALUES
("Beloved", "Toni Morrison", 1987, "9781784878672"),
("Jane Eyre", "Charlotte Bronte", 1847, "8439282435"),
("Pride and Prejudice", "Jane Austen", 1813, "9788990324788"),
("The Catcher in the Rye", "J.D. Salinger", 1951, "9788483023655"),
("To Kill a Mockingbird", "Harper Lee", 1960, "9788490701218")
;

ALTER TABLE books
ADD availability VARCHAR(100);

INSERT INTO books
(availability)
VALUES
("available"),
("available"),
("available"),
("available"),
("not available")
;

UPDATE books
SET title = "A Tale of Two Cities", author = "Charles Dickens", publishing_year = 1859, isbn = "9780486406510"
WHERE id = 9;

UPDATE books
SET title = "The Great Gatsby", author = "F. Scott Fitzgerald", publishing_year = 1925, isbn = "9781853260414"
WHERE id = 10;

SELECT * FROM books;
