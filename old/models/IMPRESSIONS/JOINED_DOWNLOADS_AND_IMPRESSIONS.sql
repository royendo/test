-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

WITH Aggregated_Downloads AS (
    SELECT 
        date,
        MAX("Episode") AS Episode,  -- Use MAX or another function if needed to avoid duplicate rows
        MAX("Program Name") AS "Program Name",
        SUM(Downloads) AS Downloads
    FROM 
        COALESCE_DOWNLOADS
    GROUP BY 
        date
),
Aggregated_Programmatic AS (
    SELECT 
        date,
        SUM(Impressions) AS Impressions
    FROM 
        PROGRAMMATIC_model
    GROUP BY 
        date
)
SELECT 
    COALESCE(Aggregated_Downloads.date, Aggregated_Programmatic.date) AS date,
    Aggregated_Downloads.Episode,
    Aggregated_Downloads."Program Name",
    Aggregated_Downloads.Downloads,
    Aggregated_Programmatic.Impressions
FROM 
    Aggregated_Downloads
FULL OUTER JOIN 
    Aggregated_Programmatic 
ON 
    Aggregated_Downloads.date = Aggregated_Programmatic.date
