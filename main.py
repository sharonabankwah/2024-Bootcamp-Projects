from app import app, get_all_books, get_books_by_author, delete_book
from db_utils import get_all_books


def main():
    print("Welcome to your online library!")
    print("\nHere are your options:")
    print("1. View all books.")
    print("2. Search for books by author.")
    print("3. Delete a book by ID.")

    print("To interact with the library API, use the following endpoints:")
    print("\n1. GET /books")
    print("2. GET /books/author?name=author+name")
    print("3. DELETE /books/id \n")

    while True:
        options = input("Please enter either 1-3, or 'exit' to quit: ")

        if options == "1":
            print("Please wait while we fetch all our books...")
            get_all_books()

        elif options == "2":
            author = input("Please enter the name of the author you wish to search for: ")
            print(f"Searching for books by {author}...")
            get_books_by_author(author)

        elif options == "3":
            id = input("Please enter the book ID to delete: ")
            delete_book(id)

        elif options.lower() == "exit":
            print("Thank you for visiting the online library!")
            break

        else:
            print("Invalid response.")

if __name__ == '__main__':
    main()  # activates the flask application
