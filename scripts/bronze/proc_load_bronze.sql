/*
USAGE EXAMPLE :
EXEC bronze.load_bronze
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @starttime datetime , @endtime datetime, @batch_starttime datetime , @batch_endtime datetime
	SET @batch_starttime = GETDATE()
	BEGIN TRY
		PRINT '>>>TRUNCATING bronze.crm_cust_info'
		set @starttime = GETDATE()
		TRUNCATE TABLE bronze.crm_cust_info
		PRINT'>>>INSERTING DATA INTO bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\LENOVO\Desktop\datawarehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		set @endtime = GETDATE()
		PRINT 'DURATION TIME: ' +CAST(DATEDIFF(SECOND , @starttime, @endtime) AS NVARCHAR) + 'seconds'
	
		PRINT '>>>TRUNCATING bronze.crm_prd_info'
		set @starttime = GETDATE()
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT'>>>INSERTING DATA INTO bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info 
		FROM 'C:\Users\LENOVO\Desktop\datawarehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		set @endtime = GETDATE()
		PRINT 'DURATION TIME: ' +CAST(DATEDIFF(SECOND , @starttime, @endtime) AS NVARCHAR) + 'seconds'

		PRINT '>>>TRUNCATING bronze.crm_sales_details'
		set @starttime = GETDATE()
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT'INSERTING DATA INTO bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\LENOVO\Desktop\datawarehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		set @endtime = GETDATE()
		PRINT 'DURATION TIME: ' +CAST(DATEDIFF(SECOND , @starttime, @endtime) AS NVARCHAR) + 'seconds'

		PRINT '>>>TRUNCATING bronze.erm_cust_az12'
		set @starttime = GETDATE()
		TRUNCATE TABLE bronze.erm_cust_az12
		PRINT'>>>INSERTING DATA INTO bronze.erm_cust_az12'
		BULK INSERT bronze.erm_cust_az12
		FROM 'C:\Users\LENOVO\Desktop\datawarehouse\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		set @endtime = GETDATE()
		PRINT 'DURATION TIME: ' +CAST(DATEDIFF(SECOND , @starttime, @endtime) AS NVARCHAR) + 'seconds'

		PRINT '>>>TRUNCATING bronze.erm_loc_a101'
		SET @starttime =GETDATE()
		TRUNCATE TABLE bronze.erm_loc_a101
		PRINT'>>>INSERTING DATA INTO bronze.erm_loc_a101'
		BULK INSERT bronze.erm_loc_a101
		FROM 'C:\Users\LENOVO\Desktop\datawarehouse\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @endtime = GETDATE()
		PRINT 'DURATION TIME: ' +CAST(DATEDIFF(SECOND , @starttime, @endtime) AS NVARCHAR) + 'seconds'

		PRINT '>>>TRUNCATING bronze.erm_px_cat_g1v2'
		SET @starttime= GETDATE()
		TRUNCATE TABLE bronze.erm_px_cat_g1v2
		PRINT'>>>INSERTING DATA INTO bronze.erm_px_cat_g1v2'
		BULK INSERT bronze.erm_px_cat_g1v2
		FROM 'C:\Users\LENOVO\Desktop\datawarehouse\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		set @endtime = GETDATE()
		PRINT 'DURATION TIME: ' +CAST(DATEDIFF(SECOND , @starttime, @endtime) AS NVARCHAR) + 'seconds'
		SET @batch_endtime = GETDATE()
		PRINT 'TOTAL DURATION LOADING:' + CAST(DATEDIFF(SECOND , @batch_starttime , @batch_endtime) As NVARCHAR) + 'seconds'
	END TRY
	BEGIN CATCH
		PRINT 'ERROR ACCURED DURING LOADIN BRONZE LAYER...'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE()
		PRINT 'ERROR MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR) 
		PRINT 'ERROR MESSAGE' + CAST (ERROR_STATE() AS NVARCHAR)
	END CATCH

END


