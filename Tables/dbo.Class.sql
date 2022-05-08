CREATE TABLE [dbo].[Class]
(
[ClassID] [int] NOT NULL,
[CourseID] [int] NULL,
[SectionNo.] [int] NULL,
[ModeOfInstruction] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([ClassID]) ON [PRIMARY]
GO
