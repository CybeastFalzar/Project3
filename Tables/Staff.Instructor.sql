CREATE TABLE [Staff].[Instructor]
(
[InstructorID] [Staff].[InstructorID] NOT NULL,
[FirstName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Instructor_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Instructor_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Staff].[Instructor] ADD CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([InstructorID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FirstName] ON [Staff].[Instructor] ([FirstName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [LastName] ON [Staff].[Instructor] ([LastName]) ON [PRIMARY]
GO
