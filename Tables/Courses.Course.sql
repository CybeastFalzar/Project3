CREATE TABLE [Courses].[Course]
(
[CourseID] [Courses].[CourseID] NULL,
[CourseName] [Courses].[CourseName] NULL,
[Department] [Department].[DepartmentName] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[Course] ADD CONSTRAINT [Course_CourseId] CHECK ((NOT [CourseId] like '%[^0-9_ ]%'))
GO
ALTER TABLE [Courses].[Course] ADD CONSTRAINT [Course_CourseName] CHECK ((NOT [CourseName] like '%[^A-Z0-9_ ]%'))
GO
ALTER TABLE [Courses].[Course] ADD CONSTRAINT [Course_Department] CHECK ((NOT [Department] like '%[^A-Z0-9_& ]%'))
GO
