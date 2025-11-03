/*
===============================================
Create Database and Schemas
===============================================
Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
within the database: 'bronze', 'silver', and 'gold'.

WARNING: Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.
*/

-- Switch to the master database (required for database-level operations)
USE master;
GO

-- Check if the database 'DataWarehouse' already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force all connections to close immediately with rollback of any open transactions
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the existing DataWarehouse database
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a fresh DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created DataWarehouse database
USE DataWarehouse;
GO

-- Create the 'bronze' schema (typically used for raw, unprocessed data)
CREATE SCHEMA bronze;
GO

-- Create the 'silver' schema (typically used for cleaned and integrated data)
CREATE SCHEMA silver;
GO

-- Create the 'gold' schema (typically used for aggregated, business-ready data)
CREATE SCHEMA gold;
GO
