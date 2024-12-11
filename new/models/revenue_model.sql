-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

-- join direct_DAI / PROGRAMMATIC and BAKED_IN
WITH combined_data AS (

select
    datetime,
    NULL as "Publisher", -- from DAI_model
    Advertiser,
    "Sales Channel Type",
  
    TRIM(SPLIT_PART(Product, '|', 1)) AS Category, 
    TRIM(SPLIT_PART(Product, '|', 2)) AS Show,   
    Metrics,

    NULL AS "Advertiser Domain", -- from DAI_model
    NULL As "Zone Position", -- from DAI_model
  
    Revenue,
    
from union_baked_in

UNION ALL 

select 
  datetime,
  "Publisher",
  NULL as "Advertiser", -- from baked_in
  "Sales Channel Type",

  NULL As  Category, -- from baked_in
  NULL As  Show, -- from baked_in
  NULL AS  Metrics, -- from baked_in
  
  "Advertiser Domain",
  "Zone Position",

  "Net Revenue (USD)",
  from Direct_DAI_model

),

data_joined_guarantee AS (
    SELECT
        cd.*,
        CAST(
            COALESCE(
                CAST(REPLACE(REPLACE(mg."MG / per month??", '$', ''), ',', '') AS DOUBLE), 
                125000
            ) AS DOUBLE
        ) AS Min_Guarantee,
        (Revenue / Min_Guarantee) * 100 AS percent_to_goal
    FROM combined_data cd
    LEFT JOIN Min_Guarantee mg
    ON LOWER(cd.Show) LIKE LOWER('%' || mg."Show" || '%') -- Less strict match on Show
)

select * from data_joined_guarantee WHERE "Advertiser" NOT LIKE 'Sum %'