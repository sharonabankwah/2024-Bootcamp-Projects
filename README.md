# Online Library API

## Contents
- [Introduction](#introduction)
- [Installation Requirements](#installation-requirements)
- [API](#api)
- [Expected Outcomes](#expected-outcomes)

## Introduction
This file provides instructions on how to set up and run the Online Library API. The API allows users to access a collection of books, including searching books by author and deleting books by ID.

## Installation Requirements
Please ensure you have the following installed:

- **Python**:
- **Flask**: A web framework for Python, to install, run: pip install Flask
- **MySQL**: A MySQL connector, to install, run: pip install mysql-connector-python

## API

You should open the following Python files:

- config.py 
- db_utils.py
- app.py
- main.py
- client-side.py

Step-by-step:

1. Set up the config file with personal details (do not share!)
2. Create and insert sample data into your MySQL database

For reference:

CREATE TABLE books (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(200),
    publishing_year INT,
    isbn VARCHAR(50),
    availability VARCHAR(100)
); 

3. Open the app.py to run the API, click on the link
4. Open the main.py to run the interactive user script

## Expected outcome

- You will be welcomed by the online library and given options
- Based on the user input you can either view all books, search by author or delete by id
