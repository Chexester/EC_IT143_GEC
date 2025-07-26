CREATE PROCEDURE dbo.usp_n64_bestsales_1998
AS

/*****************************************************************************************************
NAME:	dbo.usp_n64_bestsales_1998
PURPOSE: Nintendo 64 Best Sales in 1998 - Load user stored procedure

MODIFICATION LOG
Ver		Date			Author			Description
----	----------		------------	--------------------------------------------------------------
1.0		07/25/2025		GEChehda		1.Created this script for EC_143 (assigment 4.2)


RUNTIME:
1s

Notes:
This script is to present the assigment 4.2 required from IT143 related to Answer Focused Approach
******************************************************************************************************/

	BEGIN
		
		-- 1) Reload data

		TRUNCATE TABLE dbo.tbl_n64_bestsales_1998

		INSERT INTO dbo.tbl_n64_bestsales_1998
			SELECT Game
			,	Release_date
			,	Sales
			FROM vw_n64_bestsales_1998 AS vw;

		-- 2) Review Results

		SELECT * FROM dbo.tbl_n64_bestsales_1998;
	END
GO
