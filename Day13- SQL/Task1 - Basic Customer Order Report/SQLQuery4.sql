--- Creating DataBase
CREATE DATABASE StoreDB;

--- Using DataBase
USE StoreDB;

--- Create Customers Table
CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

--- Create Order Table
CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	order_status INT CHECK (order_status IN (1,2,3,4)),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--- Insert Data into Customers Table
INSERT INTO customers VALUES (1,'Ravi','Kumar'),
							 (2,'Mahesh','Babu'),
							 (3,'Arjun','Varma'),
							 (4,'Rohit','Sharma');

--- Insert Data into Orders Table
INSERT INTO Orders Values (101, 1, '2026-03-01', 1),
						  (102, 2, '2026-03-02', 4),
						  (103, 3, '2026-03-03', 2),
						  (104, 1, '2026-03-04', 4),
						  (105, 4, '2026-03-05', 1);

SELECT * FROM customers;
SELECT * FROM Orders;

SELECT c.first_name, c.last_name, o.order_id, o.order_date, o.order_status
	FROM Customers c
	INNER JOIN Orders o 
	ON c.customer_id = o.customer_id
	WHERE o.order_status = 1
	OR o.order_status = 4
	ORDER BY o.order_date DESC;
