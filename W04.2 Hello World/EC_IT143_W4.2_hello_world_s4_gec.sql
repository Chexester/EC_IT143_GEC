DROP VIEW IF EXISTS dbo.v_hello_world_load
GO

CREATE VIEW dbo.v_hello_world_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_hello_world_load
PURPOSE: Create the Hello World! - Load view for IT143

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/26/2025   GEChehda       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script is part of the assigment 4.2 Answer Focused Approach for T-SQL Data Manipulation
 
******************************************************************************************************************/

-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...

	SELECT 'HelloWorld' AS my_message
		, GETDATE () AS current_date_time;

GO