CREATE TABLE [Courses].[BridgeTable:ClassInstruction]
(
[Class] [Courses].[Class] NULL,
[ModeOfInstruction] [Courses].[ModeOfInstruction] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[BridgeTable:ClassInstruction] ADD CONSTRAINT [ClassInstruction_Class] CHECK ((NOT [Class] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Courses].[BridgeTable:ClassInstruction] ADD CONSTRAINT [Constraint_ModeOfInstruction] CHECK ((NOT [Modeofinstruction] like '%[^A-Z_ ]%'))
GO
