CREATE TABLE [dbo].[ModeOfInstruction]
(
[InstructionType] [Courses].[ModeOfInstruction] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModeOfInstruction] ADD CONSTRAINT [Courses_ModeOfInstruction] CHECK (([InstructionType] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [dbo].[ModeOfInstruction] ADD CONSTRAINT [PK_ModeOfInstruction] PRIMARY KEY CLUSTERED ([InstructionType]) ON [PRIMARY]
GO
