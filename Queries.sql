-- Query 1: Monthly Revenue & Order Volume

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(total_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

-- Query 2: Top 3 Months by Sales

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(total_amount) AS total_revenue
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    total_revenue DESC
LIMIT 3;

-- query 4 : Total Sales Per Year

SELECT
    YEAR(order_date) AS order_year,
    SUM(total_amount) AS yearly_revenue
FROM
    orders
GROUP BY
    order_year
ORDER BY
    order_year;

-- Query 4 : Monthly Average Order Value (AOV)

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    AVG(total_amount) AS avg_order_value
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

-- query 5: Order Volume Per Status (Delivered, Cancelled, etc.)

SELECT
    status,
    COUNT(*) AS total_orders
FROM
    orders
GROUP BY
    status
ORDER BY
    total_orders DESC;

-- query 6 : Top 5 Best Selling Products (by Quantity)

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM
    order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    total_quantity_sold DESC
LIMIT 5;

-- query 7: Top 5 Revenue Generating Products

SELECT
    p.product_name,
    SUM(oi.price * oi.quantity) AS revenue_generated
FROM
    order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    revenue_generated DESC
LIMIT 5;

