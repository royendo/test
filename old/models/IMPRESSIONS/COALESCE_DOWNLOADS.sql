-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models
SELECT 
    COALESCE(IMPRESSIONS_model.date, RILL_TEST___Daily_Impressions."Day") AS date,
    IMPRESSIONS_model."Episode",
    IMPRESSIONS_model."Program Name",
    COALESCE(IMPRESSIONS_model."Downloads", RILL_TEST___Daily_Impressions."Downloads") AS Downloads,
FROM 
    IMPRESSIONS_model
FULL OUTER JOIN 
    RILL_TEST___Daily_Impressions 
ON 
    IMPRESSIONS_model.date = RILL_TEST___Daily_Impressions."Day"
