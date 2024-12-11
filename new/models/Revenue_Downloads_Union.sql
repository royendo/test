-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models
-- @materialize: true

select 
  "datetime",
  "Advertiser",
  "Publisher",
  "Sales Channel Type",
  "Category",
  "Show",
  "Metrics", 
  "Advertiser Domain",
  "Zone Position",
  "Revenue",
  "Min_Guarantee",
  "percent_to_goal",

  NULL as "Episode",
  NULL as "Downloads",
  NULL as "DOWNLOAD_TYPE",
  
  from revenue_model 

UNION all

select 
  "datetime",
  NULL AS "Advertiser",
   NULL AS "Publisher",
   NULL AS"Sales Channel Type",
   NULL AS"Category",
  "Program" as "Show",
   NULL AS "Metrics", 
   NULL AS "Advertiser Domain",
   NULL AS "Zone Position",
   NULL AS "Revenue",
   NULL AS "Min_Guarantee",
   NULL AS "percent_to_goal",

  "Episode",
  "Downloads",
  'Download' as "DOWNLOAD_TYPE",
  
  from "DOWNLOADS"

UNION all

select 
  "Date" as "datetime",
  NULL AS "Advertiser",
   NULL AS "Publisher",
   NULL AS"Sales Channel Type",
   NULL AS"Category",
  "Channel title" as "Show",
   NULL AS "Metrics", 
   NULL AS "Advertiser Domain",
   NULL AS "Zone Position",
   NULL AS "Revenue",
   NULL AS "Min_Guarantee",
   NULL AS "percent_to_goal",

  "Channel" as "Episode",
  "Views" as "Downloads",
  'Youtube' as "DOWNLOAD_TYPE",
  
  from "DOWNLOADS_Youtube"