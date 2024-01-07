USE [TechLib];

-- EX #11 --
-- 11. Stored Procedure - Borrowed Books Report:
--    - Procedure Name: `sp_BorrowedBooksReport`
--    - Purpose: Generate a report of books borrowed within a specified date range.
--    - Parameters: `StartDate`, `EndDate`
--    - Implementation: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date.
--    - Return: Tabulated report of borrowed books.

CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport
	@StartDate DATE,
	@EndDate DATE
AS
BEGIN
	SELECT bk.[Title], CONCAT(b.[First Name], ' ', b.[Last Name]) AS [Borrower Name], l.[Date Borrowed]
	FROM Loans l
	JOIN Borrowers b ON l.[Borrower ID] = b.[Borrower ID]
	JOIN Books bk ON l.[Book ID] = bk.[Book ID]
	WHERE l.[Date Borrowed] BETWEEN @StartDate AND @EndDate
END;

DECLARE @StartDate DATE = '2023-01-11';
DECLARE @EndDate DATE = '2023-01-30';

EXEC sp_BorrowedBooksReport @StartDate, @EndDate;