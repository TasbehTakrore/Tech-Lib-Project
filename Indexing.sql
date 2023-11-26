USE [TechLib];

CREATE UNIQUE INDEX idx_Books_BookID ON Books([Book ID]);
CREATE UNIQUE INDEX idx_Borrowers_BorrowerID ON Borrowers([Borrower ID]);
CREATE UNIQUE INDEX idx_Loans_LoanID ON Loans([Loan ID]);

CREATE INDEX idx_Loans_DateBorrowed ON Loans([Date Borrowed]);
CREATE INDEX idx_Loans_DateReturned ON Loans([Date Returned]);

