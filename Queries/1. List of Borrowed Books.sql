USE [TechLib];

-- EX #1 --
--List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned.--

DECLARE @BorrowerID int = 24;

SELECT b.[Book ID], b.[Title], l.[Due Date], l.[Date Returned]
From Loans AS l join Books AS b
ON l.[Book ID] = b.[Book ID]
WHERE l.[Borrower ID] = @BorrowerID;