-- Q:How to extract first name from Contact Name?

-- A: Well, here is your problem..
-- CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

WITH s1 -- Use a CTE and compare first_name to first_name2
	AS (SELECT t.ContactName
		, LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS frist_name
		, dbo.udf_parse_first_name(t.ContactName) AS first_name2
		FROM dbo.t_w3_schools_customers AS t)
	SELECT s1.*
	FROM s1
	WHERE s1.frist_name <> s1.first_name2; -- Expected result is 0 rows