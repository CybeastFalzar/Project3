CREATE TABLE [Location].[BuildingRooms]
(
[BuildingName] [Location].[BuildingName] NULL,
[RoomNo] [Location].[RoomNo] NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_BuildingRooms_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_BuildingRooms_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
