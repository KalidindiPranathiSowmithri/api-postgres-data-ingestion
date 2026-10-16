--Customer Orders

SELECT
c.customer_name,
o.product_name,
o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


--Total Sales Per Customer

SELECT
c.customer_name,
SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


--TOP customers


SELECT
c.customer_name,
SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;

--Monthly Revenue

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

--Average Order Value

SELECT
    ROUND(AVG(amount),2) AS average_order_value
FROM orders;

--Number of Orders Per Customer

SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--Highest Value Order

SELECT
    c.customer_name,
    o.product_name,
    o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC
LIMIT 1;

--Product-wise Revenue

SELECT
    product_name,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY product_name
ORDER BY total_revenue DESC;