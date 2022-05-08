CREATE TABLE [dbo].[ModeOfInstruction]
(
[InstructionType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModeOfInstruction] ADD CONSTRAINT [PK_ModeOfInstruction] PRIMARY KEY CLUSTERED ([InstructionType]) ON [PRIMARY]
GO
