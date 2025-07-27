-- 1. Total amount spent by customer ID 3
SELECT SUM(total_amount) AS total_spent
FROM Orders_287
WHERE customer_id = 3;

-- 2. Total revenue from all orders
SELECT SUM(total_amount) AS total_revenue
FROM Orders_287;

-- 3. Stock value = price * stock
SELECT product_id, name, price, stock, (price * stock) AS stock_value
FROM Products_287;

-- 4. Customers above 30 years in New York
SELECT * FROM Customers_287
WHERE age > 30 AND city = 'New York';

-- 5. Customers in LA or orders > $500
SELECT DISTINCT c.*
FROM Customers_287 c
LEFT JOIN Orders_287 o ON c.customer_id = o.customer_id
WHERE c.city = 'Los Angeles' OR o.total_amount > 500;

-- 6. Products in stock < $50
SELECT * 
FROM Products_287
WHERE stock > 0 AND price < 50;

-- 7. Products with stock < 5
SELECT * 
FROM Products_287
WHERE stock < 5;

-- 8. Orders not completed
SELECT * 
FROM Orders_287
WHERE status != 'Completed';

-- 9. Out of stock or Electronics category
SELECT * 
FROM Products_287
WHERE stock = 0 OR category = 'Electronics';

-- 10. Gmail email addresses
SELECT email
FROM Customers_287
WHERE email LIKE '%@gmail.com';

-- 11. Product names containing 'Phone'
SELECT name
FROM Products_287
WHERE name LIKE '%Phone%';

-- 12. Customers with 5-character names
SELECT * 
FROM Customers_287
WHERE LENGTH(name) = 5;

-- 13. Products with 'Laptop' or 'Tablet'
SELECT * 
FROM Products_287
WHERE name LIKE '%Laptop%' OR name LIKE '%Tablet%';

-- 14. Orders placed in 2024
SELECT * 
FROM Orders_287
WHERE YEAR(order_date) = 2024;

-- 15. Customers in New York, LA, or Chicago
SELECT * 
FROM Customers_287
WHERE city IN ('New York', 'Los Angeles', 'Chicago');

-- 16. Products not in 'Electronics' or 'Clothing'
SELECT * 
FROM Products_287
WHERE category NOT IN ('Electronics', 'Clothing');

-- 17. Orders by customer IDs 1, 3, 5
SELECT * 
FROM Orders_287
WHERE customer_id IN (1, 3, 5);

-- 18. Customers with no orders
SELECT * 
FROM Customers_287 c
LEFT JOIN Orders_287 o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 19. Orders in the last 30 days
SELECT * 
FROM Orders_287
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 20. Orders where total_amount is multiple of 100
SELECT * 
FROM Orders_287
WHERE total_amount % 100 = 0;
