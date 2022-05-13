CREATE TABLE [Courses].[Course]
(
[CourseID] [Courses].[CourseID] NULL,
[CourseName] [Courses].[CourseName] NULL,
[Department] [Department].[DepartmentName] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Course_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Course_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
