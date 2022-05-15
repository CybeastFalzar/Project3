SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Process].[usp_ShowWorkflowSteps]
AS
BEGIN
SELECT WFS.WorkFlowStepKey,
       WFS.WorkFlowStepDescription,
       WFS.WorkFlowStepTableRowCount,
       WFS.StartingDateTime,
       WFS.EndingDateTime,
       WFS.ClassTime,
       WFS.UserAuthorizationKey
FROM Process.WorkflowSteps AS WFS
END
GO
