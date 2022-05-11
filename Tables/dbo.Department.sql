CREATE TABLE [dbo].[Department]
(
[DepartmentID] [Department].[DepartmentID] NULL,
[DepartmentName] [Department].[DepartmentName] NULL,
[NumOfStaff] [Department].[NumStaff] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [Department_DepartmentID] CHECK ((NOT [DepartmentID] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [Department_DepartmentName] CHECK ((NOT [DepartmentName] like '%[^A-Z0-9_ ]%'))
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [Department_Numofstaff] CHECK ((NOT [Numofstaff] like '%[^0-9]%'))
GO
