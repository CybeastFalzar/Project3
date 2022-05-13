CREATE TABLE [Staff].[Department]
(
[DepartmentID] [Department].[DepartmentID] NOT NULL IDENTITY(1, 1),
[DepartmentName] [Department].[DepartmentName] NULL,
[NumOfStaff] [Department].[NumStaff] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staff].[Department] ADD CONSTRAINT [Department_DepartmentID] CHECK ((NOT [DepartmentID] like '%[^0-9]%'))
GO
ALTER TABLE [Staff].[Department] ADD CONSTRAINT [Department_Numofstaff] CHECK ((NOT [Numofstaff] like '%[^0-9]%'))
GO
