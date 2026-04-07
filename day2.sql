-- =========================================================
-- SQL JOIN Practice — Use Programiz Online Compiler
-- Database already available there:
-- https://www.programiz.com/sql/online-compiler
-- Tables present:
-- Customers, Orders, Shippings
-- =========================================================
-- =========================================================
-- Q1 — INNER JOIN
-- Show customers who placed orders
-- Output:
-- first_name | last_name | item | amount
-- =========================================================
SELECT
    c.first_name,
    c.last_name,
    o.item,
    o.amount
FROM
    orders o
    INNER JOIN customers c ON o.customer_id = c.customer_id;

-- =========================================================
-- Q2 — LEFT JOIN
-- Show all customers and their orders
-- Customers with no orders should still appear
-- Output:
-- first_name | item | amount
-- =========================================================
SELECT
    c.first_name,
    o.item,
    o.amount
FROM
    customers c
    LEFT JOIN orders o ON o.customer_id = c.customer_id;

-- =========================================================
-- Q3 — RIGHT JOIN
-- Show all orders even if customer missing
-- Output:
-- order_id | first_name | item
-- =========================================================
SELECT
    o.order_id,
    c.first_name,
    o.item
FROM
    customers c
    RIGHT JOIN orders o ON o.customer_id = c.customer_id;

-- =========================================================
-- Q4 — FULL OUTER JOIN
-- Show all customers and all orders
-- Output:
-- first_name | item
-- =========================================================
SELECT
    c.first_name,
    o.item
FROM
    customers c
    FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

-- =========================================================
-- Q5 — JOIN 3 TABLES
-- Show customer name, item ordered and shipping status
-- Output:
-- first_name | item | status
-- =========================================================
SELECT
    c.first_name,
    o.item,
    s.status
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN shippings s ON s.customer = c.customer_id;

-- =========================================================
-- Q6 — SELF JOIN
-- Find customers from same country
-- Do not match same row
-- Output:
-- customer1 | customer2 | country
-- =========================================================
SELECT
    c1.first_name AS customer1,
    c2.first_name AS customer2,
    c1.country
FROM
    customers c1
    JOIN customers c2 ON c1.country = c2.country
        AND c1.customer_id <> c2.customer_id;

-- match rows except the same row
-- <> means NOT EQUAL
-- =========================================================
-- Q7 — CROSS JOIN
-- Show all combinations of customers and shipping statuses
-- Output:
-- customer_name | shipping_status
-- =========================================================
SELECT
    c.first_name AS customer_name,
    s.status AS shipping_status
FROM
    customers c
    CROSS JOIN shippings s;

