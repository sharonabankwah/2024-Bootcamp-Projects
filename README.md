# Online Library API

## Contents
- [Introduction](#introduction)
- [Installation Requirements](#installation-requirements)
- [Configuration](#configuration)
- [API](#api)
- [Expected Outcomes](#expected-outcomes)

## Introduction
This file provides instructions on how to set up and run the Online Library API. The API allows users to access a collection of books, including searching books by author and deleting books by ID.

## Installation Requirements
Please ensure you have the following installed:

- **Python**:
- **Flask**: A web framework for Python, to install, run: pip install Flask
- **MySQL**: A MySQL connector, to install, run: pip install mysql-connector-python

## Configuration
  import mysql.connector

def _connect_to_db():
    return mysql.connector.connect(
        host='localhost',
        user='your_username',
        password='your_password',
        database='library'
    )

Replace your_username, your_password, and library with your MySQL database credentials and the name of your database.

## API

app.py
client.py

## Expected outcome
