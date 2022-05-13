CREATE TABLE [Location].[RoomLocation]
(
[RoomNo] [Location].[RoomNo] NOT NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_RoomLocation_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_RoomLocation_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Location].[RoomLocation] ADD CONSTRAINT [PK_RoomLocation] PRIMARY KEY CLUSTERED ([RoomNo]) ON [PRIMARY]
GO
