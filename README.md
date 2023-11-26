# Tech-Lib-Project

## Table of Contents

- [Table of Contents](#Table-of-Contents)
- [Description](#description)
- [ER Diagrame](#ER-Diagram)
- [Complex Queries and Procedures](#Complex-Queries-and-Procedures)
- [Contact](#Contact)


## Description
The Library Management System (Tech-Lib-Project) is a database project designed to help a local library transition from traditional bookkeeping to a digital system. This project includes the design and implementation of a relational database using MS SQL to efficiently track books, borrowers, loans, offer insights into borrowing trends... etc.


## ER Diagram
![ERD](https://github.com/TasbehTakrore/Tech-Lib-Project/assets/71009816/ba92d9c8-cce7-4d48-990c-686942227142)

 - **Books**:
    - BookID (PK)  INT
    - Title   VARCHAR(200)
    - Author  VARCHAR(200)
    - ISBN VARCHAR(17)
    - Published Date (DATE)
    - Genre  VARCHAR(50)
    - Shelf Location VARCHAR(200)
    - Current Status ('Available' or 'Borrowed') ??
- **Borrowers**:
    - BorrowerID (PK)
    - First Name
    - Last Name
    - Email
    - Date of Birth
    - Membership Date
- **Loans**:
    - LoanID (PK)
    - BookID (FK)
    - BorrowerID (FK)
    - Date Borrowed
    - Due Date
    - Date Returned (NULL if not returned yet)

## Complex Queries and Procedures

### 1. List of Borrowed Books
**Rationale:** This query aims to retrieve all books borrowed by a specific borrower, including those currently unreturned. It serves the purpose of providing librarians with a quick overview of a borrower's current and past loans.

### 2. Active Borrowers with CTEs
**Rationale:** Utilizing Common Table Expressions (CTEs), this query identifies borrowers who have borrowed 2 or more books but haven't returned any. This information is valuable for tracking borrower engagement and identifying potential overdue issues.

### 3. Borrowing Frequency using Window Functions
**Rationale:** By ranking borrowers based on borrowing frequency, this query offers insights into the most active library users. It helps the library staff understand user behavior and tailor services accordingly.

### 4. Popular Genre Analysis using Joins and Window Functions
**Rationale:** This query identifies the most popular genre for a given month, providing the library with valuable information to optimize their book collection based on user preferences.

### 5. Stored Procedure - Add New Borrowers
**Rationale:** The stored procedure streamlines the process of adding a new borrower. It checks if the email already exists and either adds the new borrower to the system or returns an error message, ensuring data integrity.

### 6. Database Function - Calculate Overdue Fees
**Rationale:** This function computes overdue fees for a given loan, helping the library automate and standardize the fee calculation process based on overdue days.

### 7. Database Function - Book Borrowing Frequency
**Rationale:** The function gauges the borrowing frequency of a book, providing insights into the popularity and demand for specific titles.

### 8. Overdue Analysis
**Rationale:** This query lists all books overdue by more than 30 days along with their associated borrowers. It aids librarians in identifying and addressing long-overdue items.

### 9. Author Popularity using Aggregation
**Rationale:** By ranking authors based on the borrowing frequency of their books, this query helps the library understand the popularity of different authors among borrowers.

### 10. Genre Preference by Age using Group By and Having
**Rationale:** This query determines the preferred genre of different age groups of borrowers, allowing the library to tailor its collection to the diverse interests of the user base.

### 11. Stored Procedure - Borrowed Books Report
**Rationale:** The stored procedure generates a report of books borrowed within a specified date range, facilitating data-driven decision-making and reporting for the library.

### 12. Trigger Implementation
**Rationale:** The trigger logs an entry into the `AuditLog` table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa. This is crucial for maintaining an audit trail of status changes for accountability and monitoring purposes.

### 13. Overdue Report
**Rationale**: This stored procedure generates a report of borrowers who have overdue books, including each borrower's name, the count of overdue books, and the total overdue fee.

### 15. Weekly Peak Days Analysis
**Rationale:** The library is preparing to hire a part-time worker who will be present in the library for three days each week. To optimize staff scheduling, this analysis determines the top three weekdays with the highest loan activity. The results are presented as percentages of total loans, sorted from the highest to the lowest. For example, if 25.18% of loans occur on Monday, this information guides the library in efficiently allocating resources during the busiest days.


## Contact

If you have any questions, feedback, or need assistance with the Real-time Weather Monitoring and Reporting Service, feel free to get in touch with us:

- **Email:** tasbeh.takrore@gmail.com
- **GitHub:** [Tasbeeh Takrori](https://github.com/TasbehTakrore)
