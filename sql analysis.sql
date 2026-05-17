CREATE TABLE superstore (
    row_id INT,
    order_id TEXT,
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT,
    customer_id TEXT,
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(5,2),
    profit NUMERIC(10,2)


SET datestyle = 'MDY, ISO';

COPY public.superstore
FROM 'C:\Sample - Superstore.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';

SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    AVG(discount) AS avg_discount
FROM public.superstore;



SELECT
    customer_name,
    segment,
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM public.superstore
GROUP BY customer_name, segment, region
ORDER BY total_sales DESC
LIMIT 10;


SELECT
    segment,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales
FROM public.superstore
GROUP BY segment
ORDER BY total_sales DESC;




SELECT
    sub_category,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM public.superstore
GROUP BY sub_category
ORDER BY total_sales DESC;