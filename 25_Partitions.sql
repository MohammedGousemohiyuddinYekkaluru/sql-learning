/* ==============================================================================
   SQL Partitioning
-------------------------------------------------------------------------------
   This script demonstrates SQL Server partitioning features. It covers the
   creation of partition functions, filegroups, data files, partition schemes,
   partitioned tables, and verification queries. It also shows how to compare
   execution plans between partitioned and non-partitioned tables.

   Table of Contents:
     1. Create a Partition Function
     2. Create Filegroups
     3. Create Data Files
     4. Create Partition Scheme
     5. Create the Partitioned Table
     6. Insert Data Into the Partitioned Table
     7. Verify Partitioning and Compare Execution Plans
=================================================================================
*/

/* ==============================================================================
   Step 1: Create a Partition Function
============================================================================== */

-- Create Left Range Partition Functions based on Years
CREATE PARTITION FUNCTION PartitionByYear (DATE)
AS RANGE LEFT FOR VALUES ('2023-12-31', '2024-12-31', '2025-12-31')

-- Query lists all existing Partition Function
SELECT 
	name,
	function_id,
	type,
	type_desc,
	boundary_value_on_right
FROM sys.partition_functions

/* ==============================================================================
   Step 2: Create Filegroups
============================================================================== */

-- Create Filegroups in SalesDB
ALTER DATABASE SalesDB ADD FILEGROUP FG_2023;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2024;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2025;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2026;

-- Optional: Remove a Filegroup if needed
ALTER DATABASE SalesDB REMOVE FILEGROUP FG_2023;

-- Query: List All Existing Filegroups (filter by name pattern if needed)
SELECT *
FROM sys.filegroups
WHERE type = 'FG'

/* ==============================================================================
   Step 3: Create Data Files
============================================================================== */

-- Create Files and map them to Filegroups
ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2023, -- Logical Name
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2023.ndf'
) TO FILEGROUP FG_2023;

ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2024, -- Logical Name
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2024.ndf'
) TO FILEGROUP FG_2024;

ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2025, -- Logical Name
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2025.ndf'
) TO FILEGROUP FG_2025;

ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2026, -- Logical Name
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2026.ndf'
) TO FILEGROUP FG_2026;

-- Query: List All Existing Files in SalesDB
SELECT 
    fg.name AS FilegroupName,
    mf.name AS LogicalFileName,
    mf.physical_name AS PhysicalFilePath,
    mf.size / 128 AS SizeInMB
FROM 
    sys.filegroups fg
JOIN 
    sys.master_files mf ON fg.data_space_id = mf.data_space_id
WHERE 
    mf.database_id = DB_ID('SalesDB')