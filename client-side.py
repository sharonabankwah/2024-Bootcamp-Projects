# This client-side script interacts with the Flask-based Online Library API.
# It allows the user to:
# 1. View all books in the library.
# 2. Search for books by a specific author.
# 3. Delete a book by its ID.
# The script makes HTTP requests to the API endpoints and displays the results.

import requests

main_url = 'http://127.0.0.1:5000/books'

print("Welcome to your online library!")

# function to retrieve all books
def get_all_books():
    try:
        result = requests.get(main_url)
        books = result.json()
        for book in books:
            print(f"{book['id']}: {book['title']} by {book['author']} (ISBN: {book.get('isbn', 'N/A')}) - availability: {book['availability']}")
    except Exception:
        print("Failed to retrieve books...")

# function to retrieve books by author
def get_books_by_author(author):
    try:
        result = requests.get(f"{main_url}/author?name={author}")
        books = result.json()
        if books:
            for book in books:
                print(f"{book['id']}: {book['title']} by {book['author']} (ISBN: {book.get('isbn', 'N/A')}) - availability: {book['availability']}")
        else:
            print(f"No books found for author {author}.")
    except Exception:
        print(f"Failed to retrieve books for {author}...")

# function to delete a book by ID
def delete_book(id):
    try:
        result = requests.delete(f"{main_url}/{id}")
        print(f"Book ID {id} has been deleted.")
    except Exception:
        print(f"Failed to delete book ID {id}...")


print("\nPlease wait while we fetch all our books...")
get_all_books() # prints all books for user

# asks for user input for author name
author = input("\nPlease enter the name of the author you wish to search for: ")
print(f"Searching for books by {author}...")
get_books_by_author(author) # prints all books by author for user

# asks for user input for book ID
id = input("\nPlease enter the book ID you wish to delete from the library: ")
delete_book(id) # deletes book by id from user

if __name__ == '__main__':
    main()  # activates the flask application
