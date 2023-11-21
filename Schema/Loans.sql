USE [TechLib]
GO

/****** Object:  Table [dbo].[Loans]    Script Date: 11/21/2023 7:02:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Loans](
	[Loan ID] [int] IDENTITY(1,1) NOT NULL,
	[Book ID] [int] NOT NULL,
	[Borrower ID] [int] NOT NULL,
	[Date Borrowed] [date] NOT NULL,
	[Due Date] [date] NOT NULL,
	[Date Returned] [date] NULL,
 CONSTRAINT [PK_Loans] PRIMARY KEY CLUSTERED 
(
	[Loan ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Loans_Borrowers] FOREIGN KEY([Borrower ID])
REFERENCES [dbo].[Borrowers] ([Borrower ID])
GO

ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Loans_Borrowers]
GO


