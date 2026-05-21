USE EmployeeDB


/*  Create the following tables Permanent employee, Contract employee, and the
Hiring employee and inserted the data into the tables respectively.*/


CREATE TABLE Permanent_Emp
(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE
);

CREATE TABLE Contract_Emp
(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    ContractDurationMonths INT,
    HourlyRate INT
);
CREATE TABLE Hiring_Emp
(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    PositionApplied VARCHAR(50),
    ExpectedSalary INT,
    InterviewScore INT
);


CREATE TABLE Emp_Contact_Details
(
    ContactID INT PRIMARY KEY,
    EmployeeID INT,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    City VARCHAR(50),

    FOREIGN KEY (EmployeeID)
    REFERENCES Permanent_Emp(EmployeeID)
);

INSERT INTO Permanent_Emp VALUES
(1, 'Rahul Sharma', 30, 'IT', 70000, '2021-01-10'),
(2, 'Priya Verma', 42, 'HR', 85000, '2019-03-15'),
(3, 'John Mathew', 25, 'Finance', 50000, '2023-06-20'),
(4, 'Sarah Khan', 36, 'Marketing', 65000, '2020-11-05'),
(5, 'David Lee', 29, 'IT', 72000, '2022-07-01'),
(6, 'Amit Patel', 33, 'Sales', 58000, '2021-09-17'),
(7, 'Emma Watson', 45, 'Management', 95000, '2018-02-28');

INSERT INTO Contract_Emp VALUES
(101, 'Rahul Sharma', 28, 'IT', 12, 500),
(102, 'Sophia Miller', 35, 'Finance', 6, 450),
(103, 'Daniel Craig', 31, 'Sales', 18, 400),
(104, 'Sarah Khan', 38, 'Marketing', 9, 550),
(105, 'Chris Evans', 26, 'IT', 12, 350),
(106, 'Olivia Brown', 29, 'HR', 6, 300);



INSERT INTO Hiring_Emp VALUES
(201, 'Michael Scott', 27, 'HR Executive', 45000, 78),
(202, 'Pam Beesly', 24, 'Designer', 40000, 82),
(203, 'Jim Halpert', 29, 'Sales Executive', 50000, 88),
(204, 'Sarah Khan', 32, 'Marketing Manager', 70000, 91),
(205, 'Daniel Craig', 30, 'Business Analyst', 65000, 85),
(206, 'Priya Verma', 40, 'HR Manager', 90000, 95);

INSERT INTO Emp_Contact_Details VALUES
(1, 1, '9876543210', 'rahul@gmail.com', 'Hyderabad'),
(2, 2, '9876543211', 'priya@gmail.com', 'Mumbai'),
(3, 4, '9876543212', 'sarah@gmail.com', 'Delhi'),
(4, 5, '9876543213', 'david@gmail.com', 'Bangalore'),
(5, 7, '9876543214', 'emma@gmail.com', 'Chennai');

/*Get all the records from the Permanent employee table where the Age of the
employees should be greater than the maximum value of the Age column in the
Contract employee table.*/

SELECT *
FROM Permanent_Emp
WHERE Age > ( SELECT MAX(Age)
FROM Contract_Emp )

/* Get all the records from the Permanent employee table where the Age is at-least
great than one value from the Age column of the Contract employee table.*/

SELECT * 
FROM Permanent_Emp
WHERE Age > ANY(SELECT Age FROM Contract_Emp)

/*Get all the records from the Permanent employee table where there is at least
one record in the EmployeeContactDetails table with a matching employee’s
EmployeeID.*/

SELECT 
    p.EmployeeID,
    p.Age,
    p.Department,
    p.JoiningDate,
    p.Name,
    p.Salary,
    e.EmployeeID
FROM Permanent_Emp AS P
INNER JOIN Emp_Contact_Details AS E ON e.EmployeeID = p.EmployeeID

/*Combine employees of permanent, contract and hiring employee list and merge
them and sort by their names.*/

SELECT Name
FROM Permanent_Emp

UNION 

SELECT Name FROM Contract_Emp

UNION 

SELECT Name FROM Hiring_Emp
ORDER BY Name

/*Retrieve all of the rows from Table Permanent employee that exist in Table of
Contract employee, and retrieving all data of the rows from Contract employee
that exist in the Table of Hiring employee and it should be sorted by Names. */

SELECT 
    f.EmployeeID,
    f.Name,
    f.Age,
    f.Department
FROM Permanent_Emp AS F

UNION 

SELECT 
    c.EmployeeID,
    c.Name,
    c.Age,
    c.Department
FROM Contract_Emp AS C

UNION

SELECT 
    h.EmployeeID,
    h.Name,
    h.Age,
    h.PositionApplied
FROM Hiring_Emp AS H

ORDER BY Name

/*Retrieve the data from mention attributes EmployeeID, Name, Department,
Gender, Age and Email, Mobile from the Permanent employee and
EmployeeContactDetails tables respectively.*/

SELECT
    f.EmployeeID,
    f.Name,
    f.Department,
    f.Age,
    e.Email,
    e.PhoneNumber
FROM Permanent_Emp AS f
FULL JOIN Emp_Contact_Details AS E ON e.EmployeeID = f.EmployeeID

