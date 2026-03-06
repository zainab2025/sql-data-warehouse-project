
IF OBJECT_ID(' bronze.crm_cust_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info;
GO
create table bronze.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_marital_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date date
	)
GO
IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
GO
CREATE TABLE bronze.crm_prd_info(
	prd_id int,
	prd_key nvarchar(50),
	prd_nm nvarchar(50),
	prd_cost int,
	prd_line nvarchar(50),
	prd_start_dt datetime,
	prd_end_dt datetime
)
GO
IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
GO
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num nvarchar(50),
	sls_prd_key nvarchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int
)
GO
IF OBJECT_ID('bronze.erm_cust_az12','U') IS NOT NULL
	DROP TABLE bronze.erm_cust_az12;
GO
CREATE TABLE bronze.erm_cust_az12(
	CID nvarchar(50),
	BDATE date,
	GEN nvarchar(50)
)
GO
IF OBJECT_ID('bronze.erm_loc_a101','U') IS NOT NULL
	DROP TABLE bronze.erm_loc_a101;
GO
CREATE TABLE bronze.erm_loc_a101(
	CID nvarchar(50),
	CNTRY nvarchar(50)
)
GO
IF OBJECT_ID('bronze.erm_px_cat_g1v2','U') IS NOT NULL
	DROP TABLE bronze.erm_px_cat_g1v2;
GO
CREATE TABLE bronze.erm_px_cat_g1v2(
ID nvarchar(50),
CAT nvarchar(50),
subcat nvarchar(50),
maitenance nvarchar(50)
)

