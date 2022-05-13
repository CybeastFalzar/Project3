CREATE TABLE [Location].[BuildingRooms]
(
[BuildingName] [Location].[BuildingName] NULL,
[RoomNo] [Location].[RoomNo] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_BuildingRooms_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_BuildingRooms_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Location].[BuildingRooms] ADD CONSTRAINT [FK_BuildingRooms_BuildingLocation] FOREIGN KEY ([BuildingName]) REFERENCES [Location].[BuildingLocation] ([BuildingName])
GO
ALTER TABLE [Location].[BuildingRooms] ADD CONSTRAINT [FK_BuildingRooms_RoomLocation] FOREIGN KEY ([RoomNo]) REFERENCES [Location].[RoomLocation] ([RoomNo])
GO
