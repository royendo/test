-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select  
    CAST(TRIM(SPLIT_PART(i."Time", '/', 1)) AS DATE) AS datetime,
  i."Publisher",
  i."Zone Position",
  i."Inventory",
  CASE 
    WHEN d."Sales Channel Type" = 'ADWAVE' THEN 'PROGRAMMATIC'
    ELSE d."Sales Channel Type"
 END AS "Sales Channel Type",
  d."Advertiser Domain",
  d."Impressions" as 'Delivered Impressions'
  
  
  from INVENTORY i 
left join "Direct_DAI" d
on d."Publisher" = i."Publisher" 
and d."Time" = i."Time"
and d."Zone Position" = i."Zone Position"