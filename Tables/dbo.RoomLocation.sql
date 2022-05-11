CREATE TABLE [dbo].[RoomLocation]
(
[RoomNo] [Location].[RoomNo] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoomLocation] ADD CONSTRAINT [InstructorDepartments_RoomNo] CHECK (([RoomNo] like '%[^A-Z0-9_ ]%'))
GO
