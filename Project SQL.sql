-- Create the database
CREATE DATABASE library;
-- Use the database
USE library;

-- Create the tables
-- Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255) NOT NULL,
    Contact_no VARCHAR(15)
);
-- Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
-- Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3), -- Use 'Yes' or 'No'
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
-- Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Customer_address VARCHAR(100),
    Reg_date DATE
);
-- IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100) NOT NULL,
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
-- ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100) NOT NULL,
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
  (1, 501, '111 Redwood Court', '221-555-7789'),
  (2, 502, '225 Sycamore Lane', '(222) 555-9901'),
  (3, 503, '333 Chestnut Drive', '(223) 555-1213'),
  (4, 504, '456 Elm Avenue', '224-555-3435'),
  (5, 505, '589 Walnut Avenue', '225-555-5657'),
  (6, 506, '672 Hickory Avenue', '226-555-7879'),
  (7, 507, '770 Ash Boulevard', '227-555-1235'),
  (8, 508, '830 Fir Street', '228-555-5566'),
  (9, 509, '910 Dogwood Drive', '229-555-1212'),
  (10, 510, '1200 Oakmont Street', '230-555-9102');
select * from Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
  (991, 'Robert Anderson', 'Manager', 150000, 1),
  (992, 'Emily Johnson', 'Clerk', 20000, 2),
  (993, 'Lauren Garcia', 'Assistant Manager', 90000, 3),
  (994, 'Sarah Davis', 'Librarian', 35000, 4),
  (995, 'David Miller', 'Clerk', 20500, 5),
  (996, 'Jessica Wilson', 'Assistant Manager', 85000, 6),
  (997, 'James Moore', 'Librarian', 40000, 7),
  (998, 'Ashley Taylor', 'Clerk', 25000, 8),
  (999, 'John Smith', 'Manager', 100000, 9),
  (1000, 'Megan Thomas', 'Clerk', 30000, 10),
  (1001, 'William Jackson', 'Manager', 95000, 2),
  (1002, 'Jennifer White', 'Assistant Manager', 80500, 6),
  (1003, 'Christopher Harris', 'Clerk', 31000, 7),
  (1004, 'Amanda Martin', 'Data Operator', 15000, 1),
  (1005, 'Matthew Thompson', 'Manager', 105000, 9),
  (1006, 'Michael Brown', 'Assistant Manager', 80000, 1),
  (1007, 'Andrew Martinez', 'Clerk', 30500, 1),
  (1008, 'Nicole Robinson', 'Librarian', 41000, 1),
  (1009, 'Daniel Clark', 'Manager', 110000, 10),
  (1010, 'Samantha Lewis', 'Clerk', 29000, 1);
select * from Employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
  ('5501', 'The Silent Symphony', 'Fiction', 414.17, 'Yes', 'Emma Collins', 'Apex Publishing'),
  ('5502', 'Whispers of the Past', 'Mystery', 456.67, 'Yes', 'Thomas Rutherford', 'Crimson House Books'),
  ('5503', 'The Quantum Paradox', 'Science Fiction', 581.17, 'Yes', 'Linda Brooks', 'Galaxy Press'),
  ('5504', 'Cooking for Beginners', 'Cookbooks', 248.17, 'No', 'Sarah Green', 'Tasteful Editions'),
  ('5505', 'Understanding AI', 'Technology', 581.17, 'Yes', 'Mark Williams', 'Tech Publishing Inc'),
  ('5506', 'Journey Through Time- History', 'Historical Fiction', 785.27, 'no', 'Richard Knight', 'Legacy Press'),
  ('5507', 'The Green Revolution', 'Non-Fiction', 664.17, 'No', 'Barbara Scott', 'EcoReads Publishing'),
  ('5508', 'A Dance of Shadows', 'Fantasy', 581.17, 'Yes', 'J.K. DeVries', 'DreamForge Books'),
  ('5509', 'Digital Nomad Life', 'Travel', 685.17, 'yes', 'Brian Williams', 'Wanderlust Press'),
  ('5510', 'The Art of Photography', 'Arts', 497.17, 'No', 'Julia Benson', 'Visionary Publishing');
  select * from Books;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
  ('2011', ' Charles Harris', ' 808 Cedar St', '2023-01-10'),
  ('2012', 'Amanda Martinez', '909 Oak Ave', '2022-01-05'),
  ('2013', 'Christopher Lee', '1001 Birch St', '2020-10-05'),
  ('2014', 'Jessica Robinson', '1102 Maple Rd', '2024-01-04'),
  ('2015', 'Daniel Walker', '1203 Pine Blvd', '2024-09-01'),
  ('2016', 'Olivia Green', '1304 Redwood Ln', '2023-07-09'),
  ('2017', 'James Young', '1405 Elm St', '2021-04-07'),
  ('2018', 'Sophia King', '1506 Oak Rd', '2020-05-16'),
  ('2019', 'Benjamin Wright', '1607 Cedar Blvd', '2023-04-01'),
  ('2020', 'Natalie Scott', '1708 Willow Ave', '2021-02-10');
select * from Customer;

 INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date)
VALUES
  ('31001', '2014', 'Understanding AI', '2022-10-21'),
  ('31002', '2019', 'The Green Revolution', '2023-07-10'),
  ('31003', '2015', 'The Art of Photography', '2024-09-25'),
  ('31004', '2020', 'The Quantum Paradox', '2023-02-28'),
  ('31005', '2017', 'Whispers of the Past', '2021-08-09'),
  ('31006', '2018', 'Digital Nomad Life', '2023-06-25');
select * from IssueStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
  ('91001', '2014', 'Understanding AI', '2022-12-25', '5505'),
  ('91002', '2019', 'The Green Revolution', '2023-10-01', '5507'),
  ('91003', '2015', 'The Art of Photography', '2024-11-30', '5510'),
  ('91004', '2020', 'The Quantum Paradox', '2023-05-28', '5503'),
  ('91005', '2017', 'Whispers of the Past', '2021-09-29', '5502');
select * from ReturnStatus;


-- Query 1: Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price 
FROM Books
WHERE Status = 'Yes';

-- Query 2: List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary 
FROM Employee
ORDER BY Salary DESC;

-- Query 3: Retrieve the book titles and the corresponding customers who have issued those books
SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.Issued_book_name = B.Book_title
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- Query 4: Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_Books 
FROM Books
GROUP BY Category;

-- Query 5: Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_name, Position 
FROM Employee
WHERE Salary > 50000;

-- Query 6: List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name 
FROM Customer
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Query 7: Display the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee
GROUP BY Branch_no;

-- Query 8: Display the names of customers who have issued books in the month of June 2023
SELECT DISTINCT C.Customer_name 
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Query 9: Retrieve book_title from book table containing the word 'history'
SELECT Book_title 
FROM Books
WHERE Book_title LIKE '%History%';

-- Query 10: Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- Query 11: Retrieve the names of employees who manage branches and their respective branch addresses
SELECT E.Emp_name, B.Branch_address 
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;


-- Query 12: Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT DISTINCT C.Customer_name 
FROM IssueStatus I
JOIN Books B ON I.Issued_book_name = B.Book_title
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE B.Rental_Price > 25;
