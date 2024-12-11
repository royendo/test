-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

SELECT 
    CAST(strptime(date, '%m/%d/%Y') AS DATE) AS date,
    Publisher,
    Advertiser,
    Metrics,
    
    sales
  
  from "BNB_model"