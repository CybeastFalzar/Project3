CREATE TABLE [Staff].[Department]
(
[DepartmentID] [Department].[DepartmentID] NOT NULL,
[DepartmentName] [Department].[DepartmentName] NOT NULL,
[NumOfStaff] [Department].[NumStaff] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Department_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Department_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Staff].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([DepartmentName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NumberOfStaff] ON [Staff].[Department] ([NumOfStaff]) ON [PRIMARY]
GO
