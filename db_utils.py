# Functions to interact with the database

import mysql.connector
from config import HOST, USER, PASSWORD, DATABASE

class DbConnectionError(Exception):
    pass

def _connect_to_db(): # function to create a connection with mysql database
    connection = mysql.connector.connect(
        host=HOST,
        user=USER,
        password=PASSWORD,
        auth_plugin='mysql_native_password',
        database=DATABASE
    )
    return connection # returns the database connection

def get_all_books(): # function to retrieve all books
    try:
        db_connection = _connect_to_db() # calls the database function
        cursor = db_connection.cursor()
        print(f"Connected to the database: %s." % DATABASE) # prints if connected to database successfully
        print(f"Searching for all books available in %s..." % DATABASE)

        query = """SELECT * FROM books """  # mysql query
        cursor.execute(query)  # ensures the query runs
        results = cursor.fetchall()  # fetches the results from the query

        books = [] # initialises an empty book list

        for book in results: # loops through each book in the results
            book_dictionary = {
                "id": book[0],
                "title": book[1],
                "author": book[2],
                "publishing_year": book[3],
                "isbn": book[4],
                "availability": book[5]
            }
            books.append(book_dictionary) # adds each book to the books list

        cursor.close()  # closes the cursor after results are printed
        return books

    except Exception:
        raise DbConnectionError("Failed to read data from database.")

    finally:
        if db_connection:
            db_connection.close()  # closes the database connection
            print("Database connection is closed.") # prints if the database connection has been closed

def get_books_by_author(author): # function to retrieve all books by an author
    try:
        db_connection = _connect_to_db() # calls the database function
        cursor = db_connection.cursor()

        print("\nConnected to database: %s." % DATABASE) # prints if connected to database successfully
        print(f"Searching for books by author: {author}...")

        query = """ SELECT * FROM books WHERE author = %s """ # mysql query
        cursor.execute(query, (author,)) # ensures the query runs, parameter is author's name
        results = cursor.fetchall()  # fetches the results from the query

        books = []  # initialises an empty book list

        for book in results:  # loops through each book in the results
            book_info = {
                "id": book[0],
                "title": book[1],
                "author": book[2],
                "publishing_year": book[3],
                "isbn": book[4],
                "availability": book[5]
            }
            books.append(book_info)  # adds each book to the books list

        cursor.close()  # closes the cursor after results are printed
        return books

    except Exception:
        raise DbConnectionError("Failed to read data from database.")

    finally:
        if db_connection:
            db_connection.close() # closes the database connection
            print("Database connection is closed.") # prints if the database connection has been closed

def delete_book_by_id(id):
    try:
        db_connection = _connect_to_db()
        cursor = db_connection.cursor()

        query = """ DELETE FROM books WHERE id = %s """
        cursor.execute(query, (id,))
        db_connection.commit()

        return cursor.rowcount > 0 # checks if any rows are returned, if so will delete

    except Exception:
        raise DbConnectionError("Failed to read data from database.")

    finally:
        if db_connection:
            db_connection.close() # closes the database connection
            print("Database connection is closed.") # prints if the database connection has been closed

def main(): # function to help run the program
    get_all_books()  # calls the first query
    get_books_by_author("Toni Morrison")  # calls the second query
    delete_book_by_id(4) # calls the third query

if __name__ == '__main__':
    main()
