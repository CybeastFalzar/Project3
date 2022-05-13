CREATE TABLE [Courses].[CourseClass]
(
[CourseID] [Courses].[CourseID] NULL,
[CourseName] [Courses].[CourseName] NULL,
[Class] [Courses].[Class] NULL,
[SectionNo] [Courses].[SectionNo] NULL,
[ModeOfInstruction] [Courses].[ModeOfInstruction] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_CourseClass_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_CourseClass_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
