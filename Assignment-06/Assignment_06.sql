-- Create and use the database
CREATE DATABASE E_Commerce;
USE E_Commerce;

-- 1. Customers with their orders (even if none)
SELECT c.*, o.order_id
FROM Customers_287 c
LEFT JOIN Orders_287 o ON c.customer_id = o.customer_id;

-- 2. Orders with product names and quantity
SELECT o.order_id, p.name, oi.quantity
FROM Orders_287 o
JOIN Order_Items_287 oi ON o.order_id = oi.order_id
JOIN Products_287 p ON oi.product_id = p.product_id;

-- 3. Total orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders_287
GROUP BY customer_id;

-- 4. Total products by category
SELECT category, COUNT(*) AS total_products
FROM Products_287
GROUP BY category;

-- 5. Recent 30-day orders with customer names
SELECT o.*, c.name
FROM Orders_287 o
JOIN Customers_287 c ON o.customer_id = c.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- 6. Sellers selling 'Laptop'
SELECT DISTINCT s.*
FROM Sellers_287 s
JOIN Product_Sellers_287 ps ON s.seller_id = ps.seller_id
JOIN Products_287 p ON ps.product_id = p.product_id
WHERE p.name LIKE '%Laptop%';

-- 7. Customers who never ordered
SELECT c.*
FROM Customers_287 c
LEFT JOIN Orders_287 o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 8. Orders above average total
SELECT *
FROM Orders_287
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders_287);

-- 9. Customers with at least 2 orders
SELECT customer_id
FROM Orders_287
GROUP BY customer_id
HAVING COUNT(order_id) >= 2;

-- 10. Top 3 most ordered products
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items_287
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 3;

-- 11. Products sold by multiple sellers
SELECT product_id
FROM Product_Sellers_287
GROUP BY product_id
HAVING COUNT(DISTINCT seller_id) > 1;

-- 12. Sellers who never sold anything
SELECT s.*
FROM Sellers_287 s
LEFT JOIN Product_Sellers_287 ps ON s.seller_id = ps.seller_id
WHERE ps.product_id IS NULL;

-- 13. Products never ordered
SELECT p.*
FROM Products_287 p
LEFT JOIN Order_Items_287 oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- 14. Customer with most orders
SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders_287
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 1;

-- 15. Customers who ordered > 5 different products
SELECT o.customer_id
FROM Orders_287 o
JOIN Order_Items_287 oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
HAVING COUNT(DISTINCT oi.product_id) > 5;

-- 16. Products sold by multiple sellers but never ordered
SELECT p.*
FROM Products_287 p
JOIN Product_Sellers_287 ps ON p.product_id = ps.product_id
LEFT JOIN Order_Items_287 oi ON p.product_id = oi.product_id
GROUP BY p.product_id
HAVING COUNT(DISTINCT ps.seller_id) > 1 AND COUNT(oi.order_id) = 0;

-- 17. Customer who spent the most
SELECT o.customer_id, SUM(o.total_amount) AS total_spent
FROM Orders_287 o
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- 18. Customers who ordered OR live in seller's city
SELECT name, city FROM Customers_287
UNION
SELECT name, city FROM Sellers_287;

-- 19. Products in stock OR ordered
SELECT name FROM Products_287 WHERE stock > 0
UNION
SELECT p.name
FROM Products_287 p
JOIN Order_Items_287 oi ON p.product_id = oi.product_id;

-- 20. Products in stock AND ordered
SELECT name FROM Products_287 WHERE stock > 0
INTERSECT
SELECT p.name
FROM Products_287 p
JOIN Order_Items_287 oi ON p.product_id = oi.product_id;

-- 21. Customers who ordered AND live in seller cities
SELECT name, city FROM Customers_287
INTERSECT
SELECT name, city FROM Sellers_287;

-- 22. Customers who ordered every year (assuming at least 3 years in DB)
SELECT customer_id
FROM Orders_287
GROUP BY customer_id
HAVING COUNT(DISTINCT YEAR(order_date)) >= 3;
