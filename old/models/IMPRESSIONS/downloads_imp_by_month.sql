-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

SELECT 
    DATE_TRUNC('month', date) AS month,
    SUM(Downloads) AS total_downloads,
    SUM(Impressions) AS total_impressions
FROM "JOINED_DOWNLOADS_AND_IMPRESSIONS"
GROUP BY month
ORDER BY month
