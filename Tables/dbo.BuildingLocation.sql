CREATE TABLE [dbo].[BuildingLocation]
(
[BuildingName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BuildingLocation] ADD CONSTRAINT [PK_BuildingLocation] PRIMARY KEY CLUSTERED ([BuildingName]) ON [PRIMARY]
GO
