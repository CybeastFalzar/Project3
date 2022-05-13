CREATE TABLE [DbSecurity].[UserAuthorization]
(
[UserAuthorizationKey] [int] NOT NULL,
[ClassTime] [nchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_UserAuthorization_ClassTime] DEFAULT (N'9:15'),
[IndividualProject] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_UserAuthorization_IndividualProject] DEFAULT (N'Project 2 Recreate the BIClass Database Star Schema'),
[GroupMemberLastName] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GroupMemberFirstName] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GroupName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateAdded] [datetime2] NULL CONSTRAINT [DF_UserAuthorization_DateAdded] DEFAULT (sysdatetime())
) ON [PRIMARY]
GO
