CREATE TABLE [Location].[RoomLocation]
(
[RoomNo] [Location].[RoomNo] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Location].[RoomLocation] ADD CONSTRAINT [PK_RoomLocation] PRIMARY KEY CLUSTERED ([RoomNo]) ON [PRIMARY]
GO
