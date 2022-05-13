CREATE TABLE [Courses].[CourseClass]
(
[CourseID] [Courses].[CourseID] NOT NULL,
[CourseName] [Courses].[CourseName] NULL,
[Class] [Courses].[Class] NULL,
[SectionNo] [Courses].[SectionNo] NULL,
[ModeOfInstruction] [Courses].[ModeOfInstruction] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_CourseClass_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_CourseClass_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [FK_CourseClass_Class] FOREIGN KEY ([Class]) REFERENCES [Courses].[Class] ([Class])
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [FK_CourseClass_Course] FOREIGN KEY ([CourseID]) REFERENCES [Courses].[Course] ([CourseID])
GO
ALTER TABLE [Courses].[CourseClass] ADD CONSTRAINT [FK_CourseClass_ModeOfInstruction] FOREIGN KEY ([ModeOfInstruction]) REFERENCES [Courses].[ModeOfInstruction] ([InstructionType])
GO
