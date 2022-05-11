CREATE TABLE [dbo].[BridgeTable:ClassInstruction]
(
[Class] [Courses].[Class] NULL,
[ModeOfInstruction] [Courses].[ModeOfInstruction] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BridgeTable:ClassInstruction] ADD CONSTRAINT [ClassInstruction_Class] CHECK ((NOT [Class] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [dbo].[BridgeTable:ClassInstruction] ADD CONSTRAINT [Constraint_ModeOfInstruction] CHECK ((NOT [Modeofinstruction] like '%[^A-Z_ ]%'))
GO
