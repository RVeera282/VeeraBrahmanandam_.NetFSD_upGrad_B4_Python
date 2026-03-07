CREATE DATABASE TASK4;

USE TASK4;

CREATE TABLE products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL
);

CREATE TABLE stores (	
	store_id INT PRIMARY KEY,
	store_name VARCHAR(100) NOT NULL
);

CREATE TABLE stocks (
	store_id INT,
	product_id INT,
	quantity INT NOT NULL CHECK (quantity >= 0),

	PRIMARY KEY (store_id, product_id),

	FOREIGN KEY (store_id) REFERENCES stores(store_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	store_id INT,
	order_status INT,

	FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE order_items (
	order_id INT,
	product_id INT,
	quantity INT NOT NULL CHECK (quantity > 0),

	PRIMARY KEY (order_id, product_id),

	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

---Insert Products
INSERT INTO products VALUES (1,'Mountain Bike'),
							(2,'Road Bike'),
							(3,'Helmet');

--- Insert Stores
INSERT INTO stores VALUES (1,'Hyderabad Store'),
						  (2,'Chennai Store');

--- Insert Stocks
INSERT INTO stocks VALUES (1, 1, 50),
						  (1, 2, 30),
						  (2, 1, 40),
						  (2, 3, 100);

--- Insert Orders
INSERT INTO orders VALUES (101, 1, 4),
						  (102, 1, 4),
						  (103, 2, 4);

--- Insert Order Items
INSERT INTO order_items VALUES (101, 1, 5),
							   (101, 2, 3),
							   (102, 1, 2),
							   (103, 3, 10);

SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM stocks;
SELECT * FROM orders;
SELECT * FROM order_items;


SELECT 
	p.product_name,
	s.store_name,
	st.quantity AS avaliable_stock,
	ISNULL(SUM(oi.quantity), 0) AS
total_quantity_sold
FROM stocks st

INNER JOIN products p
	ON st.product_id = p.product_id

INNER JOIN stores s 
	ON st.store_id = s.store_id

LEFT JOIN orders o 
	ON st.store_id = o.store_id
	AND o.order_status = 4
	
LEFT JOIN order_items oi
	ON o.order_id = oi.order_id
	AND st.product_id = oi.product_id

GROUP BY
	p.product_name,
	s.store_name,
	st.quantity

ORDER BY
	p.product_name;