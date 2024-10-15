from flask import Flask, jsonify, request
from db_utils import get_all_books, get_books_by_author, delete_book_by_id

app = Flask(__name__)

@app.route('/')
def home_page():
    return jsonify({"message": "Welcome to your online library!"})

@app.route('/books', methods=['GET'])
def all_books():
    books = get_all_books() # call function to get all available books
    return jsonify(books) # returns books as json

@app.route('/books/author', methods=['GET'])
def books_by_author():
    author = request.args.get('name') # /books/author?name=Toni+Morrison
    books = get_books_by_author(author) # call function to get books by a specific author
    if books:
        return jsonify(books) # returns books as json
    else:
        return jsonify({"message": "No books found for this author..."})

@app.route('/books/<int:id>', methods=['DELETE'])
def delete_book(id):
    deleted_book = delete_book_by_id(id) # /books/id
    if deleted_book:
        return jsonify({"message": f"Book ID {id} has been deleted."}) # returns message to confirm deleted
    else:
        return jsonify({"message": "No books found with this ID..."})

if __name__ == '__main__':
    app.run(debug=True)