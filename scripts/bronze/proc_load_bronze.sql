/*
=======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=======================================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
      - Truncates the bronze tables before loading data.
      - Uses the `BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze. load_bronze;
=======================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '========================================';
		PRINT 'Loading Bronze Layer';
		PRINT '========================================';

		PRINT'------------------------------------';
		PRINT'Loading CRM Tables';
		PRINT'------------------------------------';


		PRINT'+++++++++++++++++++++++++++++++++++++';
		PRINT'CRM_CUSTOMER_TABLE';
		PRINT'+++++++++++++++++++++++++++++++++++++';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Data with Baara\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SELECT COUNT(*) FROM bronze.crm_cust_info
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
		print '--------';
		PRINT'+++++++++++++++++++++++++++++++++++++';
		PRINT 'CRM_PRODUCT_TABLE';
		PRINT'+++++++++++++++++++++++++++++++++++++';
	
		SET @start_time = GETDATE();
	    PRINT '>> Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Data with Baara\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SELECT COUNT(*) FROM bronze.crm_prd_info
		SET @end_time = GETDATE()
		PRINT '>> Load Duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
		print '--------';
		PRINT'+++++++++++++++++';
		PRINT'+++++++++++++++++++++++++++++++++++++';
		PRINT'CRM_SALES_TABLE';
		PRINT'+++++++++++++++++++++++++++++++++++++';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Data with Baara\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SELECT COUNT(*) FROM bronze.crm_prd_info

		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
		print '--------';
		PRINT '------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------------';


		PRINT'+++++++++++++++++++++++++++++++++++++';
		PRINT'ERP_CUST_TABLE';
		PRINT'+++++++++++++++++++++++++++++++++++++';
	
		SET @start_time = GETDATE();
	    PRINT '>> Truncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data Into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Data with Baara\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SELECT COUNT(*) FROM bronze.erp_cust_az12

		SELECT COUNT(*) FROM bronze.crm_cust_info
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
		print '--------';

		PRINT'+++++++++++++++++++++++++++++++++++++';
		PRINT'ERP_LOC_TABLE';
		PRINT'+++++++++++++++++++++++++++++++++++++';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Data with Baara\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SELECT COUNT(*) FROM bronze.erp_loc_a101

		SELECT COUNT(*) FROM bronze.crm_cust_info
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)+'seconds';
		print '--------';
		PRINT'+++++++++++++++++++++++++++++++++++++';
		PRINT 'ERP_LOC_TABLE';
		PRINT'+++++++++++++++++++++++++++++++++++++';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Data with Baara\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2
		SELECT COUNT(*) FROM bronze.crm_cust_info
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
		print '--------';
		END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADIN BRONZE LAYER'
		PRINT 'Error Message:' + ERROR_MESSAGE();
		PRINT 'Error Number:' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Number:' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END
		SET @batch_end_time = GETDATE();
		PRINT '>> Bronze Layer Load Duration:' + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS NVARCHAR)+ 'seconds';
		print '--------';
