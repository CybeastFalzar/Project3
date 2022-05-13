SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	Lamyea Hoque
-- Create date: 05/13/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[Load_BuildingLocation] @UserAuthorizationKey AS INT
AS
BEGIN
	    DECLARE @StartTime DATETIME2 = SYSDATETIME();

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    INSERT INTO Location.BuildingLocation
    (
        BuildingName,
		UserAuthorizationKey
    )
    SELECT DISTINCT
           SUBSTRING([Location], 1, 2), @UserAuthorizationKey
    FROM Uploadfile.NormalizedCourseOffering
    WHERE [Location] != 'TBA';

    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM Location.BuildingLocation
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the BuildingLocation Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;




END;
GO
