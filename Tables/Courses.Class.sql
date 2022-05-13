CREATE TABLE [Courses].[Class]
(
[ClassID] [int] NOT NULL,
[Class] [Courses].[Class] NULL,
[NumberOfClasses] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[Class] ADD CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([ClassID]) ON [PRIMARY]
GO
