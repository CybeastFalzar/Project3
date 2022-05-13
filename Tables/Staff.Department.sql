CREATE TABLE [Staff].[Department]
(
[DepartmentID] [Department].[DepartmentID] NOT NULL,
[DepartmentName] [Department].[DepartmentName] NULL,
[NumOfStaff] [Department].[NumStaff] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_Department_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_Department_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
