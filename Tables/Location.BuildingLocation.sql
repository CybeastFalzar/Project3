CREATE TABLE [Location].[BuildingLocation]
(
[BuildingName] [Location].[BuildingName] NOT NULL,
[UserAuthorizationKey] [int] NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_BuildingLocation_DateAdded] DEFAULT (sysdatetime()),
[DateOfLastUpdate] [datetime2] NULL CONSTRAINT [DF_BuildingLocation_DateOfLastUpdate] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
ALTER TABLE [Location].[BuildingLocation] ADD CONSTRAINT [Location_BuildingName] CHECK ((NOT [BuildingName] like '%[^A-Z_ ]%'))
GO
ALTER TABLE [Location].[BuildingLocation] ADD CONSTRAINT [PK_BuildingLocation] PRIMARY KEY CLUSTERED ([BuildingName]) ON [PRIMARY]
GO
