CREATE TABLE [Staff].[InstructorDepartments]
(
[InstructorID] [Staff].[InstructorID] NULL,
[FullName] [Staff].[FullName] NULL,
[DepartmentID] [Department].[DepartmentID] NULL,
[DepartmentName] [Department].[DepartmentName] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_InstructorDepartments_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_InstructorDepartments_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
