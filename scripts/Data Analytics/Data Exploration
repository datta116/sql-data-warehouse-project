-- ***************************************************************
-- SQL Query Block 1: Explore Database Tables
-- ***************************************************************
-- Description: This query retrieves metadata about all tables 
-- and views that are accessible to the current user in the 
-- current database. It's useful for exploring the database 
-- structure and seeing what tables exist.
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- ***************************************************************
-- SQL Query Block 2: Select Target Database
-- ***************************************************************
-- Description: This command changes the database context. 
-- All subsequent queries will be run against the 
-- 'DataWarehouseAnalytics' database.
USE DataWarehouseAnalytics;

-- ***************************************************************
-- SQL Query Block 3: Inspect Specific Table Columns
-- ***************************************************************
-- Description: This query retrieves column-level metadata 
-- (like column name, data type, max length, etc.) 
-- for a specific table named 'dim_customers'. 
-- It helps in understanding the structure of that single table.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';

-- ***************************************************************
-- SQL Query Block 4: Analyze Sales Date Range
-- ***************************************************************
-- Description: This query analyzes the 'fact_sales' table 
-- (in the 'gold' schema) to find key date information.
-- It calculates:
--   1. first_order_date: The earliest (minimum) order date.
--   2. last_order_date: The latest (maximum) order date.
--   3. Order_range_months: The total number of months between 
--      the first and last order.
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(month, MIN(order_date), MAX(order_date)) AS Order_range_months
FROM gold.fact_sales;

-- ***************************************************************
-- SQL Query Block 5: Analyze Customer Age Range
-- ***************************************************************
-- Description: This query analyzes the 'dim_customer' table 
-- (in the 'gold' schema) to find customer birth date and 
-- age information.
-- It calculates:
--   1. first_birth_date: The earliest (oldest) birth date.
--   2. last_birth_date: The latest (youngest) birth date.
--   3. oldest_age: The age of the oldest customer in years,
--      calculated relative to the current date (GETDATE()).
--   4. youngest_age: The age of the youngest customer in years,
--      calculated relative to the current date (GETDATE()).
SELECT
    MIN(birth_date) AS first_birth_date,
    MAX(birth_date) AS last_birth_date,
    DATEDIFF(year, MIN(birth_date), GETDATE()) AS oldest_age,
    DATEDIFF(year, MAX(birth_date), GETDATE()) AS youngest_age
FROM gold.dim_customer;

USE DataWarehouse
--EXPLORE ALL COUNTRIES OF OUR CUST
SELECT DISTINCT country FROM gold.dim_customer

--EXPLORE ALL CATEGORIES OF OUR PRODUCTS 'THE MAJOR DIVISION'
SELECT DISTINCT category_name,subcategory,product_name FROM gold.dim_product
ORDER BY 1,2,3
