CREATE TABLE [Courses].[ModeOfInstruction]
(
[InstructionType] [Courses].[ModeOfInstruction] NOT NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_ModeOfInstruction_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_ModeOfInstruction_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[ModeOfInstruction] ADD CONSTRAINT [PK_ModeOfInstruction] PRIMARY KEY CLUSTERED ([InstructionType]) ON [PRIMARY]
GO
