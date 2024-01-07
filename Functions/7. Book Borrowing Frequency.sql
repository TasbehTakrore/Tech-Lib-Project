USE [TechLib];

-- EX #7 --
-- 7. Database Function - Book Borrowing Frequency:
--    - Function Name: `fn_BookBorrowingFrequency`
--    - Purpose: Gauge the borrowing frequency of a book.
--    - Parameter: `BookID`
--    - Implementation: Count the number of times the book has been issued.
--    - Return: Borrowing count of the book.

CREATE OR ALTER FUNCTION fn_BookBorrowingFrequency(
	@BookID INT
)
RETURNS INT
BEGIN
	DECLARE @BorrowingCount  INT;
	SELECT @BorrowingCount = COUNT(*)
	FROM Loans
	WHERE [Book ID] = @BookID;
	RETURN @BorrowingCount;
END;

DECLARE @BookID INT = 10;
DECLARE @BorrowingCount INT;

SET @BorrowingCount = dbo.fn_BookBorrowingFrequency(@BookID);
SELECT @BorrowingCount AS BorrowingCount;
