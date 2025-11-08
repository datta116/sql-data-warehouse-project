-- Which 5 products generate the highest revenue?

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_product p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

--USING WINDOWS FUNCTIONS
SELECT * FROM (
SELECT 
p.product_name,
SUM(f.sales_amount) total_revenue,
ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS rank_products
FROM gold.fact_sales f
LEFT JOIN gold.dim_product p
ON p.product_key = f.product_key
GROUP BY p.product_name
)t WHERE rank_products <= 5

--What are the 5 worst-performing products in terms of sales?
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_product p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue 

