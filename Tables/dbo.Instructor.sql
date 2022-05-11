CREATE TABLE [dbo].[Instructor]
(
[InstructorID] [Staff].[InstructorID] NOT NULL,
[FirstName] [Staff].[FirstName] NULL,
[LastName] [Staff].[LastName] NULL,
[FullName] [Staff].[FirstName] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [Instructor_FirstName] CHECK (([FirstName] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [Instructor_FullName] CHECK (([InstructorID] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [Instructor_InstructorID] CHECK (([InstructorID] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [Instructor_LastName] CHECK (([LastName] like '%[^A-Z_ ]%'))
GO
