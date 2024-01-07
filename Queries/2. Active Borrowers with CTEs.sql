USE [TechLib];

-- EX #2 --
-- Active Borrowers with CTEs: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs. --

WITH BorrowersUnreturnedMoreThan1Book AS
(
	SELECT [Borrower ID], COUNT(*) Count
	FROM Loans 
	WHERE [Date Returned] IS Null
	GROUP BY [Borrower ID]
	HAVING COUNT(*) > 1
)SELECT * FROM BorrowersUnreturnedMoreThan1Book;