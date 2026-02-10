-- 1 create table users

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    country VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2 create table products


CREATE TABLE products(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(150) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL CHECK (stock >= 0)
);

-- 3 create table orders

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    user_id INTEGER,
    order_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status VARCHAR(50) NOT NULL CHECK (status IN ('pending','shipped','delivered','cancelled')),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 4 create table orders_items

CREATE TABLE order_items (    
    id BIGSERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price NUMERIC(10,2) NOT NULL CHECK (price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


-- level 1.1 insert dummy data in users

INSERT INTO users (name,email,country,created_at) VALUES 
        ('Rahul Sharma', 'rahul.sharma@example.com', 'India', NOW() - INTERVAL '10 days'),
        ('Anjali Verma', 'anjali.verma@example.com', 'India', NOW() - INTERVAL '5 days'),
        ('Michael Johnson', 'michael.j@example.com', 'USA', NOW() - INTERVAL '15 days'),
        ('Sofia Martinez', 'sofia.m@example.com', 'Spain', NOW() - INTERVAL '20 days'),
        ('Arjun Patel', 'arjun.patel@example.com', 'India', NOW() - INTERVAL '2 days');


INSERT INTO users (name, email, country, created_at) VALUES 
    ('Priya Singh', 'priya.singh@example.com', 'India', NOW() - INTERVAL '8 days'),
    ('David Wilson', 'david.wilson@example.com', 'USA', NOW() - INTERVAL '12 days'),
    ('Emma Brown', 'emma.brown@example.com', 'UK', NOW() - INTERVAL '6 days'),
    ('Carlos Hernandez', 'carlos.h@example.com', 'Mexico', NOW() - INTERVAL '3 days'),
    ('Meera Nair', 'meera.nair@example.com', 'India', NOW() - INTERVAL '1 day');



--  level 1.2 insert dummy data in products

INSERT INTO products (name,category,price,stock) VALUES
            ('iPhone 15', 'Electronics', 79999.00, 50),
            ('Samsung Galaxy S24', 'Electronics', 69999.00, 40),
            ('Sony Headphones', 'Accessories', 4999.00, 100),
            ('MacBook Air M2', 'Electronics', 114999.00, 20),
            ('Gaming Mouse', 'Accessories', 1999.00, 150);

-- add more data
INSERT INTO products (name, category, price, stock) VALUES
            ('iPad Pro 12.9', 'Electronics', 99999.00, 30),
            ('Dell XPS 13', 'Electronics', 109999.00, 25),
            ('Apple Watch Series 9', 'Electronics', 41999.00, 60),
            ('Samsung Galaxy Tab S9', 'Electronics', 74999.00, 35),
            ('Logitech Mechanical Keyboard', 'Accessories', 8999.00, 80),
            ('JBL Bluetooth Speaker', 'Accessories', 5999.00, 120),
            ('Canon DSLR Camera', 'Electronics', 65999.00, 15),
            ('Wireless Earbuds', 'Accessories', 3499.00, 200),
            ('External SSD 1TB', 'Accessories', 10499.00, 70),
            ('27-inch 4K Monitor', 'Electronics', 32999.00, 40);

--  level 1.3 insert data in orders
INSERT INTO orders (user_id, order_date, status) VALUES
            (1, NOW() - INTERVAL '9 days', 'delivered'),
            (2, NOW() - INTERVAL '4 days', 'shipped'),
            (3, NOW() - INTERVAL '14 days', 'delivered'),
            (4, NOW() - INTERVAL '18 days', 'cancelled'),
            (5, NOW() - INTERVAL '1 day', 'pending'),
            (1, NOW() - INTERVAL '3 days', 'delivered'),
            (2, NOW() - INTERVAL '2 days', 'pending'),
            (3, NOW() - INTERVAL '7 days', 'shipped'),
            (4, NOW() - INTERVAL '6 days', 'delivered'),
            (5, NOW() - INTERVAL '12 days', 'cancelled');

INSERT INTO orders (user_id, order_date, status) VALUES
    (1, NOW() - INTERVAL '1 day', 'delivered'),
    (1, NOW() - INTERVAL '6 hours', 'pending'),
    (2, NOW() - INTERVAL '2 days', 'delivered'),
    (3, NOW() - INTERVAL '3 days', 'shipped'),
    (4, NOW() - INTERVAL '4 days', 'delivered'),
    (5, NOW() - INTERVAL '12 hours', 'pending'),
    (5, NOW() - INTERVAL '1 hour', 'delivered');

-- level 1.4 inset dummy data in order_items

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
            (1, 1, 1, 79999.00),
            (1, 3, 2, 4999.00),
            (2, 2, 1, 69999.00),
            (2, 5, 1, 1999.00),
            (3, 4, 1, 114999.00),
            (4, 3, 1, 4999.00),
            (4, 5, 2, 1999.00),
            (5, 1, 1, 79999.00),
            (5, 5, 1, 1999.00),
            (6, 2, 1, 69999.00),
            (6, 3, 1, 4999.00),
            (7, 5, 3, 1999.00),
            (8, 1, 1, 79999.00),
            (8, 3, 2, 4999.00),
            (9, 4, 1, 114999.00),
            (10, 2, 1, 69999.00);


INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (11, 1, 1, 79999.00),
    (12, 3, 2, 4999.00),
    (13, 2, 1, 69999.00),
    (14, 4, 1, 114999.00),
    (15, 5, 2, 1999.00),
    (16, 6, 1, 99999.00),
    (17, 8, 1, 41999.00),



-- view all Data in users 
SELECT * FROM users;

-- view all Data in products 
SELECT * FROM products;

-- view all Data in orders
SELECT * FROM  orders;

-- view all Data in order_items
SELECT * FROM order_items;



-- level 1.5 all users in india
SELECT * FROM users WHERE country = 'India';

-- level 1.6 all products cost more than 1000
SELECT * FROM products WHERE price >20000;

-- level 1.7 all orders placed in last 7 days
SELECT * FROM orders WHERE order_date >= NOW() - INTERVAL '7 days';

-- 8. Get all orders along with user name
SELECT
    o.id AS order_id,
    o.order_date,
    o.status,
    u.id AS user_id,
    u.name AS user_name
FROM orders o
JOIN users u
ON o.user_id = u.id
ORDER BY o.id;

-- 9. Calculate total amount for each order.
SELECT order_id ,SUM( price*quantity) AS total_amount FROM order_items GROUP BY order_id;

-- 10. Calculate total money spent by each user.
SELECT 
    o.user_id,
    SUM(ot.price*ot.quantity) AS total_amount
FROM orders o 
JOIN order_items ot
ON o.id = ot.order_id
GROUP BY user_id;


-- Calculate total money spent by each user. with users info 
SELECT 
u.id,
u.email,
u.name,
a.total_amount
FROM users u
JOIN (
    SELECT 
    o.user_id,
    SUM(ot.price*ot.quantity) AS total_amount
FROM orders o 
JOIN order_items ot
ON o.id = ot.order_id
GROUP BY user_id
) a
ON u.id = a.user_id;


--  11 Find top 3 users who spent the most money.
SELECT 
    o.user_id,
    SUM(ot.price*ot.quantity) AS total_amount
FROM orders o 
JOIN order_items ot
ON o.id = ot.order_id
GROUP BY user_id
ORDER BY total_amount DESC LIMIT 3;


-- Find top 3 users who spent the most money. with user info
SELECT 
u.id,
u.email,
u.name,
a.total_amount
FROM users u
JOIN (
    SELECT 
    o.user_id,
    SUM(ot.price*ot.quantity) AS total_amount
FROM orders o 
JOIN order_items ot
ON o.id = ot.order_id
GROUP BY user_id
) a
ON u.id = a.user_id 
ORDER BY total_amount DESC 
LIMIT 3;

-- Find products that were ordered.
SELECT products.id ,
products.name,
products.price,
products.stock
FROM products JOIN order_items ON products.id = order_items.product_id GROUP BY products.id;

-- 12. Find products that were never ordered.
SELECT * FROM products WHERE id NOT IN ( SELECT product_id
    FROM order_items );

-- 13. Find users who never placed an order.
SELECT * FROM users WHERE id NOT IN ( SELECT user_id
    FROM orders );


-- 14. Find the most sold product (by total quantity).

SELECT ot.product_id,SUM(ot.quantity) AS total_quantity_sold
 FROM order_items ot GROUP BY ot.product_id;

--  14. Find the most sold product (by total quantity). with all data

 SELECT p.id,p.name,p.category ,p.price,p.stock, a.total_quantity_sold
 FROM products p JOIN (
    SELECT ot.product_id,SUM(ot.quantity) AS total_quantity_sold
 FROM order_items ot GROUP BY ot.product_id
 ) a ON a.product_id = p.id;


-- 15. Find the highest revenue generating product.

 SELECT 
 p.id,
 p.name,
 p.category,
 p.price,
 p.stock,
a.total_quantity_sold,
(a.total_quantity_sold * p.price) AS total_revenue
FROM products p JOIN (
    SELECT ot.product_id,SUM(ot.quantity) AS total_quantity_sold
 FROM order_items ot GROUP BY ot.product_id
 ) a ON a.product_id = p.id ORDER BY total_revenue DESC LIMIT 1;


--  16. Find users who placed more than 3 orders.
SELECT * FROM (
    SELECT u.id,
    u.name,
    u.email,
    u.country,
    count(o.user_id) AS total_order
FROM users u
JOIN orders o
ON u.id = o.user_id
GROUP BY u.id
) AS d
WHERE d.total_order>3

-- 17. Find users whose total spending is greater than the average user spending.

-- 1 total spending per order ID

SELECT 
order_id,
SUM(quantity*price)AS total_spending
FROM order_items
GROUP BY order_id;


-- 2 total spending per user id 

SELECT 
o.user_id,
SUM(a.total_spending) AS total_spending
FROM orders o
JOIN (SELECT 
    order_id,
    SUM(quantity*price)AS total_spending
    FROM order_items
    GROUP BY order_id
    ) a
ON o.id = a.order_id
GROUP BY user_id;

-- 3 total spending from above avg
SELECT 
x.user_id,
x.total_spending
FROM (
    SELECT 
    o.user_id,
    SUM(a.total_spending) AS total_spending
    FROM orders o
    JOIN (SELECT 
        order_id,
        SUM(quantity*price)AS total_spending
        FROM order_items
        GROUP BY order_id
        ) a
    ON o.id = a.order_id
    GROUP BY user_id
) x
WHERE x.total_spending > (
    SELECT AVG(total_spending) FROM (
        SELECT 
        o.user_id,
        SUM(a.total_spending) AS total_spending
        FROM orders o
        JOIN (SELECT 
            order_id,
            SUM(quantity*price)AS total_spending
            FROM order_items
            GROUP BY order_id
            ) a
        ON o.id = a.order_id
        GROUP BY user_id
    ) y
);

-- CHATGPT ans
SELECT 
    o.user_id,
    SUM(oi.quantity * oi.price) AS total_spending
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.user_id
HAVING SUM(oi.quantity * oi.price) > (
    SELECT AVG(user_total)
    FROM (
        SELECT 
            o.user_id,
            SUM(oi.quantity * oi.price) AS user_total
        FROM orders o
        JOIN order_items oi ON o.id = oi.order_id
        GROUP BY o.user_id
    ) t
);

-- 18. Find the second highest spending user.

SELECT
o.user_id,
SUM(oi.quantity * oi.price) AS total_spending
FROM orders o 
JOIN order_items oi
ON o.id = oi.order_id
GROUP BY o.user_id 
ORDER BY total_spending DESC LIMIT 1 OFFSET 1;


-- chatgpt ans 

SELECT *
FROM (
    SELECT
        o.user_id,
        SUM(oi.quantity * oi.price) AS total_spending,
        DENSE_RANK() OVER (
            ORDER BY SUM(oi.quantity * oi.price) DESC
        ) AS rnk
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    GROUP BY o.user_id
) t
WHERE rnk = 2;

-- 19. Delete cancelled orders older than 7 days.

-- select 

SELECT * FROM orders
WHERE status = 'cancelled'
AND order_date < NOW() - INTERVAL '7 days';

--  delete order items

DELETE FROM order_items
WHERE order_id IN (
    SELECT id FROM orders
    WHERE status = 'cancelled'
    AND order_date < NOW() - INTERVAL '7 days'
);

--  delete orders


DELETE FROM orders
WHERE status = 'cancelled'
AND order_date < NOW() - INTERVAL '7 days';

-- 20. Update product stock when an order is placed.

UPDATE products p
SET stock = stock - oi.quantity
FROM order_items oi
WHERE p.id = oi.product_id
AND oi.order_id = 1
AND p.stock >= oi.quantity;

-- 21. Find users who ordered every product in category 'Electronics'.
SELECT
oi.id,
oi.order_id,
p.id AS product_id,
p.category,
p.name
FROM order_items oi
JOIN products p
ON oi.product_id = p.id
AND p.category = 'Electronics';



-- 21. Find users who ordered every product in category 'Electronics'.
INSERT INTO users (name, email, country)
VALUES ('Electro Master', 'electro.master@example.com', 'USA');


INSERT INTO orders (user_id, status)
VALUES (11, 'delivered')
RETURNING id;


INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT 
    18,              -- your actual order_id
    id,
    1,
    price
FROM products
WHERE category = 'Electronics';

SELECT 
    u.id,
    u.name
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.category = 'Electronics'
GROUP BY u.id, u.name
HAVING COUNT(DISTINCT p.id) = (
    SELECT COUNT(*)
    FROM products
    WHERE category = 'Electronics'
);
