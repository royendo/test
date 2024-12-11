-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select 
    TRIM(SPLIT_PART(Time, '/', 1))::DATE AS date,
   -- TRIM(SPLIT_PART(Time, '/', 2))::DATE AS end_date,
      "Publisher",
      "Advertiser",
      "Audio Impressions",
      "Total Revenue (USD)"
  

  
  from RILL_TEST___DIRECT