# Online Library API

This project implements a simple online library API with a Flask backend, integrated with a MySQL database. It allows users to view all books, search for books by a specific author, and delete books by ID. The system supports interacting with the library via a set of API endpoints and also provides a command-line interface for interacting with the library.

## Features

- **View all books**: Displays a list of all books available in the library.
- **Search books by author**: Allows users to search for books by a specific author.
- **Delete books by ID**: Deletes a book from the library based on its ID.

## Requirements

- Python 3.x
- Flask
- MySQL database
- Requests

You can install the necessary dependencies by running:

```bash pip install -r requirements.txt```

## Installation and Setup

**1. Set up the MySQL Database:**
- Create a MySQL database for your library.
- Use the following SQL commands to create the necessary table and insert some sample books:
```
CREATE DATABASE library;
USE library;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(200),
    publishing_year INT,
    isbn VARCHAR(50),
    availability VARCHAR(100)
);

INSERT INTO books (title, author, publishing_year, isbn, availability)
VALUES
    ("Beloved", "Toni Morrison", 1987, "9781784878672", "available"),
    ("Jane Eyre", "Charlotte Bronte", 1847, "8439282435", "available"),
    ("Pride and Prejudice", "Jane Austen", 1813, "9788990324788", "available"),
    ("The Catcher in the Rye", "J.D. Salinger", 1951, "9788483023655", "available"),
    ("To Kill a Mockingbird", "Harper Lee", 1960, "9788490701218", "not available");
```

**2. Configure the Database Connection:**
- In the config.py file, configure your MySQL database credentials:
```
HOST = "localhost"
USER = "your-username"
PASSWORD = "your-password"
DATABASE = "library"
```

**3. Run the Flask App:**
- Start the Flask server by running:
```
python app.py
```
- The API will be available at http://127.0.0.1:5000.

**4. Using the Library:**
-The following API endpoints are available:
- GET /books: Retrieves all books in the library.
- GET /books/author?name=author_name: Retrieves all books by a specific author.
- DELETE /books/id: Deletes a book by its ID.
-You can interact with the API using the following commands from a terminal or by using a tool like Postman.

## Example Usage

**1. View All Books:**
- GET /books: Returns a list of all books.

**2. Search for Books by Author:**
- GET /books/author?name=author_name: Replace author_name with the name of the author you want to search for.
- For example:
```
GET /books/author?name=Toni+Morrison
```

**3. Delete a Book by ID:** 
- DELETE /books/id: Replace id with the ID of the book you want to delete. 
- For example:
```
DELETE /books/1
```

## Command-Line Interface

You can also interact with the library using the Python command-line interface. Run the script:

```
python main.py
```
Choose from the available options:

- 1: View all books.
- 2: Search for books by author.
- 3: Delete a book by ID.

You can type "exit" to quit the program.

## API Endpoints

- GET /books: Fetches all books.
- GET /books/author?name=author_name: Fetches books by the specified author.
- DELETE /books/id: Deletes a book by its ID.

## Error Handling
- Failed Database Connection: If there’s a connection issue with the database, the application will raise a DbConnectionError.
- Book Not Found: When no books are found by the provided author or ID, the API will return a message indicating no results were found.
