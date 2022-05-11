CREATE TABLE [Staff].[InstructorDepartments]
(
[InstructorID] [Staff].[InstructorID] NULL,
[FullName] [Staff].[FullName] NULL,
[DepartmentID] [Department].[DepartmentID] NULL,
[DepartmentName] [Department].[DepartmentName] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staff].[InstructorDepartments] ADD CONSTRAINT [InstructorDepartments_DepartmentID] CHECK (([DepartmentID] like '%[^0-9]%'))
GO
ALTER TABLE [Staff].[InstructorDepartments] ADD CONSTRAINT [InstructorDepartments_DepartmentName] CHECK (([DepartmentName] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Staff].[InstructorDepartments] ADD CONSTRAINT [InstructorDepartments_FullName] CHECK (([InstructorID] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Staff].[InstructorDepartments] ADD CONSTRAINT [InstructorDepartments_InstructorID] CHECK (([InstructorID] like '%[^0-9]%'))
GO
