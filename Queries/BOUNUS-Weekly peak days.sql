USE [TechLib];

-- BOUNUS --
	--Weekly peak days: The library is planning to employ a new part-time worker. This worker will work 3 days weekly in the library.
	--From the data you have, determine the most 3 days in the week that have the most share of the loans and display the result of each
	--day as a percentage of all loans. Sort the results from the highest percentage to the lowest percentage.
	--(eg. 25.18% of the loans happen on Monday...)

DECLARE @NumbOfDays INT = 3;

WITH TopNPeakDays
AS
(
	SELECT TOP(@NumbOfDays) DATENAME(WEEKDAY, [Date Borrowed]) AS Day, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS Percentage
	FROM Loans
	GROUP BY  DATENAME(WEEKDAY, [Date Borrowed])
	ORDER BY COUNT(*) DESC
) SELECT CONCAT(FORMAT([Percentage], 'N2'), '%  of the loans happen on ', Day)
  FROM TopNPeakDays;
