CREATE DATABASE TASK3;

USE TASK3;

--- Stores Table
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL
);

--- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    store_id INT,
    order_status INT,
    order_date DATE,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

--- Order_Items Table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    quantity INT NOT NULL,
    list_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(4,2) DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

--- Insert into Stores
INSERT INTO stores VALUES (1, 'Hyderabad Store'),
						  (2, 'Chennai Store'),
						  (3, 'Bangalore Store');

--- Insert into Orders
INSERT INTO orders VALUES (101, 1, 4, '2026-03-01'),
						  (102, 1, 3, '2026-03-02'),
						  (103, 2, 4, '2026-03-03'),
						  (104, 3, 4, '2026-03-04');

--- Insert into Order_Items
INSERT INTO order_items VALUES	(1, 101, 2, 1000, 0.10),
								(2, 101, 1, 500, 0.05),
								(3, 103, 3, 700, 0.00),
								(4, 104, 4, 300, 0.20),
								(5, 102, 5, 400, 0.10);

SELECT * FROM stores;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT 
    s.store_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales_amount
FROM stores s
INNER JOIN orders o 
    ON s.store_id = o.store_id
INNER JOIN order_items oi 
    ON o.order_id = oi.order_id
WHERE o.order_status = 4
GROUP BY s.store_name
ORDER BY total_sales_amount DESC;