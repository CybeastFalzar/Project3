CREATE TABLE [Courses].[ModeOfInstruction]
(
[InstructionType] [Courses].[ModeOfInstruction] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[ModeOfInstruction] ADD CONSTRAINT [PK_ModeOfInstruction] PRIMARY KEY CLUSTERED ([InstructionType]) ON [PRIMARY]
GO
