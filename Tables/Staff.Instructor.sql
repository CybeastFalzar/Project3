CREATE TABLE [Staff].[Instructor]
(
[InstructorID] [Staff].[InstructorID] NOT NULL,
[FirstName] [Staff].[FirstName] NULL,
[LastName] [Staff].[LastName] NULL,
[FullName] [Staff].[FullName] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Instructor_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Instructor_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Staff].[Instructor] ADD CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([InstructorID]) ON [PRIMARY]
GO
