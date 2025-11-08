
-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

--Find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) AS avg_selling_price FROM gold.fact_sales

--Find the Total number of Orders
SELECT COUNT( order_name) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_name) AS total_orders FROM gold.fact_sales --MUST USE THIS

--Find the total number of products
SELECT COUNT(DISTINCT product_key) AS total_products FROM gold.dim_product 

-- Find the total number of customers
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales

--Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers_with_orders FROM gold.fact_sales
USE DataWarehouse

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_name) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) FROM gold.dim_product
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) FROM gold.dim_customer
