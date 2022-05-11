CREATE TABLE [Courses].[CourseClass]
(
[CourseID] [Courses].[CourseID] NULL,
[CourseName] [Courses].[CourseName] NULL,
[Class] [Courses].[Class] NULL,
[SectionNo] [Courses].[SectionNo] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [CourseClass_CourseId] CHECK ((NOT [CourseId] like '%[^0-9]%'))
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [CourseClass_CourseName] CHECK ((NOT [CourseName] like '%[^A-Z0-9_ ]%'))
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [CourseClass_SectionNo] CHECK ((NOT [SectionNo] like '%[^0-9]%'))
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [CourseClass_class] CHECK ((NOT [Class] like '%[^A-Z_ ]%'))
GO
