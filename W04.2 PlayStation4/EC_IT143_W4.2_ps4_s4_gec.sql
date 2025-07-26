DROP VIEW IF EXISTS dbo.vw_ps4_bestsales_2018
GO

CREATE VIEW dbo.vw_ps4_bestsales_2018
AS

/**********************************************************************************************************
NAME: dbo.ps4_games
PURPOSE: Create the PlayStation 4 Best Sales in 2018 - Load View

MODIFICATION LOG:
Ver			Date			Author			Description
-----		-----------		---------		---------------------------------------------------------------
1.0			07/22/2025		GEChehda		1. This script is for IT143 assigment 4.2 (EC_IT143) Community2


RUNTIME:
1s

Notes:
This script exists to help me learn about  the Answer focused approach for T-SQL data manipulation

**********************************************************************************************************/

SELECT Game
	, Release_date_a
	, Copies_sold
FROM dbo.ps4_games
WHERE YEAR (Release_date_a) = 2018
;