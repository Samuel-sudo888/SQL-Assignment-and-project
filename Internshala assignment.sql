--PART A

CREATE DATABASE BookStore;
GO

USE BookStore;
GO

-- Authors Table

CREATE TABLE Authors (
AuthorID INT PRIMARY KEY,
AuthorName VARCHAR(100) NOT NULL,
Nationality VARCHAR(50) NOT NULL
);

-- Books Table
CREATE TABLE Books (
ISBN BIGINT PRIMARY KEY,
Title VARCHAR(150) NOT NULL,
AuthorID INT NOT NULL,
Genre VARCHAR(50) NOT NULL,
Price DECIMAL(10,2) NOT NULL DEFAULT 0,


CONSTRAINT FK_Books_Authors
FOREIGN KEY (AuthorID)
REFERENCES Authors(AuthorID)


);

-- Customers Table
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Address VARCHAR(200) NOT NULL
);

-- Orders Table
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL DEFAULT GETDATE(),
TotalAmount DECIMAL(10,2) NOT NULL DEFAULT 0,

CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)

);

INSERT INTO Authors (AuthorID, AuthorName, Nationality)
VALUES
(1, 'J.K. Rowling', 'British'),
(2, 'George Orwell', 'British'),
(3, 'Chetan Bhagat', 'Indian');

INSERT INTO Books (ISBN, Title, AuthorID, Genre, Price)
VALUES
(10001, 'Harry Potter', 1, 'Fantasy', 499.99),
(10002, '1984', 2, 'Dystopian', 399.99),
(10003, 'Five Point Someone', 3, 'Fiction', 299.99);

INSERT INTO Customers (CustomerID, CustomerName, Email, Address)
VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', 'Hyderabad'),
(102, 'Priya Reddy', 'priya@gmail.com', 'Secunderabad'),
(103, 'Amit Kumar', 'amit@gmail.com', 'Mumbai');

INSERT INTO Orders (OrderID, CustomerID, TotalAmount)
VALUES
(1, 101, 899.98),
(2, 102, 399.99),
(3, 103, 299.99);

--PART B

--1. Retrieve all columns for all passengers from the Titanic table.
SELECT * FROM [Titanic Data Set]

--2. Retrieve distinct values of the "Embarked" column from the Titanic table.
SELECT DISTINCT embarked
FROM [Titanic Data Set]

--3. Retrieve the names and ages of passengers who survived from the Titanic table.

SELECT first_name,
	last_name,
	age
FROM [Titanic Data Set]
WHERE alive LIKE '%YES%'

--4. Retrieve the names and ticket numbers of passengers who paid fares greater than 60000.

SELECT 
	first_name,
	last_name,
	Passenger_No,
	fare
FROM [Titanic Data Set]
WHERE fare > 60000

--5. Retrieve the names and ages of passengers whose names start with 'J'.

SELECT 
	first_name,
	last_name,
	age
FROM [Titanic Data Set]
WHERE first_name LIKE 'J%'

--6. Retrieve the names and ages of passengers who boarded deck numbers either 90 or 70.

SELECT 
	first_name,
	last_name,
	age
FROM [Titanic Data Set]
WHERE DECK_NUMBER = 90 OR DECK_NUMBER = 70

--7. Retrieve the names and ages of passengers with ages between 20 and 30.
SELECT 
	first_name,
	last_name,
	age
FROM [Titanic Data Set]
WHERE age between 20 AND 30

--8. Retrieve the names and ages of passengers whose ages belongs to 20, 25, or 30.

SELECT
	first_name,
	last_name,
	age
FROM [Titanic Data Set]
WHERE age IN (20,25,30)