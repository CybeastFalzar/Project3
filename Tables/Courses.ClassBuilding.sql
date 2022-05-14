CREATE TABLE [Courses].[ClassBuilding]
(
[Class] [Courses].[Class] NULL,
[BuildingName] [Location].[BuildingName] NULL,
[RoomNo] [Location].[RoomNo] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Courses].[ClassBuilding] ADD CONSTRAINT [FK_ClassBuilding_BuildingLocation] FOREIGN KEY ([BuildingName]) REFERENCES [Location].[BuildingLocation] ([BuildingName])
GO
ALTER TABLE [Courses].[ClassBuilding] ADD CONSTRAINT [FK_ClassBuilding_Class] FOREIGN KEY ([Class]) REFERENCES [Courses].[Class] ([Class])
GO
ALTER TABLE [Courses].[ClassBuilding] ADD CONSTRAINT [FK_ClassBuilding_RoomLocation] FOREIGN KEY ([RoomNo]) REFERENCES [Location].[RoomLocation] ([RoomNo])
GO
