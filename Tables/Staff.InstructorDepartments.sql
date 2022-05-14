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
CREATE NONCLUSTERED INDEX [FullName] ON [Staff].[InstructorDepartments] ([FullName]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Departments] ON [Staff].[InstructorDepartments] ([InstructorID], [DepartmentID], [DepartmentName]) ON [PRIMARY]
GO
ALTER TABLE [Staff].[InstructorDepartments] ADD CONSTRAINT [FK_InstructorDepartments_Department] FOREIGN KEY ([DepartmentName]) REFERENCES [Staff].[Department] ([DepartmentName])
GO
ALTER TABLE [Staff].[InstructorDepartments] ADD CONSTRAINT [FK_InstructorDepartments_Instructor] FOREIGN KEY ([InstructorID]) REFERENCES [Staff].[Instructor] ([InstructorID])
GO
