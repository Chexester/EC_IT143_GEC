CREATE PROCEDURE dbo.usp_hello_world_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_hello_world_load
PURPOSE: Create the Hello World! - Load user stored procedure for IT143

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/26/2025   GEChehda       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script is part of the assigment 4.2 Answer Focused Approach for T-SQL Data Manipulation (Steps 7 to 8)
 
******************************************************************************************************************/

	BEGIN
		
		-- 1) Reload data

		TRUNCATE TABLE dbo.t_hello_world;

		INSERT INTO dbo.t_hello_world
			   SELECT v.my_message
					, v.current_date_time
				FROM dbo.v_hello_world_load AS v;

		-- 2) Review results

		SELECT t.*
			FROM dbo.t_hello_world AS t;
	END
GO