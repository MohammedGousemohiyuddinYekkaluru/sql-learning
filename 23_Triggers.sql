/* ==============================================================================
   SQL Triggers
-------------------------------------------------------------------------------
   This script demonstrates the creation of a logging table, a trigger, and
   an insert operation into the Sales.Employees table that fires the trigger.
   The trigger logs details of newly added employees into the Sales.EmployeeLogs table.
=================================================================================
*/

-- Step 1: Create Log Table
CREATE TABLE Sales.EmployeeLogs
(
    LogID      INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    LogMessage VARCHAR(255),
    LogDate    DATE
);
GO