-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select 
  CAST(TRIM(SPLIT_PART("Time", '/', 1)) AS DATE) AS datetime,
  "Publisher",
  CASE 
    WHEN "Sales Channel Type" = 'ADWAVE' THEN 'PROGRAMMATIC'
    ELSE "Sales Channel Type"
 END AS "Sales Channel Type",
  "Advertiser Domain",
  "Zone Position",

  "Net Revenue (USD)",
  "Impressions",
  "eCPM (USD)",
  "Gross Revenue (USD)",

  from Direct_DAI