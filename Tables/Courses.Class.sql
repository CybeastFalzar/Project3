CREATE TABLE [Courses].[Class]
(
[ClassID] [Courses].[CourseID] NOT NULL,
[Class] [Courses].[Class] NOT NULL,
[NumberOfClasses] [int] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Class_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Class_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[Class] ADD CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([Class]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [I_NumberOfClasses] ON [Courses].[Class] ([NumberOfClasses]) ON [PRIMARY]
GO
