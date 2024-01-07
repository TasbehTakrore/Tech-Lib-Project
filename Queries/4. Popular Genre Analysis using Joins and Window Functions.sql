USE [TechLib];

-- EX #4 --
-- Popular Genre Analysis using Joins and Window Functions: Identify the most popular genre for a given month. --

DECLARE @Month int = 12;

SELECT TOP(1)[Genre], COUNT(*) count
FROM Loans l 
JOIN Books b ON l.[Book ID] = b.[Book ID]
WHERE MONTH(l.[Date Borrowed]) = @Month
GROUP BY [Genre]
ORDER BY COUNT(*) DESC;