DROP VIEW IF EXISTS dbo.vw_n64_bestsales_1998
GO

CREATE VIEW dbo.vw_n64_bestsales_1998
AS

/**********************************************************************************************************
NAME: dbo.n64_games
PURPOSE: Create the N64 Best Sales in 1998 - Load View

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
	, Release_date
	, Sales
FROM dbo.n64_games
WHERE YEAR (Release_date) = 1998
;