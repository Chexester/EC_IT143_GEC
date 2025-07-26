-- Question: Which PlayStation 4 games released in 2018 had the highest sales?

-- A: Let's review our SQL data to do so
-- Step 1 Use the columns Game, Release date, Sales
-- Step 2 Filter the games released in 2018

DROP TABLE IF EXISTS tbl_ps4_bestsales_2018;
GO

CREATE TABLE tbl_ps4_bestsales_2018 (
	Game NVARCHAR(100) NOT NULL PRIMARY KEY
	,Release_date_a DATE NOT NULL
	,Copies_sold INT NOT NULL
);