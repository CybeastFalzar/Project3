SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	
-- Create date: 05/13/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[Load_ClassBuilding] @UserAuthorizationKey AS INT
AS
BEGIN
    DECLARE @StartTime DATETIME2 = SYSDATETIME();

    INSERT INTO Courses.ClassBuilding
    (
        Class,
        BuildingName,
        RoomNo
    )
    SELECT DISTINCT
           C.Class,
           BR.BuildingName,
           BR.RoomNo
    FROM Uploadfile.NormalizedCourseOffering AS NCO
        INNER JOIN Courses.Class AS C
            ON C.Class = NCO.Description
        INNER JOIN Location.BuildingRooms AS BR
            ON CONCAT(BR.BuildingName, ' ', BR.RoomNo) = NCO.Location
    ORDER BY C.Class;

    DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Courses.ClassBuilding
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the ClassBuilding Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;




END;
GO
