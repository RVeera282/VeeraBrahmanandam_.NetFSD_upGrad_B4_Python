CREATE DATABASE TASK2;

USE TASK2;

--- Create Brands TABLE
CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

--- Create Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

--- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2),

    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

--- Insert into Brands
INSERT INTO brands VALUES (1, 'Nike'),
						  (2, 'Adidas'),
						  (3, 'Puma');

--- Insert into Categories
INSERT INTO categories VALUES (1, 'Shoes'),
							  (2, 'Clothing'),
							  (3, 'Accessories');

--- Insert into Products
INSERT INTO products VALUES (1, 'Running Shoes', 1, 1, 2023, 800),
							(2, 'T-Shirt', 2, 2, 2022, 400),
							(3, 'Sports Cap', 3, 3, 2023, 600),
							(4, 'Sneakers', 2, 1, 2024, 1200),
							(5, 'Jacket', 1, 2, 2023, 1500);


SELECT * FROM brands;
SELECT * FROM categories;
SELECT * FROM products;

SELECT p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
	FROM products p INNER JOIN brands b 
    ON p.brand_id = b.brand_id INNER JOIN categories c 
    ON p.category_id = c.category_id
	WHERE p.list_price > 500
	ORDER BY p.list_price ASC;

