CREATE TABLE [dbo].[BuildingRooms]
(
[BuildingName] [Location].[BuildingName] NULL,
[RoomNo] [Location].[RoomNo] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BuildingRooms] ADD CONSTRAINT [BR_BuildingName] CHECK ((NOT [BuildingName] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [dbo].[BuildingRooms] ADD CONSTRAINT [BR_RoomNo] CHECK ((NOT [RoomNo] like '%[^0-9]%'))
GO
