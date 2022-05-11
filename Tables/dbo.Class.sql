CREATE TABLE [dbo].[Class]
(
[ClassID] [int] NOT NULL,
[Class] [Courses].[Class] NULL,
[CourseID] [Courses].[CourseID] NULL,
[SectionNo.] [Courses].[SectionNo] NULL,
[ModeOfInstruction] [Courses].[ModeOfInstruction] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [Class_ClassId] CHECK ((NOT [ClassId] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [Class_CourseId] CHECK ((NOT [CourseId] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [Class_ModeOfinstruction] CHECK ((NOT [ModeOfinstruction] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [Class_SectionNo.] CHECK ((NOT [SectionNo.] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([ClassID]) ON [PRIMARY]
GO
