/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.
      This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

Note:
    The BULK INSERT paths point to 'C:\sql\dwh_project\01_datasets\'.
    Change them to the folder where you saved the datasets.
===============================================================================
*/

create or alter procedure bronze.load_bronze as 
begin
declare @start_time datetime, @end_time datetime,
@batch_start_time datetime, @batch_end_time datetime;
begin try
set @batch_start_time = getdate();
print '========================================='

print 'loading bronze layer '
print '========================================='
print '-----------------------------------------'
print 'loading crm tables'
print '-----------------------------------------'

set @start_time  =getdate();
truncate table 
bronze.crm_cust_info ;
bulk insert bronze.crm_cust_info
from 'C:\Users\Ashish\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
with (firstrow = 2,
fieldterminator = ',',
tablock 
);
set @end_time  =getdate();
print '>>loading time >>' + cast(datediff(second , @start_time,@end_time)as nvarchar) + 'seconds';
print'------------------------------------';


--table 2 
set @start_time  =getdate();
truncate table 
bronze.crm_prd_info ;
bulk insert bronze.crm_prd_info
from 'C:\Users\Ashish\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
with (firstrow = 2,
fieldterminator = ',',
tablock 
);
set @end_time  =getdate();
print '>>loading time >>' + cast(datediff(second , @start_time,@end_time)as nvarchar) + 'seconds';
print'------------------------------------';


--table 3
set @start_time  =getdate();
truncate table 
bronze.crm_sales_details ;
bulk insert bronze.crm_sales_details
from 'C:\Users\Ashish\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
with (firstrow = 2,
fieldterminator = ',',
tablock 
);
set @end_time  =getdate();
print '>>loading time >>' + cast(datediff(second , @start_time,@end_time)as nvarchar) + 'seconds';
print'------------------------------------';

print '-----------------------------------------'

print 'loading erp tables'
print '-----------------------------------------'

--table 4
set @start_time  =getdate();
truncate table 
bronze.erp_loc_a101 ;
bulk insert bronze.erp_loc_a101
from 'C:\Users\Ashish\Downloads\sql-data-warehouse-project-main\01_datasets\source_erp\LOC_A101.csv'
with (firstrow = 2,
fieldterminator = ',',
tablock 
);
set @end_time  =getdate();
print '>>loading time >>' + cast(datediff(second , @start_time,@end_time)as nvarchar) + 'seconds';
print'------------------------------------';


--table 5
set @start_time  =getdate();
truncate table 
bronze.erp_px_cat_g1v2 ;
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\Ashish\Downloads\sql-data-warehouse-project-main\01_datasets\source_erp\PX_CAT_G1V2.csv'
with (firstrow = 2,
fieldterminator = ',',
tablock 
);
set @end_time  =getdate();
print '>>loading time >>' + cast(datediff(second , @start_time,@end_time)as nvarchar) + 'seconds';
print'------------------------------------';


--table 6
set @start_time  =getdate();
truncate table 
bronze.erp_ust_az12 ;
bulk insert bronze.erp_ust_az12
from 'C:\Users\Ashish\Downloads\sql-data-warehouse-project-main\01_datasets\source_erp\CUST_AZ12.csv'
with (firstrow = 2,
fieldterminator = ',',
tablock 
);set @end_time  =getdate();
print '>>loading time >>' + cast(datediff(second , @start_time,@end_time)as nvarchar) + ' secondss';
print'------------------------------------';
set @batch_end_time =getdate();
print'====================================='
print 'bronze layer loading completed '
print '-total duration ' + cast(datediff(second , @batch_start_time , @batch_end_time) as nvarchar) + ' secondss';
print'====================================='

end try
begin catch 
print '==========================================='
print 'error message '+ cast(error_message() as nvarchar);
print 'error message '+ cast (error_number() as nvarchar) ;
print '==========================================='

end catch

end
