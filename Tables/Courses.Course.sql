CREATE TABLE [Courses].[Course]
(
[CourseID] [Courses].[CourseID] NOT NULL,
[CourseName] [Courses].[CourseName] NULL,
[Department] [Department].[DepartmentName] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Course_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Course_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[Course] ADD CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([CourseID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CourseName] ON [Courses].[Course] ([CourseName], [Department]) ON [PRIMARY]
GO
ALTER TABLE [Courses].[Course] ADD CONSTRAINT [FK_Course_Department] FOREIGN KEY ([Department]) REFERENCES [Staff].[Department] ([DepartmentName])
GO
