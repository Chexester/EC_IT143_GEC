-- Question: Which PlayStation 4 games released in 2018 had the highest sales?

-- A: Let's review our SQL data to do so
-- Step 1 Use the columns Game, Release date, Sales
-- Step 2 Filter the games released in 2018

-- 1) Reload data

TRUNCATE TABLE dbo.tbl_ps4_bestsales_2018

INSERT INTO dbo.tbl_ps4_bestsales_2018
	SELECT Game
	,	Release_date_a
	,	CAST(REPLACE(Copies_sold, ' million', '') AS FLOAT) * 1000000 --Note: This CAST(REPLACE()) was added as the original table contained the word "million"
	FROM vw_ps4_bestsales_2018 AS vw;

-- 2) Review Results

SELECT * FROM dbo.tbl_ps4_bestsales_2018;