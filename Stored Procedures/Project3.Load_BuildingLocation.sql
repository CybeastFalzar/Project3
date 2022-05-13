SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	Lamyea Hoque
-- Create date: 05/13/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[Load_BuildingLocation]
AS
BEGIN


    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    INSERT INTO Location.BuildingLocation
    (
        BuildingName
    )
    SELECT DISTINCT
           SUBSTRING([Location], 1, 2)
    FROM Uploadfile.NormalizedCourseOffering
    WHERE [Location] != 'TBA';

END;
GO
