/*
==============================================================================
DDL Script: Create Bronze Tables
==============================================================================

Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    If they already exist.
    Run this script to redefine the DDL structure of 'bronze' Tables
==============================================================================
*/

USE dataWarehouse;

IF object_id('bronze.crm_cust_info', 'U') IS NOT NULL
   DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
   cst_id int,
   cst_key NVARCHAR(50), 
   cst_firstname NVARCHAR(50),
   cst_lastname NVARCHAR(50), 
   cst_marital_status NVARCHAR(50), 
   cst_gndr NVARCHAR(50),
   cst_create_date DATE
)

IF object_id('bronze.crm_prd_info', 'U') IS NOT NULL
   DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
   prd_id int,
   prd_key NVARCHAR(50),
   prd_nm NVARCHAR(50),
   prd_cost int,
   prd_line NVARCHAR(50),
   prd_start_dt datetime,
   prd_end_dt datetime
)

IF object_id('bronze.crm_sales_details', 'U') IS NOT NULL
   DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
   sls_ord_num NVARCHAR(50),
   sls_prd_key NVARCHAR(50),
   sls_cust_id int,
   sls_order_dt int,
   sls_ship_dt int,
   sls_due_dt int,
   sls_sales int,
   sls_quantity int,
   sls_price int
)



SELECT 
   *
FROM bronze.crm_cust_info;

SELECT 
 *
FROM bronze.crm_prd_info;

SELECT 
 *
FROM bronze.crm_sales_details;

IF object_id('bronze.erp_cust_az12', 'U') IS NOT NULL
   DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12(
  cid NVARCHAR(50),
  bdate date,
  gen NVARCHAR(50)
);

IF object_id('bronze.erp_loc_a101', 'U') IS NOT NULL
   DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
  cid NVARCHAR(50),
  cntry NVARCHAR(50)
);


IF object_id('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
   DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
  id NVARCHAR(50),
  cat NVARCHAR(50),
  subcat NVARCHAR(50),
  maintenance NVARCHAR(50)
)

SELECT 
 *
FROM bronze.erp_cust_az12;

SELECT 
 *
FROM bronze.erp_loc_a101;

SELECT 
 *
FROM bronze.erp_px_cat_g1v2;

----------------------------------------------------------------------------

SELECT 
   COUNT(*)
FROM bronze.crm_cust_info;  -- +1 is a header row in the CSV file.
